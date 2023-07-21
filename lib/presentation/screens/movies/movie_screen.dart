import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie_screen';

  final String moviedId;

  const MovieScreen({super.key, required this.moviedId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: $moviedId'),
      ),
    );
  }
}
