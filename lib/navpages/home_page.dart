import 'package:bottom_navigation/main_module/api_module/api_service.dart';
import 'package:bottom_navigation/main_module/models/postModel.dart';
import 'package:flutter/material.dart';
import '';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: Apiservice.fetchPostData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Text('Loading.......'));
        } else {
          return ListView.builder(
              itemCount: Apiservice.postlist.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title'),
                      Text(Apiservice.postlist[index].title.toString()),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Description'),
                      Text(Apiservice.postlist[index].body.toString()),
                    ],
                  ),
                );
              });
        }
      },
    ));
  }
}
