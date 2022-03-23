import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  late List<Api> _api;

  Future<List<Api>?> _getUser() async {
    try {
      List<Api> listUser = [];
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listUser.add(Api.fromJson(item)));
        print(_api.length);
        return listUser;

      } else {
        print("Erro ao carregar lista");
        return null;
      }
    } catch (e) {
      print("Erro ao carregar lista");
      return null;
    }
  }

  void initState() {
    print(_api.length);
    initState();
    _getUser().then((map) {
      _api = map!;
      print(_api.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: _api.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 80,
                  color: Colors.blue,
                ),
              );
            }),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
    );
  }
}
