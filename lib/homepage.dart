import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //final String username;

  //const HomePage({Key key, this.username} : super{Key :key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Log'),
        ),
      ),
    );
  }
}
