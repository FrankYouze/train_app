import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:train_app/components/sideMenu.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.1811, 35.7469),
    zoom: 8,
  );

  @override
  State<MapPage> createState() => _gMapPageState();
}

class _gMapPageState extends State<MapPage> {
  int _selectedIndex = 0;
  List<LatLng> _roadCoordinates = []; // List to hold road coordinates
  late double lati = 0;
  late double long = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      _fetchRoadCoordinates();
     
      _getLocation().then((value) {
        lati = double.parse('${value.latitude}');
        long = double.parse('${value.longitude}');

        print("lati" + '$lati');
         print("long" + "$long");
      });

       _createMarkers();
    });
  }
  

  Future<Position> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('enable location');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return Future.error("permision denied");
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _fetchRoadCoordinates() async {
    final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?origin=-6.7924,39.2083&destination=-6.8224,37.6616&key=AIzaSyCi8N145aXDsY2znrwK6RxG9p1X8sKa-cU',
    ));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      // Extract coordinates from the response and add them to _roadCoordinates list
      setState(() {
        _roadCoordinates = _decodePolyline(
            decodedResponse['routes'][0]['overview_polyline']['points']);
      });
    } else {
      throw Exception('Failed to load road coordinates');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      double latitude = lat / 1E5;
      double longitude = lng / 1E5;
      points.add(LatLng(latitude, longitude));
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maps',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [IconButton(icon: Icon( Icons.logout),onPressed: () {
            FirebaseAuth.instance.signOut();
        },)],
      ),
      drawer: SideMenu(),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   onPressed: _launchTelegram,child:Icon(Icons.help,color: Colors.white,)),
      body: GoogleMap(
        initialCameraPosition: MapPage._kGooglePlex,
        mapType: MapType.normal,
        markers: _createMarkers(),
        polylines: {
          Polyline(
            polylineId: PolylineId('sgr_route'),
            points: _roadCoordinates,
            color: Colors.blue,
            width: 5,
          ),
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          //onTap: _bottonNavigation,
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[100],
          type: BottomNavigationBarType.fixed,
          items:  [
            BottomNavigationBarItem(icon: Icon(Icons.map,color: Colors.white,), label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.train,color: Colors.white,), label: "Trains"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_rounded,color: Colors.white,), label: "contribute"),
            BottomNavigationBarItem(
                icon: IconButton(icon:Icon(Icons.help_center,color: Colors.white),onPressed: _launchTelegram,), label: "Updates" ),
          ],
        ),
      ),
    );
  }

  Set<Polyline> _createPolylines() {
    return {
      Polyline(
        polylineId: PolylineId('sgr_route'),
        points: [
          LatLng(-6.7924, 39.2083), // Dar es Salaam terminal
          LatLng(-6.8224, 37.6616), // Morogoro terminal
          // Add more points for other terminals or stops along the route
        ],
        color: Colors.blue,
        width: 5,
      ),
      // Add more polylines for additional routes if needed
    };
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId('dar_es_salaam'),
        position: LatLng(-6.7924, 39.2083), // Dar es Salaam terminal
        infoWindow: InfoWindow(title: 'Dar es Salaam Terminal'),
      ),
      Marker(
        markerId: MarkerId('morogoro'),
        position: LatLng(-6.8224, 37.6616), // Morogoro terminal
        infoWindow: InfoWindow(title: 'Morogoro Terminal'),
      ),
      Marker(
          markerId: MarkerId("USER"),
          position: LatLng(lati, long))
      // Add more markers for other terminals if needed
    };
  }

  void _launchTelegram() async {
  Uri url = Uri.parse('https://t.me/nittreni_bot'); 
  if (await canLaunchUrl(url)) {
    await launchUrl(url,mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
}
