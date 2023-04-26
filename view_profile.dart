// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyPage());
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final idController = TextEditingController(); // Controller for the ID text field
  String name = "";
  String email = "";
  String dob = "";
  String yearGroup = "";
  String major = "";
  String residence = "";
  String bestmovie = "";
  String bestfood = "";

  Future<void> fetchData(String id) async {
    var response = await http.get(Uri.https('us-central1-mythic-fulcrum-382710.cloudfunctions.net', 'function-6/retrieve'), body: { "id":id});

    final responseBody = json.decode(response.body);

    setState(() {
      name = responseBody['name'];
      email = responseBody['email'];
      dob = responseBody['dob'];
      yearGroup = responseBody['yearGroup'];
      major = responseBody['major'];
      residence = responseBody['residence'];
      bestmovie = responseBody['bestmovie'];
      bestfood = responseBody['bestfood'];
    });
  }

  @override
  void dispose() {
    idController.dispose(); // Dispose the ID text field controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'Enter ID',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                fetchData(idController.text);
              },
              child: const Text('Get User Profile'),
            ),
            const SizedBox(height: 16.0),
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Date of Birth: $dob'),
            Text('Year Group: $yearGroup'),
            Text('Major: $major'),
            Text('Residence: $residence'),
            Text('Best Movie: $bestmovie'),
            Text('Best Food: $bestfood'),
          ],
        ),
      ),
    );
  }
}
