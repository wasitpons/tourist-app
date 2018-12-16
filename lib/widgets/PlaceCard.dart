import 'package:flutter/material.dart';
import '../pages/DetailPage.dart';
class PlaceCard extends StatelessWidget {
  final String title, imagePath;
  PlaceCard(this.imagePath, this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(this.imagePath, this.title)),
        ),
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  // leading: Icon(Icons.location_searching),
                  title: Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imagePath,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}