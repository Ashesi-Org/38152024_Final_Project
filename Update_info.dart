// ignore: file_names
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DataModel_1.dart';
import 'Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
    );

  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}
Future<DataModel?> submitData(String id, String dob,
    String yearGroup, String major, String residence, String bestmovie, String bestfood)
async{
  var response = await http.post(Uri.https('us-central1-mythic-fulcrum-382710.cloudfunctions.net', 'function-6/update'),
      body: { "id":id, "dob":dob, "major":major,
        "yearGroup":yearGroup, "residence":residence, "bestfood": bestfood,
        "bestmovie":bestmovie});
  var data = response.body;
  print(data);

  if (response.statusCode == 200){
    String responsestring = response.body;
    dataModelFromJson(responsestring);
  }
  else {
    return null;
  }

}

class _RegisterPageState extends State<RegisterPage> {
  DataModel? _dataModel;
  final MyForm = MyCustomFormState();
  final _formKey = GlobalKey<FormState>();
   final _dobController = TextEditingController();
  final _yearGroupController = TextEditingController();
  final _majorController = TextEditingController();
  final _residenceController = TextEditingController();
  final _bestFoodController = TextEditingController();
  final _bestMovieController = TextEditingController();


  @override
  void dispose() {
    _dobController.dispose();
    _yearGroupController.dispose();
    _majorController.dispose();
    _residenceController.dispose();
    _bestFoodController.dispose();
    _bestMovieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Form'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _dobController,
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _yearGroupController,
                    decoration: const InputDecoration(
                      labelText: 'Year Group',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your year group';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _majorController,
                    decoration: const InputDecoration(
                      labelText: 'Major',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your major';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _residenceController,
                    decoration: const InputDecoration(
                      labelText: 'Campus Residence (yes or no)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter whether or not you have campus residence';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _bestFoodController,
                    decoration: const InputDecoration(
                      labelText: 'Best Food',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your best food';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _bestMovieController,
                    decoration: const InputDecoration(
                      labelText: 'Best Movie',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your best movie';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal:45,  vertical: 20),
                  ),
                  onPressed: () async{

                    String id = MyForm.id;
                    String dob = _dobController.text;
                    String yearGroup = _yearGroupController.text;
                    String major = _majorController.text;
                    String residence = _residenceController.text;
                    String bestmovie = _bestMovieController.text;
                    String bestfood = _bestFoodController.text;

                    DataModel? data = await submitData(id, dob,
                        yearGroup, major, residence, bestmovie, bestfood);
                    setState(() {
                      _dataModel = data;
                    });
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
