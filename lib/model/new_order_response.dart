class NewOrderResponse{
  final int result;
  final String error;

  NewOrderResponse(
    this.result,
    this.error,
  );

  NewOrderResponse.fromJSON(Map<String, dynamic> json)
    : result = json['result'],
      error = null;

  NewOrderResponse.withError(String error)
    : result = null,
      error = error;

  NewOrderResponse.init()
    : result = null,
      error = null;

  NewOrderResponse.loading()
      : result = -1,
        error = null;
}