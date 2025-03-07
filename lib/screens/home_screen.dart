import 'package:flutter/material.dart';
import 'gender_predictor.dart';
import 'age_predictor.dart';
import 'universities.dart';
import 'weather.dart';
import 'pokemon.dart';
import 'wordpress_news.dart';
import 'about.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toolbox App'),
        backgroundColor: Color(0xFFFFB6C1), // Rosa pastel
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFB6C1), Color(0xFFADD8E6)], // Rosa pastel a azul claro
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              createCard(context, 'Predict Gender', GenderPredictor()),
              createCard(context, 'Predict Age', AgePredictor()),
              createCard(context, 'Universities', UniversitiesScreen()),
              createCard(context, 'Weather', WeatherScreen()),
              createCard(context, 'Pokemon Info', PokemonScreen()),
              createCard(context, 'WordPress News', WordPressNewsScreen()),
              createCard(context, 'About', AboutScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget createCard(BuildContext context, String title, Widget screen) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
      ),
    );
  }
}
