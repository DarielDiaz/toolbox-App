//Dariel Diaz Joseph 2022-0746

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenderPredictor extends StatefulWidget {
  @override
  _GenderPredictorState createState() => _GenderPredictorState();
}

class _GenderPredictorState extends State<GenderPredictor> {
  final TextEditingController _controller = TextEditingController();
  String _gender = '';
  Color _color = Colors.white;

  Future<void> _predictGender() async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=${_controller.text}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _gender = data['gender'];
        _color = _gender == 'male' ? Colors.blue : Colors.pink;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predict Gender'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictGender,
              child: Text('Predict Gender'),
            ),
            SizedBox(height: 20),
            Container(
              color: _color,
              height: 100,
              width: double.infinity,
              child: Center(child: Text(_gender)),
            ),
          ],
        ),
      ),
    );
  }
}