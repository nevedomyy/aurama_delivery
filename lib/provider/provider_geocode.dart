import 'package:http/http.dart' as http;
import '../model/geocode_response.dart';
import 'dart:convert';


class ProviderGeocode {
  static final String _api = '';

  Future<GeocodeResponse> getGeo(String address) async{
    try {
      var response = await http.get(_api+address+'&save');
      var responseBody = json.decode(response.body);
      return GeocodeResponse.fromJSON(responseBody);
    } catch (e){
      return GeocodeResponse.withError(e.toString());
    }
  }
}