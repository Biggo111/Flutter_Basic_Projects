import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // final List<Tab> _tabs = <Tab>[
  //   const Tab(text: 'Chats'),
  //   const Tab(text: 'Status'),
  //   const Tab(text: 'Calls'),
  // ];
  final List<Widget> _tabs = <Widget>[
    Row(
      children: [
        SizedBox(
          width: 22,
        ),
        const Tab(
          text: 'Chats',
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          padding: EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Text(
            '1',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
    const Tab(text: 'Status'),
    const Tab(text: 'Calls'),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 30, 77, 31),
            title: const Text('What\'s App'),
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
            ],
            bottom: TabBar(
              tabs: _tabs,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ),
      ),
    );
  }
}