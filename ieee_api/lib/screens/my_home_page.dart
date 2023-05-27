import 'package:flutter/material.dart';
import 'package:ieee_api/constants/colors.dart';
import 'package:http/http.dart' as http;
class MyHomePage extends StatelessWidget {

  fetchData() async{
    //var url = await http.get("https://ieeexploreapi.ieee.org/api/v1/search/articles?parameter&apikey=ahqyahspb8unytwr4a7kw9td");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IEEE Feed"),
        backgroundColor: ieeeBlue,
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot){
          return ListView.builder(
            itemBuilder: (context, index){

            },
          );
        },
      ),
    );
  }
}