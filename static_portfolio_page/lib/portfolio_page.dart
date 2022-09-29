import 'dart:ffi';

import 'package:flutter/material.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              const Text("Hey! I'm Biggo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const Text("A Flutter Developer",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              ),
              const SizedBox(height: 50,),
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/Dp.jpg'),
              ),
              Container(
                height: 400,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text('Name', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),),
                        SizedBox(height: 10,),
                        Text('Biggo Routh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('BS.c in CSE', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                        Text('Flutter Developer', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                        Text('ML Anthsiast', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                        SizedBox(height: 130,),
                        Text('ID', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),),
                        SizedBox(height: 10,),
                        Text('LUCSFB2208', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Career Objectives', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),),
                        const SizedBox(height: 10,),
                        Container(
                          height: 150,
                          width: 80,
                          child: Column(
                            children: const[
                              Text("want to be a mobile application developer.",),
                              Text("Also Interested in ML.",),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Skills', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),),
                        SizedBox(height: 10,),
                        Container(
                          child: Column(
                            children: const [
                              Text('Problem Solving'),
                              Text('Languages: ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Dart, Java, Python, C, C++'),
                              Text("Frameworks:",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("Flutter, Java Swing"),
                              Text("Databases:", style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("SQL database, Firebase"),
                              Text("And others", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}