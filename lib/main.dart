import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selection Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ItemSelectorScreen(),
    );
  }
}

class ItemSelectorScreen extends StatefulWidget {
  @override
  _ItemSelectorScreenState createState() => _ItemSelectorScreenState();
}

class _ItemSelectorScreenState extends State<ItemSelectorScreen> {
  List<Item> items = [
    Item("Item 1", false),
    Item("Item 2", false),
    Item("Item 3", false),
    Item("Item 4", false),
    Item("Item 5", false),
  ];

  void toggleItem(int index) {
    setState(() {
      items[index].isSelected = !items[index].isSelected;
    });
  }

  void showSelectedItemsDialog() {
    int selectedCount = items.where((item) => item.isSelected).length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Items'),
          content: Text('The Number of  Selected Item : $selectedCount '),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              items[index].name,
              style: TextStyle(
                color: items[index].isSelected ? Colors.blue[900] : Colors.black,
              ),
            ),
            onTap: () {
              toggleItem(index);
            },
            selected: items[index].isSelected,
            selectedTileColor: Colors.blue.withOpacity(0.2),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSelectedItemsDialog();
        },
        child: Icon(Icons.check,color: Colors.white,),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Item {
  String name;
  bool isSelected;

  Item(this.name, this.isSelected);
}
