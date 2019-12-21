class CalculationResponse{
  final int calcResult;
  final costDelivery;
  final String message;
  final String error;

  CalculationResponse(
    this.calcResult,
    this.costDelivery,
    this.message,
    this.error,
  );

  CalculationResponse.fromJSON(Map<String, dynamic> json)
    : calcResult = json['calc']['calc_result'],
      costDelivery = json['calc']['cost_delivery'],
      message = json['calc']['message'],
      error = null;

  CalculationResponse.withError(String error)
    : calcResult = null,
      costDelivery = null,
      message = null,
      error = error;

  CalculationResponse.init()
    : calcResult = null,
      costDelivery = null,
      message = null,
      error = null;

  CalculationResponse.loading()
    : calcResult = -1,
      costDelivery = null,
      message = null,
      error = null;
}