import 'package:flutter/material.dart';
import 'dart:math' as math;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("This is my first app !"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print("Premuto!");
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Business",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: "Share",
            ),
          ],
        ),
        drawer: Drawer(),
        body: ListView.builder(
          itemBuilder: (_, index){
            return Container(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
              width: 500,
              height: 500,
            );
          },
        ),
      ),
    );
  }
}