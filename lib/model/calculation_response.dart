class CalculationResponse{
  final double result;
  final String error;

  CalculationResponse(
    this.result,
    this.error,
  );

  CalculationResponse.fromJSON(Map<String, dynamic> json)
    : result = json['result'],
      error = null;

  CalculationResponse.withError(String error)
    : result = null,
      error = error;

  CalculationResponse.init()
    : result = null,
      error = null;

  CalculationResponse.loading()
    : result = -1,
      error = null;
}