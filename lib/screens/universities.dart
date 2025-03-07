import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversitiesScreen extends StatefulWidget {
  @override
  _UniversitiesScreenState createState() => _UniversitiesScreenState();
}

class _UniversitiesScreenState extends State<UniversitiesScreen> {
  final TextEditingController _controller = TextEditingController(text: 'United States');
  List<dynamic> _universities = [];
  bool _notFound = false;

  Future<void> _fetchUniversities() async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=${_controller.text}'));
    if (response.statusCode == 200) {
      setState(() {
        _universities = json.decode(response.body);
        _notFound = _universities.isEmpty;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universities'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter Country'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchUniversities,
              child: Text('Search Universities'),
            ),
            SizedBox(height: 20),
            if (_notFound)
              Text('No universities found for the specified country.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _universities.length,
                  itemBuilder: (context, index) {
                    final university = _universities[index];
                    return ListTile(
                      title: Text(university['name']),
                      subtitle: Text(university['web_pages']?.isNotEmpty == true ? university['web_pages'][0] : 'No web page available'),
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