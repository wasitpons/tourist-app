import 'package:flutter/material.dart';
import '../widgets/PlaceCard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      title: 'Tourist Helper App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: <Widget>[
              PlaceCard('assets/place-01.jpg', 'วัดพระแก้ว'),
              PlaceCard('assets/place-02.jpg', 'ไอคอนสยาม'),
              PlaceCard('assets/place-03.jpg', 'ตลาดน้ำขวัญเรียม'),
              PlaceCard('assets/place-04.jpg', 'ตลาดนัดรถไฟ'),
              PlaceCard('assets/place-05.jpg', 'ท้องฟ้าจำลอง'),
            ],),
          ),
        ),
        appBar: AppBar(
          title: Text('Tourist Helper'),
        ),
      )
    );
  }
}
