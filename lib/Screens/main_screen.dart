import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guzo/widgets/divider.dart';

class MainScreen extends StatefulWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Completer<GoogleMapController> _controllerMap = Completer();

  GoogleMapController newMapController;

  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL),
              ),
              onPressed: () {})),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: MainScreen._kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerMap.complete(controller);
              newMapController = controller;
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 320.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 6.0,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      'Hi there, ${user.displayName}',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Text(
                      'Where to?',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 6.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.lightBlueAccent,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Search Drop Off Location')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add home'),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Your home address',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DividerWidget(),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add work'),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Your work address',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
