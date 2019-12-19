import 'dart:convert';
import 'dart:math';


class NewOrder{
  final String orderId;
  final int orderType;
  final String orderNumber;
  final String dateFrom;
  final String time1From;
  final String time2From;
  final String dateTo;
  final String time1To;
  final String time2To;
  final double value;
  final double weight;
  final int pieces;
  final String comment;
  final String orderBarcode;
  final double appraisedValue;
  final double codAmount;
  final int cityFrom;
  final String streetFrom;
  final String buildingFrom;
  final String roomFrom;
  final String clientNameFrom;
  final String clientContactFrom;
  final String clientPhoneFrom;
  final int cityTo;
  final String streetTo;
  final String buildingTo;
  final String roomTo;
  final String clientNameTo;
  final String clientContactTo;
  final String clientPhoneTo;

  NewOrder(
    this.orderId,
    this.orderType,
    this.orderNumber,
    this.dateFrom,
    this.time1From,
    this.time2From,
    this.dateTo,
    this.time1To,
    this.time2To,
    this.value,
    this.weight,
    this.pieces,
    this.comment,
    this.orderBarcode,
    this.appraisedValue,
    this.codAmount,
    this.cityFrom,
    this.streetFrom,
    this.buildingFrom,
    this.roomFrom,
    this.clientNameFrom,
    this.clientContactFrom,
    this.clientPhoneFrom,
    this.cityTo,
    this.streetTo,
    this.buildingTo,
    this.roomTo,
    this.clientNameTo,
    this.clientContactTo,
    this.clientPhoneTo
  );

  NewOrder.init()
    : orderId = Random().nextInt(999999).toString(),
      orderType = 1,//2
      orderNumber = Random().nextInt(9999).toString(),
      dateFrom = 'Время получения',
      time1From = '',
      time2From = '',
      dateTo = 'Время доставки',
      time1To = '',
      time2To = '',
      value = 0,
      weight = 0,
      pieces = 0,
      comment = '',
      orderBarcode = '',
      appraisedValue = 0,
      codAmount = 0,
      cityFrom = 78,
      streetFrom = 'Адрес',
      buildingFrom = '15',
      roomFrom = '15',
      clientNameFrom = '',
      clientContactFrom = '',
      clientPhoneFrom = '',
      cityTo = 78,
      streetTo = 'Адрес',
      buildingTo = '16',
      roomTo = '16',
      clientNameTo = '',
      clientContactTo = '',
      clientPhoneTo = '';

  NewOrder.clone(NewOrder newOrder,{
    String orderId,
    int orderType,
    String orderNumber,
    String dateFrom,
    String time1From,
    String time2From,
    String dateTo,
    String time1To,
    String time2To,
    double value,
    double weight,
    int pieces,
    String comment,
    String orderBarcode,
    double appraisedValue,
    double codAmount,
    int cityFrom,
    String streetFrom,
    String buildingFrom,
    String roomFrom,
    String clientNameFrom,
    String clientContactFrom,
    String clientPhoneFrom,
    int cityTo,
    String streetTo,
    String buildingTo,
    String roomTo,
    String clientNameTo,
    String clientContactTo,
    String clientPhoneTo
  }) : this(
      orderId ?? newOrder.orderId,
      orderType ?? newOrder.orderType,
      orderNumber ?? newOrder.orderNumber,
      dateFrom ?? newOrder.dateFrom,
      time1From ?? newOrder.time1From,
      time2From ?? newOrder.time2From,
      dateTo ?? newOrder.dateTo,
      time1To ?? newOrder.time1To,
      time2To ?? newOrder.time2To,
      value ?? newOrder.value,
      weight ?? newOrder.weight,
      pieces ?? newOrder.pieces,
      comment ?? newOrder.comment,
      orderBarcode ?? newOrder.orderBarcode,
      appraisedValue ?? newOrder.appraisedValue,
      codAmount ?? newOrder.codAmount,
      cityFrom ?? newOrder.cityFrom,
      streetFrom ?? newOrder.streetFrom,
      buildingFrom ?? newOrder.buildingFrom,
      roomFrom ?? newOrder.roomFrom,
      clientNameFrom ?? newOrder.clientNameFrom,
      clientContactFrom ?? newOrder.clientContactFrom,
      clientPhoneFrom ?? newOrder.clientPhoneFrom,
      cityTo ?? newOrder.cityTo,
      streetTo ?? newOrder.streetTo,
      buildingTo ?? newOrder.buildingTo,
      roomTo ?? newOrder.roomTo,
      clientNameTo ?? newOrder.clientNameTo,
      clientContactTo ?? newOrder.clientContactTo,
      clientPhoneTo ?? newOrder.clientPhoneTo
  );

  Map<String, String> toJSON(){
    final parameters = {
      'ordertype': orderType,
      'ordernumber': orderNumber,
      'date_from': dateFrom,
      'time1_from': time1From,
      'time2_from': time2From,
      'date_to': dateTo,
      'time1_to': time1To,
      'time2_to': time2To,
      'weight': weight,
      'value': value,
      'pieces': pieces,
      'comment': comment,
      'appraised_value': appraisedValue,
      'COD_amount': codAmount,
      'cityfrom': cityFrom,
      'streetfrom': streetFrom,
      'buildingfrom': buildingFrom,
      'roomfrom': roomFrom,
      'clientnamefrom': clientNameFrom,
      'clientcontactfrom': clientContactFrom,
      'clientphonefrom': clientPhoneFrom,
      'cityto': cityTo,
      'streetto': streetTo,
      'buildingto': buildingTo,
      'roomto': roomTo,
      'clientnameto': clientNameTo,
      'clientcontactto': clientContactTo,
      'clientphoneto': clientPhoneTo
    };
    final orders = json.encode({'$orderId': parameters});
    return {'orders': orders};
  }
}