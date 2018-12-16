import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
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
        body: MapPageManageState(),
      )
    );
  }
}
class MapPageManageState extends StatefulWidget {
  @override
  State createState() => MapPageState();
}

class MapPageState extends State<MapPageManageState> {

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.80,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
            ),
          ),
        ),
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }
}