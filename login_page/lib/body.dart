import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page/background.dart';
import 'package:login_page/constants.dart';
import 'package:login_page/login_screen.dart';
import 'package:login_page/rounded_button.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: size.height*0.03,),
            SvgPicture.asset("assets/icons/chat.svg", height: size.height*0.45,),
            SizedBox(height: size.height*0.03,),
            RoundedButton(
              text: "login",
              press: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context){
                    return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "signup",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: (){},
            ), 
          ],
        ),
      )
    );
  }
}


