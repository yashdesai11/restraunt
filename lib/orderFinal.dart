import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menuFile.dart';

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Thanks for ordering : \$${total}"),

            ElevatedButton(onPressed: (){

              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }

            }, child: Text("Done"))
          ],
        ),
      ),
    );
  }
}
