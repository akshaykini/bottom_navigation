import 'dart:convert';

import 'package:bottom_navigation/Utils/strings.dart';
import 'package:bottom_navigation/main_module/models/postModel.dart';
import 'package:bottom_navigation/main_module/models/usermodel.dart';
import 'package:http/http.dart' as http;

import '../models/photosmodel.dart';

class Apiservice {
  static List<PostModel> postlist = [];
  static Future<List<PostModel>> fetchPostData() async {
    final response = await http.get(Uri.parse(Stringdata.posturl));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postlist.clear();
      for (Map i in data) {
        postlist.add(PostModel.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  static List<Photos> photolist = [];
  static Future<List<Photos>> getphotos() async {
    final response = await http.get(Uri.parse(Stringdata.photosurl));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      photolist.clear();
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photolist.add(photos);
      }
      return photolist;
    } else {
      return photolist;
    }
  }

  static List<UserModel> userlist = [];
  static Future<List<UserModel>> getuserlistapi() async {
    final response = await http.get(Uri.parse(Stringdata.userurl));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      userlist.clear();
      for (Map i in data) {
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }
}
