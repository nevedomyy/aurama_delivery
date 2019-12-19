import 'address.dart';


class AddressList{
  final List<Address> list;
  final String error;

  AddressList({
    this.list,
    this.error,
  });

  factory AddressList.fromJSON(Map<String, dynamic> json){
    Map<String, dynamic> map = json['address_list'];
    return AddressList(
      list: List.generate(map.length, (i) => Address.fromJSON(map['${i+1}'])),
      error: null
    );
  }

  AddressList.withError(String error)
    : list = null,
      error = error;
}