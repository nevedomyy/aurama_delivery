/*
Sends an HTTP POST request with the given headers and body to the given URL, which can be a [Uri] or a [String].
[body] sets the body of the request. It can be a [String], a [List<int>] or a [Map<String, String>]. If it's a String, it's encoded using [encoding] and used as the body of the request. The content-type of the request will default to "text/plain".
If [body] is a List, it's used as a list of bytes for the body of the request.
If [body] is a Map, it's encoded as form fields using [encoding]. The content-type of the request will be set to "application/x-www-form-urlencoded"; this cannot be overridden.
[encoding] defaults to [utf8].
For more fine-grained control over the request, use [Request] or [StreamedRequest] instead.
*/

import 'package:http/http.dart' as http;
import '../model/new_order_response.dart';
import '../model/new_order.dart';
import 'dart:convert';


class ProviderNewOrder {
  static final String _api = '';

  Future<NewOrderResponse> sendRequest(NewOrder newOrder) async{
    try {
      var response = await http.post(_api, body: newOrder.toJSON());
      var responseBody = json.decode(response.body);
      return NewOrderResponse.fromJSON(responseBody);
    } catch (e){
      return NewOrderResponse.withError(e.toString());
    }
  }
}