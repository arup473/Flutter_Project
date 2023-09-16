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
          title: Text("My Shopping List"),
          centerTitle: true, // Center the title in the app bar
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Add cart functionality here
              },
            ),
          ],
        ),
        body: ShoppingList(),
      ),
    );
  }
}

class ShoppingList extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"name": "Apples", "icon": "🍎"},
    {"name": "Bananas", "icon": "🍌"},
    {"name": "Milk", "icon": "🥛"},
    {"name": "Bread", "icon": "🍞"},
    {"name": "Eggs", "icon": "🥚"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return ListTile(
          leading: Text(item['icon'] ?? '', style: TextStyle(fontSize: 24.0)),
          title: Text(item['name'] ?? ''),
          onTap: () {
            // Add functionality when an item is tapped.
            // For example, you can show a snackbar message.
            /* ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                content: Text("You tapped ${item['name']}"),
              ),
            );*/
          },
        );
      },
    );
  }
}
