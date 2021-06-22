import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guzo/dataHandler/appData.dart';
import 'package:guzo/helpers/requestHelper.dart';
import 'package:provider/provider.dart';
import 'package:guzo/configs/map_config.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropOffController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String placeAddress =
        Provider.of<AppData>(context).pickUpLocation.placeName ?? "";
    pickUpController.text = placeAddress;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 215.0,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.5,
                  blurRadius: 6.0,
                  offset: Offset(0.7, 0.7))
            ]),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 25.0, top: 35.0, right: 25.0, bottom: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Center(
                        child: Text(
                          'Set Drop Off',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Brand-Bold'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'images/pickicon.png',
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 18.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Pickup Location',
                                fillColor: Colors.grey[400],
                                filled: true,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0,
                                    top: 8.0,
                                    right: 11.0,
                                    bottom: 8.0),
                              ),
                              controller: pickUpController,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'images/desticon.png',
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 18.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Where to?',
                                fillColor: Colors.grey[400],
                                filled: true,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0,
                                    top: 8.0,
                                    right: 11.0,
                                    bottom: 8.0),
                              ),
                              controller: dropOffController,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void findPlace(String placeName) async {
    if (placeName.length > 1) {
      String url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=${MapConfig.apiKey}&sessiontoken=1234567890';

      var response = await RequestHelper.getRequest(url);
    }
  }
}
