import 'package:flutter/material.dart';

void main() {
  runApp(CatalogoPelisApp());
}

class CatalogoPelisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatalogoPelis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CatalogoPelisScreen(),
    );
  }
}

class CatalogoPelisScreen extends StatelessWidget {
  final List<Pelicula> peliculas = [
    Pelicula('Inception', 'A thief who enters the dreams of others to steal their secrets.'),
    Pelicula('Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.'),
    Pelicula('The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'),
    // Puedes agregar más películas aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CatalogoPelis - Catálogo de Películas'),
      ),
      body: ListView.builder(
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 150,
                    color: Colors.grey,
                    child: Center(
                      child: Text('Imagen'), // Aquí puedes poner la imagen de la película
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            peliculas[index].titulo,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            peliculas[index].descripcion,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Pelicula {
  final String titulo;
  final String descripcion;

  Pelicula(this.titulo, this.descripcion);
}

