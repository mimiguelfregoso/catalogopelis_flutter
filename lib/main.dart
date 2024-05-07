import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CatalogoPelisApp());
}

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
        title: Text('BIENVENIDO A CatalogoPelis - Catálogo de Películas'),
      ),
      body: Stack(
        children: [
          // Fondo de pantalla
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fondo_pelis.jpg'), // AQUI VA LA IMAGEN DE FONDO
                fit: BoxFit.cover,
              ),
            ),
          ),
          // CONTENIDOS
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MSG
                Text(
                  '¡Bienvenido a CatalogoPelis!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                // NOMBRE DE LA APLICACION
                Text(
                  'CatalogoPelis',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40.0),
                // SE PONE BOTON PARA VER CATALOGO
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CatalogoPage(peliculas: peliculas)),
                    );
                  },
                  child: Text(
                    'Ver catálogo',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Pelicula {
  final String titulo;
  final String descripcion;

  Pelicula(this.titulo, this.descripcion);
}

class CatalogoPage extends StatelessWidget {
  final List<Pelicula> peliculas;

  CatalogoPage({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Películas'),
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
              child: ListTile(
                title: Text(
                  peliculas[index].titulo,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  peliculas[index].descripcion,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
