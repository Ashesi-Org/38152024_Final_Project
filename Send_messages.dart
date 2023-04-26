import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Post',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreatePostPage(),
    );
  }
}

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Message',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: TextField(
                controller: _messageController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Enter your message',
                  border: OutlineInputBorder(),
                ),
                 ),
            ),
            const SizedBox(height: 16.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal:45,  vertical: 20),
          ),
          onPressed: () {},
          child: const Text('Submit'),
        ),
          ],
        ),
      ),
    );
  }
}
