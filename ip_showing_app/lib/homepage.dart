import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ip_showing_app/configresponse.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ip_showing_app/mappage.dart';
import 'package:map_launcher/map_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<dynamic>?values;
  //List<ConfigResponse>?type;

  String _IPdata = "", _isp = "", _location = "";
  late double _latitude, _longitude;
  Future getData() async {
    Uri url = Uri.https("ifconfig.co", "json");
    http.Response response = await http.get(url);
    //setState(() {
    Map<String, dynamic> json = jsonDecode(response.body);
    setState(() {
      _IPdata = json["ip"];
      _isp = json["asn_org"];
      _location = json["city"] + ", " + json["country"];
      _latitude = json["latitude"];
      _longitude = json["longitude"];
      //     final CameraPosition _kGooglePlex = CameraPosition(
      //   target: LatLng(_latitude, _longitude),
      //   zoom: 14.4746,
      // );
    });
    //});
    //Map<String, dynamic> json = jsonDecode(response.body);
    //var jsonData = jsonDecode(response.body);
    //List<ConfigResponse>data = [];

    // for(var u in jsonData){
    //   ConfigResponse configResponse = ConfigResponse(u['ip']);
    //   data.add(configResponse);
    // }
    //return data;
    //ConfigResponse configResponse = ConfigResponse.fromJson(json);
    //values?.add(configResponse.ipAddress);
    //values = json.map((dynamic item) => ConfigResponse.fromJson(item)).toList();
    // setState(() {

    // });
    //values = json.map((dynamic item) => ConfigResponse.fromJson(item)).toList();
    //values = configResponse.toString() as List?;
    //List<dynamic>?data;
    //data?.add(configResponse.ipAddress);
    //return data;
    //print(configResponse.ipAddress);
    //values = configResponse as List?;
    //type = json.map((dynamic item) => ConfigResponse.fromJson(item)).toList();
  }

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("IP Adress Showing"),
          centerTitle: true,
        ),
        // body: Container(
        //   child: Card(
        //     child: FutureBuilder(
        //       future: getData(),
        //       builder: (context, snapshot){
        //         if(snapshot.data == null){
        //           return Container(child: Text("Loading"),);
        //         }
        //         else{
        //           return ListView.builder(itemBuilder: (context, i){
        //             return ListTile(
        //               title: Text(snapshot.data[i].ip),
        //             );
        //           });
        //         }
        //       }
        //     ),
        //   ),
        // ),
        body: Column(
          children: [
            Container(
              //color: Colors.amber,
              margin: EdgeInsets.symmetric(
                horizontal: 90,
                vertical: 40,
              ),
              height: 100,
              width: 230,
              child: Column(
                children: [
                  Text(
                    "IP Address",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                      color: Color.fromARGB(31, 172, 153, 153),
                      elevation: 30,
                      child: Text(
                        _IPdata,
                        style: const TextStyle(fontSize: 25),
                      )),
                  //SizedBox(height: 20,),
                  // Text(
                  //   "ISP Name",
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //   ),
                  // ),
                  // SizedBox(height: 20,),
                ],
              ),
            ),
            //SizedBox(height: 20,),
            Text(
              "ISP Provider",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
                color: Color.fromARGB(31, 172, 153, 153),
                elevation: 30,
                child: Text(
                  _isp,
                  style: const TextStyle(fontSize: 25),
                )),
            SizedBox(
              height: 52,
            ),
            Text(
              "Location",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
                color: Color.fromARGB(31, 172, 153, 153),
                elevation: 30,
                child: Text(
                  _location,
                  style: const TextStyle(fontSize: 25),
                )),
            SizedBox(
              height: 52,
            ),
            ElevatedButton(
              onPressed: () async {
                final availableMaps = await MapLauncher.installedMaps;
//print(availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                await availableMaps.first.showMarker(
                  coords: Coords(_latitude, _longitude),
                  title: _location,
                );
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                //   return MapPage();
                // }));
                // setState(() {
                //   final CameraPosition _kGooglePlex = CameraPosition(
                //     target: LatLng(_latitude, _longitude),
                //     zoom: 14.4746,
                //   );
                // });
              },
              child: Text("Show on map"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(146, 1, 0, 0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
