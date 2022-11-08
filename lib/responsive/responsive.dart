
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/mobile_screen_layout.dart';
import 'package:whatsapp_ui/screens/web_screen_layout.dart';

class Responsive extends StatelessWidget {
  const Responsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints){
        if(constraints.maxWidth>900){
          return WebScreen();
        }
        else{
          return MobileScreen();
        }

      },

    );
  }
}
