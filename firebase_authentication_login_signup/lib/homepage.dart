import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Login/Signup"),
        // ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            //color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter your email and pass to sign in and",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "Enjoy the service...",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 30,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.2, color: Colors.green),
                          ),
                          labelText: 'User Name',
                          labelStyle: TextStyle(color: Colors.green),
                          hintText: 'Enter Your Name',
                          suffixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.green,
                          ),
                          //contentPadding: EdgeInsets.symmetric(vertical: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.2, color: Colors.green),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.green),
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.abc,
                              //_passwordVisible
                              //? Icons.visibility
                              //: Icons.visibility_off,
                              //color: Colors.green,
                            ),
                          ),
                        ),
                        //contentPadding: EdgeInsets.symmetric(vertical: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: SizedBox(
                        height: 40,
                        width: 360,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            elevation: 2 //Button Background Color
                          ),
                          child: const Text("SIGN IN"),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 55,
                  ),
                  child: Row(
                    children: [
                      const Text("Don't have any account?"),
                      TextButton(
                        onPressed: (){}, 
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width/2.7,
                        child: const Expanded(
                          child: Divider(
                            height: 10,
                            thickness: 0.3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      " OR ",
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2.7,
                      child: const Expanded(
                        child: Divider(
                          height: 10,
                          thickness: 0.3,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
