import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/model/Movie.dart';
import 'package:http/http.dart' as http;

final getpoplardata = ChangeNotifierProvider<Getpoplar>((ref) => Getpoplar());

class Getpoplar extends ChangeNotifier {
  List<Movie> listDataModel = [];

  Getpoplar() {
    getData();
  }

  Future getData() async {
    listDataModel = [];
    try {
      String apikey = 'f476c933beeb792de073665402a501ad';
      var url = Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=$apikey&language=en-US");
      print(url);
      var response = await http.get(url);
      var resposebody = jsonDecode(response.body)["results"];
      print(resposebody);
      for (int i = 0; i < resposebody.length; i++) {
        listDataModel.add(Movie.fromMap(resposebody[i]));
      }
    } catch (e) {
      print("e$e");
    }

    notifyListeners();
  }
}
