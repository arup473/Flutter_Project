import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherList(),
    );
  }
}

class WeatherList extends StatefulWidget {
  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  List<Map<String, dynamic>> citiesWeather = [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5,
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8,
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2,
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0,
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
      ),
      body: ListView.builder(
        itemCount: citiesWeather.length,
        itemBuilder: (context, index) {
          return WeatherCard(cityWeather: citiesWeather[index]);
        },
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> cityWeather;

  WeatherCard({required this.cityWeather});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'City: ${cityWeather['city']}',
              style: TextStyle(fontSize: 17),
            ),
            Text('Temperature: ${cityWeather['temperature']}°C' , style: TextStyle(color: Colors.grey),),
            Text('Condition: ${cityWeather['condition']}', style: TextStyle(color: Colors.grey),),
            Text('Humidity: ${cityWeather['humidity']}%', style: TextStyle(color: Colors.grey),),
            Text('Wind Speed: ${cityWeather['windSpeed']} km/h', style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}