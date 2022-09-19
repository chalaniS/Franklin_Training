import 'package:flutter/material.dart';
import 'package:franklin_ex/user_screen.dart';
import 'rest_api_service.dart';
import 'user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiService = RestAPIService();

  List<User> usersList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.getUsers().then((value) {
      if (value != null) {
        usersList = value as List<User>;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserScreen(
                        user: snapShot.data[index],
                      )));
        },
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: apiService.getUsers(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return ListView.builder(
                      itemCount: snapShot.data?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: ListTile(
                              title: Text(
                                snapShot.data![index].name ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                snapShot.data![index].city ?? '',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              leading: ClipOval(
                                child: Image.network(
                                  snapShot.data[index].imge,
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: const Center(
                        child: Text(
                          'Loading.....',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
