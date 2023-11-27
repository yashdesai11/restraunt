import 'package:flutter/material.dart';

import 'menuFile.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/introPizza.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PizzaMania",
                  style: TextStyle(color: Colors.tealAccent,fontSize: 60,fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: height/2,
                ),

                ElevatedButton(
                  onPressed: () {

                    setState(() {
                      total = 0;
                    });
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuFile()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      side: const BorderSide(color: Colors.black)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: height/35,right: height/35),
                    child: const Text('Get Started',
                      style: TextStyle(fontSize: 35),),
                  ),
                ),


              ],
            )),
      ),
    );
  }
}

