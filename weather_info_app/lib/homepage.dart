import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Dhaka	23.7289	90.3944
// Chattogram	22.3350	91.8325
// Khulna	22.8167	89.5500
// Sylhet	24.9000	91.8667
// Rājshāhi	24.3667	88.6000
// Mymensingh	24.7504	90.3800
// Barishal	22.7000	90.3667
// Comilla	23.4500	91.2000
// Rangpur	25.7500	89.2500

  List<String> items = [
    'Dhaka',
    'Sylhet',
    'Chattogram',
    'Khulna',
    'Rājshāhi',
    'Mymensingh',
    'Barishal',
    'Comilla'
  ];
  String value = "Dhaka";
  Map<String, dynamic> mpLat = {
    'Dhaka': 23.8103,
    'Sylhet': 24.8949,
    'Chattogram': 22.3350,
    'Khulna': 22.8167,
    'Rājshāhi': 24.3667,
    'Mymensingh': 24.7504,
    'Barishal': 22.7000,
    'Comilla': 23.4500,
  };
  Map<String, dynamic> mpLon = {
    'Dhaka': 90.3944,
    'Sylhet': 91.8667,
    'Chattogram': 91.8325,
    'Khulna': 89.5500,
    'Rājshāhi': 88.6000,
    'Mymensingh': 90.3800,
    'Barishal': 90.3667,
    'Comilla': 91.2000,
  };
  String _date = "";
  String temp = "";
  String latParam = "";
  String lonParam = "";
  String city = "";
  String humidity = "";
  String pressure = "";
  String visibility = "";
  String condition = "";
  String riseTime = "", setTime = "";
  //Url? icon_url;
  Future getCurrentWeather() async {
    const String baseUrl = "https://api.openweathermap.org/data/2.5/";

    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
        headers: {
          'content-type': 'application/json',
          //'appid': 'e7fea203f54664c120e92f171d226639'
        });
    Dio dio = Dio(options);

    Response<dynamic> response = await dio.get("weather", queryParameters: {
      'lat': latParam,
      'lon': lonParam,
      'appid': 'e7fea203f54664c120e92f171d226639'
    });
    //Map<String, dynamic> data = jsonDecode(response.data);
    //print(data);
    // var response = await Dio().get(
    //   'https://api.openweathermap.org/data/2.5/weather',
    // );
    //print(response.data);
    //Map<String, dynamic> data = jsonDecode(response.toString());
    //print(data);
    setState(() {
      _date = DateTime.now().toString().substring(0, 10);
      temp = (response.data['main']['temp'] - 273).toString().substring(0, 2) +
          ' \u2103';
      city = response.data['name'] + ", " + response.data['sys']['country'];
      humidity = "Humidity" +
          "   " +
          response.data['main']['humidity'].toString() +
          "%";
      pressure = "Pressure" +
          "   " +
          response.data['main']['pressure'].toString() +
          " " +
          "mBar";
      visibility = "Visibility" +
          "   " +
          (response.data['visibility'] / 1000).toString() +
          " km";
      condition = response.data['weather'][0]['main'].toString();
      riseTime =
          getClockInUtcPlus3Hours((response.data['sys']['sunrise']).toString());
      setTime = getClockInUtcPlus3Hours((response.data['sys']['sunset']).toString());
      //icon_url = "http://openweathermap.org/img/w/" + response.data["weather"][0]["icon"] +".png";
    });
  }

  //@override
  // void initState() {
  //   super.initState();
  //   getCurrentWeather(); //.then((value) => print('done'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 126, 93),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            child: Row(
              children: [
                DropdownButton<String>(
                  items: items.map((String dropdownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropdownStringItem,
                      child: Text(dropdownStringItem),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      value = newValue!;
                    });
                  },
                  value: value,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 37,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (value == 'Dhaka') {
                        latParam = mpLat['Dhaka'].toString();
                        lonParam = mpLon['Dhaka'].toString();
                      }
                      if (value == 'Sylhet') {
                        latParam = mpLat['Sylhet'].toString();
                        lonParam = mpLon['Sylhet'].toString();
                      }
                      if (value == 'Chattogram') {
                        latParam = mpLat['Chattogram'].toString();
                        lonParam = mpLon['Chattogram'].toString();
                      }
                      if (value == 'Khulna') {
                        latParam = mpLat['Khulna'].toString();
                        lonParam = mpLon['Khulna'].toString();
                      }
                      if (value == 'Rājshāhi') {
                        latParam = mpLat['Rājshāhi'].toString();
                        lonParam = mpLon['Rājshāhi'].toString();
                      }
                      if (value == 'Mymensingh') {
                        latParam = mpLat['Mymensingh'].toString();
                        lonParam = mpLon['Mymensingh'].toString();
                      }
                      if (value == 'Barishal') {
                        latParam = mpLat['Barishal'].toString();
                        lonParam = mpLon['Barishal'].toString();
                      }
                      if (value == 'Comilla') {
                        latParam = mpLat['Comilla'].toString();
                        lonParam = mpLon['Comilla'].toString();
                      }
                      getCurrentWeather();
                    },
                    child: const Text('View Weather'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 9, 126, 93),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              _date,
              style: const TextStyle(fontSize: 22),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(left: 50),
            elevation: 0,
            child: Text(
              temp,
              style: const TextStyle(
                  color: Color.fromARGB(255, 9, 126, 93), fontSize: 70),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55),
            child: Text(
              city,
              style: const TextStyle(
                color: Color.fromARGB(255, 9, 126, 93),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          Row(
            children: [
              const SizedBox(
                width: 55,
              ),
              Text(
                humidity,
                style: const TextStyle(
                    color: Color.fromARGB(255, 22, 99, 78),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 55,
              ),
              Text(
                pressure,
                style: const TextStyle(
                    color: Color.fromARGB(255, 22, 99, 78),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text(
                  condition,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 22, 99, 78),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 55,
              ),
              Text(
                visibility,
                style: const TextStyle(
                    color: Color.fromARGB(255, 22, 99, 78),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.asset('assets/Images/sunrise.png'),
                  ),
                  Text(riseTime),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.asset('assets/Images/sunsets.png'),
                  ),
                  Text(setTime),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String getClockInUtcPlus3Hours(String timeSinceEpochInSec) {
  int timeSinceEpochInSec2 = int.parse(timeSinceEpochInSec);
  final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec2 * 1000,
          isUtc: true)
      .add(const Duration(hours: 3));
  return '${time.hour}:${time.second}';
}
