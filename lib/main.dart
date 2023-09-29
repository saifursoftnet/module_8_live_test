import 'package:flutter/rendering.dart'; // Import SliverGridDelegateWithMinCrossAxisCount
import 'package:image/image.dart' as img; // For image manipulation
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageFeed(),
    );
  }
}

class ImageFeed extends StatelessWidget {
  final List<String> imageUrls = [
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    // Add more image URLs here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 5.0,
                    child: Image.network(imageUrls[index]),
                  ),
                );
              },
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Minimum 2 items in a row
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0, // Ensure square items (150x150)
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 5.0,
                    child: Image.network(imageUrls[index]),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
