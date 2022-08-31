import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_map_api_testing/contants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      home: MapScreen(),
    ),
  );
}
class MapScreen extends StatefulWidget {
  
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final Completer<GoogleMapController>_controller = Completer();
  static const LatLng sourceLocation = LatLng(37.00500926, -122.0327188);
  static const LatLng destination = LatLng(33.33429383, -122.06600055);
  
  List<LatLng>polylineCoordinates = [];

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, 
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude), 
      PointLatLng(destination.latitude, destination.longitude),
      );
      if(result.points.isNotEmpty){
        result.points.forEach((PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude)
          ),
        );
        setState(() {
          
        });
      }
  }

  @override
  void initState(){
    getPolyPoints();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: sourceLocation,
          zoom: 13.5,
        ),
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Color.fromARGB(255, 2, 62, 4),
            width: 6,
          ),
        },
        markers: { 
          Marker(
          markerId: MarkerId("source"),
          position: sourceLocation,
          ),
          Marker(
          markerId: MarkerId("destination"),
          position: destination,
          ),
        }
      ),
    );
  }
}