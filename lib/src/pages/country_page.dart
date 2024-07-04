import 'package:flutter/material.dart';
import '../models/models.dart';

class CountryPage extends StatelessWidget {
  final Country country;

  CountryPage({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
        backgroundColor: Color.fromARGB(255, 146, 140, 140),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: country.topBrands.length,
          itemBuilder: (context, index) {
           return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.black, // Change the color to black
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                title: Text(
                  country.topBrands[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromARGB(255, 187, 180, 180), // White text color for contrast
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
