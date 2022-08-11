import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
void main() {
  runApp(
    MaterialApp(
      title: "Signup & Login",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            'Login & signup',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/loginpageImages/signup.svg', 
                height: size.height*0.4,
              ),
              SizedBox(
                height: 70.0,
              ),
              Container(
                width: size.height * 0.4,
                height: size.width * 0.14,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    onPressed: () {}, 
                    child: Text(
                      'login', 
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    color: Color.fromARGB(255, 119, 50, 132),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: size.height * 0.4,
                height: size.width * 0.14,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    onPressed: () {}, 
                    child: Text(
                      'Signup', 
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    color: Color.fromARGB(255, 93, 4, 109),
                  ),
                ),
              ),
              Container(
                width: size.height*0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password!',
                        style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 5, 71, 124)),
                      ),
                    ),
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