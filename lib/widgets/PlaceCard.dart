import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final String title, imagePath;
  PlaceCard(this.imagePath, this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: () => print('Hello world'),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                // leading: Icon(Icons.location_searching),
                title: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Image.asset(
                      imagePath,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}