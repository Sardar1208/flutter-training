class Address {
  String city;
  List<String> streets;

  Address({required this.city, required this.streets});

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    return Address(
      city: "Raigarh",
      streets: ["Hill view", "JSPL"],
    );
  }
}
