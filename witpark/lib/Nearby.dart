import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Nearby extends StatefulWidget {
  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  var lng, lat;
  bool loading = true;

  @override
  initState() {
    super.initState();
    loading = true;
    getLocation();
  }
GoogleMapController _googleMapController;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
  Future getLocation() async {
    final location = Location();
    var currentLocation = await location.getLocation();
    setState(() {
      lat = currentLocation.latitude;
      lng = currentLocation.longitude;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Map',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.8,
              child: loading == false
                  ? GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      onMapCreated: (controller) => _googleMapController = controller,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(lat, lng),
                        zoom: 15.0,
                      ))
                  : Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )),
            ),
          ),
        ),
      ),
    );
  }
}
