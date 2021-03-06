import '../repository/repository.dart';
import '../model/calculation_response.dart';
import '../model/new_order_response.dart';
import '../model/new_order.dart';
import '../model/calculation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';


class BlocNewOrder {
  final BehaviorSubject<NewOrder> _newOrder = BehaviorSubject<NewOrder>();
  final BehaviorSubject<NewOrderResponse> _newOrderResponse = BehaviorSubject<NewOrderResponse>();
  final BehaviorSubject<Calculation> _calculation = BehaviorSubject<Calculation>();
  final BehaviorSubject<CalculationResponse> _calculationResponse = BehaviorSubject<CalculationResponse>();

  changeOrderType(int orderType){
    int res = 1;
    switch(orderType){
      case 0: res = 1; break;//2
      case 1: res = 1; break;//7
      case 2: res = 1;
    }
    _newOrder.add(NewOrder.clone(_newOrder.value, orderType: res));
    _calculation.add(Calculation.clone(_calculation.value, orderType: res));
  }

  changeClientNameFrom(String clientNameFrom) => _newOrder.add(NewOrder.clone(_newOrder.value, clientNameFrom: clientNameFrom));
  changeClientContactFrom(String clientContactFrom) => _newOrder.add(NewOrder.clone(_newOrder.value, clientContactFrom: clientContactFrom));
  changeStreetFrom(String streetFrom) async{
    _newOrder.add(NewOrder.clone(_newOrder.value, streetFrom: streetFrom));
    var response = await repository.getGeo(streetFrom);
    _calculation.add(Calculation.clone(_calculation.value, lngFrom: response.lng, latFrom: response.lat));
  }
  changeDateTimeFrom(DateTime dateTimeFrom){
    _newOrder.add(NewOrder.clone(_newOrder.value, dateFrom: dateTimeFrom.toString().substring(0, 10), time1From: DateFormat.Hm().format(dateTimeFrom)));
    _calculation.add(Calculation.clone(_calculation.value, dateFrom: dateTimeFrom.toString().substring(0, 10), time1From: DateFormat.Hm().format(dateTimeFrom), time2From: DateFormat.Hm().format(dateTimeFrom)));
  } 
  changeClientPhoneFrom(String clientPhoneFrom) => _newOrder.add(NewOrder.clone(_newOrder.value, clientPhoneFrom: clientPhoneFrom));

  changeClientNameTo(String clientNameTo) => _newOrder.add(NewOrder.clone(_newOrder.value, clientNameTo: clientNameTo));
  changeClientContactTo(String clientContactTo) => _newOrder.add(NewOrder.clone(_newOrder.value, clientContactTo: clientContactTo));
  changeStreetTo(String streetTo) async{
    _newOrder.add(NewOrder.clone(_newOrder.value, streetTo: streetTo));
    var response = await repository.getGeo(streetTo);
    _calculation.add(Calculation.clone(_calculation.value, lngTo: response.lng, latTo: response.lat));
  }
  changeDateTimeTo(DateTime dateTimeTo){
    _newOrder.add(NewOrder.clone(_newOrder.value, dateTo: dateTimeTo.toString().substring(0, 10), time1To: DateFormat.Hm().format(dateTimeTo)));
    _calculation.add(Calculation.clone(_calculation.value, dateTo: dateTimeTo.toString().substring(0, 10), time1To: DateFormat.Hm().format(dateTimeTo), time2To: DateFormat.Hm().format(dateTimeTo)));
  } 
  changeClientPhoneTo(String clientPhoneTo) => _newOrder.add(NewOrder.clone(_newOrder.value, clientPhoneTo: clientPhoneTo));

  changeWeight(String weight){
    _newOrder.add(NewOrder.clone(_newOrder.value, weight: double.tryParse(weight) ?? 0));
    _calculation.add(Calculation.clone(_calculation.value, weight: double.tryParse(weight) ?? 0));
  } 
  changeValue(String value) => _newOrder.add(NewOrder.clone(_newOrder.value, value: double.tryParse(value) ?? 0));
  changePieces(String pieces) => _newOrder.add(NewOrder.clone(_newOrder.value, pieces: int.tryParse(pieces) ?? 0));
  changeAppraisedValue(String appraisedValue){
    _newOrder.add(NewOrder.clone(_newOrder.value, appraisedValue: double.tryParse(appraisedValue) ?? 0));
    _calculation.add(Calculation.clone(_calculation.value, appraisedValue: double.tryParse(appraisedValue) ?? 0));
  }
  changeCodAmount(String codAmount){
    _newOrder.add(NewOrder.clone(_newOrder.value, codAmount: double.tryParse(codAmount) ?? 0));
    _calculation.add(Calculation.clone(_calculation.value, codAmount: double.tryParse(codAmount) ?? 0));
  } 
  changeComment(String comment) => _newOrder.add(NewOrder.clone(_newOrder.value, comment: comment));

  sendRequest() async{
    _newOrderResponse.add(NewOrderResponse.loading());
    var response = await repository.sendRequest(_newOrder.value);
    _newOrderResponse.add(response);
  }

  dispose(){
    _newOrder.close();
    _newOrderResponse.close();
    _calculation.close();
    _calculationResponse.close();
  }

  init(){ 
    _newOrder.add(NewOrder.init());
    _newOrderResponse.add(NewOrderResponse.init());
    _calculation.add(Calculation.init());
    if(!_calculation.hasListener) _calculation.listen((Calculation calculation) => getCalculation(calculation));
  }

  getCalculation(Calculation calc) async{
    _calculationResponse.add(CalculationResponse.loading());
    var response = await repository.getCalculation(calc);
    _calculationResponse.add(response);
  }

  BehaviorSubject<NewOrder> get newOrder => _newOrder;
  BehaviorSubject<NewOrderResponse> get newOrderResponse => _newOrderResponse;
  BehaviorSubject<Calculation> get calculation => _calculation;
  BehaviorSubject<CalculationResponse> get calculationResponse => _calculationResponse;
}

final blocNewOrder = BlocNewOrder();