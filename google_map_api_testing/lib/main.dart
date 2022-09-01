import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_map_api_testing/contants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MapScreen(),
    ),
  );
}
class MapScreen extends StatefulWidget {
  
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final Completer<GoogleMapController>_controller = Completer();
  static const LatLng sourceLocation = LatLng(24.8949, 91.8687);
  static const LatLng destination = LatLng(24.8948, 91.8690);
  
  List<LatLng>polylineCoordinates = [];

  LocationData? currentLocation;

  void getCurrentLocation(){
    Location location = Location();
    location.getLocation().then((location){
      currentLocation = location;
    });
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      setState(() {});
    });
  }

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, 
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude), 
      PointLatLng(destination.latitude, destination.longitude),
      );
      if(result.points.isNotEmpty){
        result.points.forEach((PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
          ),
        );
        setState(() {});
      }
  }

  @override
  void initState(){
    getCurrentLocation();
    getPolyPoints();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null? const Center(child: Text("Loading"),) : GoogleMap(
        //mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            currentLocation!.latitude!, currentLocation!.longitude!
          ),
          zoom: 13.5,
        ),
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: const Color.fromARGB(255, 2, 62, 4),
            width: 6,
          ),
        },
        markers: { 
          Marker(
          markerId: const MarkerId("source"),
          position: LatLng(
            currentLocation!.latitude!,currentLocation!.longitude!
          ),
          ),
          const Marker(
          markerId: MarkerId("source"),
          position: sourceLocation,
          ),
          const Marker(
          markerId: MarkerId("destination"),
          position: destination,
          ),
        }
        // onMapCreated: (mapController){
        //   _controller.complete(mapController);
        // },
      ),
    );
  }
}