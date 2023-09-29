import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Feed'),
        ),
        body: NewsFeed(),
      ),
    );
  }
}

class NewsFeed extends StatelessWidget {
  final List<String> dummyImages = List.generate(10, (index) => "https://via.placeholder.com/150");

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return (orientation == Orientation.portrait)
            ? ListView.builder(
          itemCount: dummyImages.length,
          itemBuilder: (context, index) {
            return Card(
              child: Image.network(dummyImages[index]),
            );
          },
        )
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: dummyImages.length,
          itemBuilder: (context, index) {
            return Card(
              child: Image.network(dummyImages[index]),
            );
          },
        );
      },
    );
  }
}
