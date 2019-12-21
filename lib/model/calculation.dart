class Calculation{
  final String latTo;
  final String lngTo;
  final String latFrom;
  final String lngFrom;
  final int orderType;
  final double codAmount;
  final String dateFrom;
  final String time1From;
  final String time2From;
  final String dateTo;
  final String time1To;
  final String time2To;
  final double weight;
  final double appraisedValue;

  Calculation(
    this.latTo,
    this.lngTo,
    this.latFrom,
    this.lngFrom,
    this.orderType,
    this.codAmount,
    this.dateFrom,
    this.time1From,
    this.time2From,
    this.dateTo,
    this.time1To,
    this.time2To,
    this.weight,
    this.appraisedValue
  );

  Calculation.init()
    : latTo = '0',
      lngTo = '0',
      latFrom = '0',
      lngFrom = '0',
      orderType = 1,//2
      codAmount = 0,
      dateFrom = '',
      time1From = '',
      time2From = '',
      dateTo = '',
      time1To = '',
      time2To = '',
      weight = 0,
      appraisedValue = 0;

  Calculation.clone(Calculation calculation,{
    String latTo,
    String lngTo,
    String latFrom,
    String lngFrom,
    int orderType,
    double codAmount,
    String dateFrom,
    String time1From,
    String time2From,
    String dateTo,
    String time1To,
    String time2To,
    double weight,
    double appraisedValue
  }) : this(
      latTo ?? calculation.latTo,
      lngTo ?? calculation.lngTo,
      latFrom ?? calculation.latFrom,
      lngFrom ?? calculation.lngFrom,
      orderType ?? calculation.orderType,
      codAmount ?? calculation.codAmount,
      dateFrom ?? calculation.dateFrom,
      time1From ?? calculation.time1From,
      time2From ?? calculation.time2From,
      dateTo ?? calculation.dateTo,
      time1To ?? calculation.time1To,
      time2To ?? calculation.time2To,
      weight ?? calculation.weight,
      appraisedValue ?? calculation.appraisedValue
  );

  String toString(){
    return '?lat_to=$latTo'+
           '&lng_to=$lngTo'+
           '&lat_from=$latFrom'+
           '&lng_from=$lngFrom'+
           '&ordertype=$orderType'+
           '&COD_amount=$codAmount'+
           '&date_from=$dateFrom'+
           '&time1_from=$time1From'+
           '&time2_from=$time2From'+
           '&date_to=$dateTo'+
           '&time1_to=$time1To'+
           '&time2_to=$time2To'+
           '&weight=$weight'+
           '&appraised_value=$appraisedValue'+
           '&currency=RUB';
  }
}