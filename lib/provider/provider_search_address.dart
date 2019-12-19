import 'package:http/http.dart' as http;
import '../model/address_list.dart';
import 'dart:convert';


class ProviderSearchAddress {
  static final String _api = '';

  Future<AddressList> getSearchAddress(String input) async{
    try {
      var response = await http.get(_api+input);
      var responseBody = json.decode(response.body);
      return AddressList.fromJSON(responseBody);
    } catch (e){
      return AddressList.withError(e.toString());
    }
  }
}
