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
  final emailController = TextEditingController(); // Controller for the email text field
  List<String> messages = [];

  Future<void> fetchData(String email) async {
    var response = await http.get(Uri.https('us-central1-mythic-fulcrum-382710.cloudfunctions.net/function-6/get_message'),
        body{'email': email});

    final responseBody = json.decode(response.body);

    setState(() {
      messages.add(responseBody['email'] + ': ' + responseBody['message']);
    });
  }

  @override
  void dispose() {
    emailController.dispose(); // Dispose the email text field controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Enter Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                fetchData(emailController.text);
              },
              child: const Text('Send Message'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
