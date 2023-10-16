import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListScreen(),
  ));
}

class ListItem {
  dynamic title;
  dynamic subtitle;

  ListItem(this.title, this.subtitle);
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<ListItem> items = [
    ListItem('Item 1', "Subtitle 1"),
    ListItem("Item 2", "Subtitle 2"),
    // Add more items as needed
  ];

  TextEditingController newTitleController = TextEditingController();
  TextEditingController newSubtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: newTitleController,
                  decoration: const InputDecoration(
                    labelText: "Add Title",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: newSubtitleController,
                  decoration: const InputDecoration(
                    labelText: "Add description",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    _addItem();
                  },
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      color: Colors.grey[300],
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.redAccent,
                        ),
                        title: Text(
                          '${items[index].title}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('${items[index].subtitle}'),
                        trailing: const Icon(Icons.arrow_forward_outlined),
                        onLongPress: () {
                          _showOptionsDialog(context, index);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton(
                child: const Text("Edit"),
                onPressed: () {
                  Navigator.pop(context);
                  _showEditBottomSheet(context, index);
                },
              ),
              TextButton(
                child: const Text("Delete"),
                onPressed: () {
                  Navigator.pop(context);
                  _deleteItem(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditBottomSheet(BuildContext context, int index) {
    TextEditingController titleController =
    TextEditingController(text: items[index].title);
    TextEditingController subtitleController =
    TextEditingController(text: items[index].subtitle);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      labelText: "Title", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: subtitleController,
                  decoration: const InputDecoration(
                      labelText: "Subtitle", border: OutlineInputBorder()),
                ),
              ),
              Container(
                width: 110,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      items[index].title = titleController.text;
                      items[index].subtitle = subtitleController.text;
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    onPrimary: Colors.white, // Text color
                  ),
                  child: const Text("Edit Done"),
                ),
              ),
              const SizedBox(
                height: 152,
              )
            ],
          ),
        );
      },
    );
  }

  void _addItem() {
    final String title = newTitleController.text;
    final String subtitle = newSubtitleController.text;
    if (title.isNotEmpty && subtitle.isNotEmpty) {
      setState(() {
        items.add(ListItem(title, subtitle));
      });
      newTitleController.clear();
      newSubtitleController.clear();
    }
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
}
