import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserCard extends StatelessWidget {
  String name,
      username,
      email,
      phone,
      website,
      street,
      city,
      zipcode,
      companyname,
      lat,
      long;

  UserCard(
      {Key? key,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website,
      required this.street,
      required this.city,
      required this.zipcode,
      required this.companyname,
      required this.lat,
      required this.long});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: Card(
          elevation: 5,
          shadowColor: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  Text(name + " ( " + username + " )"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.phone),
                  Text(phone),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.email),
                  Text(email),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.web),
                  Text(website),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.location_city),
                  Text(street + " " + city + "'\n' " + zipcode),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.house),
                  Text(companyname),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.streetview),
                  Text(lat + "," + long),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
