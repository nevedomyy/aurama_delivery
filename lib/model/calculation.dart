class Calculation{
  final double value;
  final double weight;
  final int pieces;

  Calculation(
    this.value,
    this.weight,
    this.pieces
  );

  Map<String, dynamic> toJSON(){
    return {
      'value': value,
      'weight': weight,
      'pieces': pieces,
    };
  }
}

