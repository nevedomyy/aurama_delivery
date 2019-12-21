class GeocodeResponse{
  final int result;
  final String lat;
  final String lng;
  final String mdAddress;
  final String error;

  GeocodeResponse(
    this.result,
    this.lat,
    this.lng,
    this.mdAddress,
    this.error
  );

  GeocodeResponse.fromJSON(Map<String, dynamic> json)
    : result = json['result'],
      lat = json['lat'],
      lng = json['lng'],
      mdAddress = json['md_address'],    
      error = null;

  GeocodeResponse.withError(String error)
    : result = 0,
      lat = null,
      lng = null,
      mdAddress = null,
      error = error;
}
