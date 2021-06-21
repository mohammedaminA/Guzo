import 'package:flutter/cupertino.dart';
import 'package:guzo/models/address.dart';

class AppData extends ChangeNotifier {
  Address pickUpLocation;

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
