import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tourist_helper/pages/HomePage.dart';
import 'dart:async';
class MapPage extends StatelessWidget {
  final Map data;
  MapPage(this.data);

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      title: 'Tourist Helper App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MapPageManageState(data)
    );
  }
}
class MapPageManageState extends StatefulWidget {
  final Map data;
  MapPageManageState(this.data);
  @override
  State createState() => MapPageState();
}

class MapPageState extends State<MapPageManageState> {
  Timer timer;
  GoogleMapController mapController;
  double _lat,_long;
  bool isShowMarker = false;

  @override
  initState() {
    super.initState();
    Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then(
      (location) {
        if(location != null) {
          this.setState(() {
            _lat = location.latitude;
            _long = location.longitude;
          });
        }
      }
    );
  }
  handleMarker() {
    if(isShowMarker) {
      mapController.addMarker(MarkerOptions(
        position: LatLng(_lat, _long),
        draggable: false,
        infoWindowText: InfoWindowText('Chulalongkorn', 'Place'))
      ).then(
        (val) {
          mapController.addMarker(MarkerOptions(
            position: LatLng(double.parse(widget.data['lat']), double.parse(widget.data['long'])),
            draggable: false,
            infoWindowText: InfoWindowText(widget.data['title'], 'Place'))
          );
        }
      );
    } else {
      mapController.clearMarkers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourist Helper'),
        leading: GestureDetector(
          onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ),
          child: Icon(Icons.arrow_back)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          setState(() {
            isShowMarker = !isShowMarker;
            handleMarker();
          });
        },
        tooltip: 'Show Marker',
        child: Icon(Icons.place),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.86,
              child: _lat == null ? 
              Center(
                child: Text("Loading ...")
              )
              : GoogleMap(
                onMapCreated: _onMapCreated,
                options: GoogleMapOptions(
                  cameraPosition: CameraPosition(
                    target: LatLng(_lat + 0.080, _long - 0.080),
                    zoom: 12.0
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() { mapController = controller; });
  }
}