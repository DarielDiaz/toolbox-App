//Dariel Diaz Joseph 2022-0746

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _weather = 'Loading...';
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    try {
      final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Santo%20Domingo&appid=157e805f50ae6a352d1a1da7f92b8d37&units=metric&lang=es'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _weather = 'Clima en RD hoy: ${data['weather'][0]['description']}';
          _errorMessage = '';
        });
      } else {
        setState(() {
          _weather = '';
          _errorMessage = 'Error al cargar el clima. Código de estado: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _weather = '';
        _errorMessage = 'Error de conexión. Verifica tu conexión a Internet.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in RD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            if (_weather.isNotEmpty)
              Text(
                _weather,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

