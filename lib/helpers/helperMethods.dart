import 'package:geolocator/geolocator.dart';

import 'package:guzo/configs/map_config.dart';
import 'requestHelper.dart';

class HelperMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = '';
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${MapConfig.apiKey}';

    var response = await RequestHelper.getRequest(url);

    if (response != 'failed') {
      placeAddress = response['results'][0]['formatted_address'];
    }

    return placeAddress;
  }
}
