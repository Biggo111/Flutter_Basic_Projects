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
        const SizedBox(
          width: 22,
        ),
        const Tab(
          text: 'Chats',
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Text(
            '2',
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
            backgroundColor: const Color.fromARGB(255, 30, 77, 31),
            title: const Text('What\'s App'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
            bottom: TabBar(
              tabs: _tabs,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color.fromARGB(255, 30, 77, 31),
            child: const Icon(Icons.message),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   height: 50,
                  //   width: 50,
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         'assets/icons/profilepicture.png',
                  //       ),
                  //       fit: BoxFit.cover,
                  //       ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 25,
                      foregroundImage: AssetImage(
                        'assets/icons/profilepicture.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 06,
                  ),
                  Container(
                    height: 37,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Biggo',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'typing',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 210.0,
                    ),
                    child: Text('10.00am'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 0.3,
                  width: 430.0,
                  color: Color.fromARGB(255, 66, 65, 65),
                ),
              ),
              Row(
                children: [
                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   height: 50,
                  //   width: 50,
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         'assets/icons/profilepicture.png',
                  //       ),
                  //       fit: BoxFit.cover,
                  //       ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      radius: 25,
                      foregroundImage: AssetImage(
                        'assets/icons/profilepicture.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 06,
                  ),
                  Container(
                    height: 37,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Biggo',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'typing',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 210.0,
                    ),
                    child: Text('10.00am'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
