import 'package:bottom_navigation/main_module/api_module/api_service.dart';
import 'package:bottom_navigation/main_module/models/usermodel.dart';
import 'package:flutter/material.dart';

import '../widgets/usercard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: Apiservice.getuserlistapi(),
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: Apiservice.userlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UserCard(
                                    name: snapshot.data![index].name.toString(),
                                    username: snapshot.data![index].username
                                        .toString(),
                                    email:
                                        snapshot.data![index].email.toString(),
                                    phone:
                                        snapshot.data![index].phone.toString(),
                                    website: snapshot.data![index].website
                                        .toString(),
                                    street: snapshot
                                        .data![index].address!.street
                                        .toString(),
                                    city: snapshot.data![index].address!.city
                                        .toString(),
                                    zipcode: snapshot
                                        .data![index].address!.zipcode
                                        .toString(),
                                    companyname: snapshot.data![index].company
                                        .toString(),
                                    lat: snapshot.data![index].address!.geo!.lat
                                        .toString(),
                                    long: snapshot
                                        .data![index].address!.geo!.lng
                                        .toString())
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
