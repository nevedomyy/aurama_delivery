class Address{
  final String address2;

  Address({
    this.address2
  });

  Address.fromJSON(Map<String, dynamic> json)
    : address2 = json['address2'];
}