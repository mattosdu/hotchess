import 'package:chess_hotspot/app/components/userprefs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  MapController mapController;
  Geolocator geolocator = Geolocator();
  LocationPermission permission;
  Position userLocation;
  @override
  void initState() {
    _determinePosition().then((value) {
      setState(() {
        userLocation = value;
      });
    });
    super.initState();
    _determinePosition().then((position) {
      userLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userLocation == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : new ChangeNotifierProvider(
              create: (ctx) => ThemeNotifier(),
              child: Consumer<ThemeNotifier>(
                builder: (context, ThemeNotifier notifier, child) {
                  return FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center:
                          LatLng(userLocation.latitude, userLocation.longitude),
                      minZoom: 12,
                      maxZoom: 17,
                      zoom: 14.2,
                      plugins: [
                        LocationMarkerPlugin(),
                      ],
                    ),
                    layers: [
                      TileLayerOptions(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        urlTemplate: notifier.darkTheme
                            ? 'https://api.mapbox.com/styles/v1/mattosdu/ckms6ai0f2hqi17tbmv62kc8b/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWF0dG9zZHUiLCJhIjoiY2ttczR1a3hzMGR4bDJvbXhoM2tmejg3MyJ9.UmLCXZrjrPcyUW9i2g4Jiw'
                            : 'https://api.mapbox.com/styles/v1/mattosdu/ckms5aks42ndn18o58dzkzgws/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWF0dG9zZHUiLCJhIjoiY2ttczR1a3hzMGR4bDJvbXhoM2tmejg3MyJ9.UmLCXZrjrPcyUW9i2g4Jiw',
                        keepBuffer: 8,
                        updateInterval: 100,
                      ),
                      MarkerLayerOptions(
                        markers: [
                          new Marker(
                            width: 26.0,
                            height: 26.0,
                            point: new LatLng(-23.5840, -46.4988),
                            builder: (ctx) => GestureDetector(
                              child: Icon(
                                FontAwesomeIcons.chess,
                                size: 26,
                                color: Theme.of(context).primaryColorLight,
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/vazio');
                              },
                            ),
                          ),
                        ],
                      ),
                      LocationMarkerLayerOptions(
                        showAccuracyCircle: false,
                        headingSectorColor: Color(0xC918AD62),
                        marker: Icon(
                          FontAwesomeIcons.solidCircle,
                          size: 18,
                          color: Colors.green[900],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    var currentLocation;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    try {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
