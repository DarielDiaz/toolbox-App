//Dariel Diaz Joseph 2022-0746

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WordPressNewsScreen extends StatefulWidget {
  @override
  _WordPressNewsScreenState createState() => _WordPressNewsScreenState();
}

class _WordPressNewsScreenState extends State<WordPressNewsScreen> {
  List<dynamic> _news = [];
  String _message = '';

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }


  Future<void> _fetchNews() async {
    try {
      final response = await http.get(Uri.parse('https://www.theverge.com/wp-json/wp/v2/posts?per_page=3'));


      if (response.statusCode == 200) {
        setState(() {
          _news = json.decode(response.body);
        });
      } else {
        print('Failed to load news: ${response.statusCode}');
        setState(() {
          _message = 'Failed to load news. Please try again later.';
        });
      }
    } catch (error) {
      print('Error fetching news: $error');
      setState(() {
        _message = 'An error occurred. Please check your internet connection.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPress News'),
      ),
      body: _news.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _news.length,
              itemBuilder: (context, index) {
                final newsItem = _news[index];
                return ListTile(
                  title: Text(newsItem['title']['rendered']),
                  subtitle: Text(newsItem['excerpt']['rendered']),
                  onTap: () {},
                );
              },
            ),
    );
  }
}

