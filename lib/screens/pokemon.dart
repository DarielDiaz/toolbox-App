//Dariel Diaz Joseph 2022-0746

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonScreen extends StatefulWidget {
  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final TextEditingController _controller = TextEditingController();
  String _imageUrl = '';
  int _baseExperience = 0;
  List<dynamic> _abilities = [];

  Future<void> _fetchPokemon() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${_controller.text.toLowerCase()}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _imageUrl = data['sprites']['front_default'];
        _baseExperience = data['base_experience'];
        _abilities = data['abilities'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter Pokemon Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchPokemon,
              child: Text('Get Pokemon Info'),
            ),
            SizedBox(height: 20),
            if (_imageUrl.isNotEmpty)
              Image.network(_imageUrl),
            Text('Base Experience: $_baseExperience'),
            Text('Abilities: ${_abilities.map((ability) => ability['ability']['name']).join(', ')}'),
          ],
        ),
      ),
    );
  }
}