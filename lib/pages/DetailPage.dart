import 'package:flutter/material.dart';
import 'package:tourist_helper/widgets/ExpansionBox.dart';
import 'package:tourist_helper/models/PlacesModel.dart';
import 'package:tourist_helper/widgets/StarRating.dart';

class DetailPage extends StatelessWidget {
  final String imagePath, title;
  DetailPage(this.imagePath, this.title);

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      title: 'Tourist Helper App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tourist Helper'),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back)),
        ),
        body: _DetailPage(imagePath, title),
      )
    );
  }
}
class _DetailPage extends StatelessWidget {
  final String imagePath, title;
  final placesData = PlacesModel();
  _DetailPage(this.imagePath, this.title);

  @override
  Widget build(BuildContext context) {
    return
    SingleChildScrollView(
      child: Container (
        child: Column(
          children: <Widget>[
            renderImage(context),
            renderDetail(this.title),
          ],
        ),
      ),
    );
  }

  Widget renderDetail(title) {
    Map data = placesData.getDataByTitle(title);

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            renderMapCard(),
            renderCard('สถานที่', data['title'], Icons.place),
            renderCard('เวลาเปิด-ปิด', data['openTime'], Icons.timer),
            renderRatingCard(
              'คะแนน (${data['reviewStar']})',
              double.parse(data['reviewStar']),
              Icons.rate_review
            ),
            AnimateExpanded(
              'ประวัติความเป็นมา',
              '     ${data['description']}',
            ),
          ],
        ),
      )
    );
  }

  Widget renderMapCard() {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: IconTheme(
                data: IconThemeData(
                    color: Colors.blue), 
                child: Icon(Icons.directions),
              ),
              title: Text('ค้นหาเส้นทาง'),
              subtitle: Text('แตะเพื่อเข้าสู่ระบบนำทาง'),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderCard(title, subtitle, icon) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: IconTheme(
                data: IconThemeData(
                    color: Colors.blue), 
                child: Icon(icon),
              ),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderRatingCard(title, point, icon) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: IconTheme(
                data: IconThemeData(
                    color: Colors.blue), 
                child: Icon(icon),
              ),
              title: Text(title),
              subtitle: StarRating(rating: point),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderImage(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height*0.3,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
