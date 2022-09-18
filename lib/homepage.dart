import 'package:flutter/material.dart';
import 'package:franklin_ex/login.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'ThursDay',
    'FriDay',
    'SaturDay',
    'Sunday'
  ];

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
                  fontSize: 40,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.calendar_today,
                          color: Colors.red,
                        ),
                        title: Text(
                          data[index],
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          'day',
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Icon(
                          Icons.favorite_outline_outlined,
                          color: Colors.orange,
                        ),
                      ),
                    );
                  },
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
