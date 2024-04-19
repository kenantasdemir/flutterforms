// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutterforms/ActionsSectionItems.dart';
import 'package:flutterforms/Payment.dart';
import 'package:flutterforms/PersonalInfos.dart';
import 'package:flutterforms/Technologies.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



      int _selectedIndex = 0;

   final List<Widget> _pages = [
     PersonalInfos(
       key: PageStorageKey('page_1'),

     ),
     Technologies(),
     Payment()

   ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
   final PageStorageBucket _bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Form"),
        actions: const [ActionsSectionItems()],
      ),
      body: PageStorage(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bucket: _bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
           BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Kişisel Bilgiler",
              tooltip: "Kişisel Bilgiler",
              activeIcon: Icon(
                Icons.person,
                color: Colors.purple,
              )),
           BottomNavigationBarItem(
              icon: Icon(Icons.code),
              label: "Teknolojiler",
              tooltip: "Teknolojiler",
              activeIcon: Icon(
                Icons.code,
                color: Colors.purple,
              )),
           BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Ödeme",
              tooltip: "Ödeme",
              activeIcon: Icon(
                Icons.payment,
                color: Colors.purple,
              ))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
