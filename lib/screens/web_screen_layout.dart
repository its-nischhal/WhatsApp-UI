import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(

              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/backgroundImage.png')
              )
            ),
          )
        ],
      )
    );
  }
}
