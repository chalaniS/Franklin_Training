import 'package:flutter/material.dart';
import 'package:franklin_ex/login.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

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
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wellcome ${widget.username}',
                style: const TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 40,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text(
                  'Log',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
