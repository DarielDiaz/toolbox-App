//Dariel Diaz Joseph 2022-0746

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.2,
                  backgroundImage: const AssetImage('assets/images/your_photo.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dariel Diaz',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Software Developer | Tech Enthusiast',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                _buildInfoRow(Icons.email, 'diazdariel123@gmail.com'),
                const SizedBox(height: 10),
                _buildInfoRow(Icons.phone, '829-967-3604'),
                const SizedBox(height: 10),
                _buildInfoRow(Icons.link, 'LinkedIn: https://www.linkedin.com/in/dariel-diaz-5aaa25246/'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 10),
        SelectableText(
          info,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}


