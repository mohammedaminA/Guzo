import 'package:geolocator/geolocator.dart';

import 'package:guzo/configs/map_config.dart';
import 'package:guzo/dataHandler/appData.dart';
import 'package:guzo/models/address.dart';
import 'package:provider/provider.dart';
import 'requestHelper.dart';

class HelperMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    String placeAddress = '';
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${MapConfig.apiKey}';

    var response = await RequestHelper.getRequest(url);

    if (response != 'failed') {
      placeAddress = response['results'][0]['formatted_address'];

      Address userPickUpAddress = Address();
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.placeName = placeAddress;

      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }

    return placeAddress;
  }a
}
