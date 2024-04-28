import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieCatalog(),
    );
  }
}

class MovieCatalog extends StatefulWidget {
  @override
  _MovieCatalogState createState() => _MovieCatalogState();
}

class _MovieCatalogState extends State<MovieCatalog> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final response = await http.get(Uri.parse('URL_DE_TU_API'));

    if (response.statusCode == 200) {
      setState(() {
        movies = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Catalog'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movies[index]['title']),
            subtitle: Text(movies[index]['description']),
          );
        },
      ),
    );
  }
}

  }
}

