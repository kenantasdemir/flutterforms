
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Merhaba"),
      ),
      body: Center(
        child: Text("Benim Adım Kenan Taşdemir"),
      ),
    );
  }

}