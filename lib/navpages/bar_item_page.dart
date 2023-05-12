import 'dart:convert';

import 'package:bottom_navigation/main_module/api_module/api_service.dart';
import 'package:flutter/material.dart';

import '../Utils/strings.dart';
import '../main_module/models/photosmodel.dart';
import 'package:http/http.dart' as http;

class Bar_chart_item extends StatefulWidget {
  const Bar_chart_item({super.key});

  @override
  State<Bar_chart_item> createState() => _Bar_chart_itemState();
}

class _Bar_chart_itemState extends State<Bar_chart_item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Apiservice.getphotos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                } else {
                  return ListView.builder(
                    itemCount: Apiservice.photolist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            //  backgroundImage:  NetworkImage(Apiservice.photolist[index].url.toString() ),
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          subtitle:
                              Text(snapshot.data![index].title.toString()),
                          title: Text('Notes id: ' +
                              snapshot.data![index].id.toString()),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
