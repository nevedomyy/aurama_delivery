import 'package:http/http.dart' as http;
import '../model/calculation.dart';
import '../model/calculation_response.dart';
import 'dart:convert';


class ProviderCalculation {
  static final String _api = '';

  Future<CalculationResponse> getCalculation(Calculation calculation) async{
    try {
      var response = await http.get(_api);
      var responseBody = json.decode(response.body);
      return CalculationResponse.fromJSON(responseBody);
    } catch (e){
      return CalculationResponse.withError(e.toString());
    }
  }
}