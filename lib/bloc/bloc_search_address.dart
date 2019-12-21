import '../repository/repository.dart';
import '../model/address_list.dart';
import 'package:rxdart/rxdart.dart';


class BlocSearchAddress {
  final BehaviorSubject<AddressList> _searchAddress = BehaviorSubject<AddressList>();

  getAddressList(String input) async {
    var response = await repository.getSearchAddress(input);
    _searchAddress.add(response);
  }

  dispose() => _searchAddress.close();

  BehaviorSubject<AddressList> get searchAddress => _searchAddress;
}