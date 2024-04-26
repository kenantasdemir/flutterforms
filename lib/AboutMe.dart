
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Merhaba, Ben"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child:Column(
            children: [
              Text("Kenan Taşdemir"),
              Text("Bilgisayar teknolojisi ve bilişim sistemleri"),
              Text("4.sınıf")
            ],
          ),
        ),
      ),
    );
  }

}