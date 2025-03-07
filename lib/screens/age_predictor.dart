//Dariel Diaz Joseph 2022-0746
import 'package:flutter/material.dart';
import 'dart:math';

class AgePredictor extends StatefulWidget {
  @override
  _AgePredictorState createState() => _AgePredictorState();
}

class _AgePredictorState extends State<AgePredictor> {
  final TextEditingController _controller = TextEditingController();
  int _age = 0;
  String _message = '';
  String _imagePath = '';
  final Random _random = Random();

  void _predictAge() {
    String description = _controller.text.trim();

    if (description.isEmpty) {
      setState(() {
        _message = 'Please enter a description of the person to predict their age.';
        _age = 0;
        _imagePath = '';
      });
      return;
    }

  
    final randomValue = _random.nextInt(3);

    setState(() {
      if (randomValue == 0) {
        _age = _random.nextInt(21) + 1;
        _message = 'Young';
        _imagePath = 'assets/images/young.png';
      } else if (randomValue == 1) {
        _age = _random.nextInt(38) + 22;
        _message = 'Adult';
        _imagePath = 'assets/images/adult.png';
      } else {
        _age = _random.nextInt(41) + 60;
        _message = 'Elderly';
        _imagePath = 'assets/images/elderly.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter a description of the person'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictAge,
              child: Text('Predict Age'),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text('Estimated Age: $_age'),
            if (_imagePath.isNotEmpty)
              Expanded(
                child: Center(
                  child: Container(
                    width: 200, 
                    height: 200, 
                    child: Image.asset(
                      _imagePath,
                      fit: BoxFit.cover, 
                      errorBuilder: (context, error, stackTrace) {
                        return Text('Error loading image');
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
