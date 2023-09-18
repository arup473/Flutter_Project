import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Photo Gallery")), // Center the app bar title
        ),
        body: PhotoGallery(),
      ),
    );
  }
}

class PhotoGallery extends StatelessWidget {
  final List<String> imageUrls = [
    "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply", // Add your image URLs here
    "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply",
    "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply",
    "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply",
    "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply",
    "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Welcome to our Photo Gallery!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search For Photos...",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Grid tapped!"),
                ),
              );
            },
            child: Wrap(
              alignment: WrapAlignment.center,
              children: imageUrls.asMap().entries.map((entry) {
                final int index = entry.key;
                final String url = entry.value;
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Image $index clicked!"), // Rename the image captions
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          url,
                          height: 100,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Image $index"), // Use "Image $index" as the caption
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ListTile(
            leading: Image.network(
              // Replace with your sample image URL
              "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Text("Photo 1"),
            subtitle: Text("Description for photo 1"),
          ),
          ListTile(
            leading: Image.network(
              // Replace with your sample image URL
              "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Text("Photo 2"),
            subtitle: Text("Description for photo 2"),
          ),
          ListTile(
            leading: Image.network(
              // Replace with your sample image URL
              "https://fotografias.antena3.com/clipping/cmsimages02/2022/12/23/61C0B7E6-300F-407A-AE9A-FD8548D6FF07/messi-copa-mundo_97.jpg?crop=3142,1767,x0,y0&width=1600&height=900&optimize=low&format=webply",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            title: Text("Photo 3"),
            subtitle: Text("Description for photo 3"),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(200),
            ),
            child: IconButton(
              icon: Icon(
                Icons.upload,
                color: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Photos Uploaded Successfully!"),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
