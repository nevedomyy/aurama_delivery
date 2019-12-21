import '../provider/provider_search_address.dart';
import '../provider/provider_new_order.dart';
import '../provider/provider_calculation.dart';
import '../provider/provider_geocode.dart';
import '../model/calculation_response.dart';
import '../model/calculation.dart';
import '../model/new_order_response.dart';
import '../model/geocode_response.dart';
import '../model/address_list.dart';
import '../model/new_order.dart';


class Repository {
  final ProviderSearchAddress _providerSearchAddress = ProviderSearchAddress();
  final ProviderNewOrder _providerNewOrder = ProviderNewOrder();
  final ProviderCalculation _providerCalculation = ProviderCalculation();
  final ProviderGeocode _providerGeocode = ProviderGeocode();

  Future<AddressList> getSearchAddress(String input) => _providerSearchAddress.getSearchAddress(input);
  Future<NewOrderResponse> sendRequest(NewOrder newOrder) => _providerNewOrder.sendRequest(newOrder);
  Future<CalculationResponse> getCalculation(Calculation calculation) => _providerCalculation.getCalculation(calculation);
  Future<GeocodeResponse> getGeo(String address) => _providerGeocode.getGeo(address);
}

final repository = Repository();