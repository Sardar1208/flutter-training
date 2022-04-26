import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:training/data/address.dart';
import 'dart:convert';
import 'package:training/data/address.dart';

Future<String> _loadAddressAsset() async {
  return await rootBundle.loadString('assets/address.json');
}

Future<Address> loadAddress() async {
  String jsonString = await _loadAddressAsset();
  final jsonResponse = json.decode(jsonString);
  Address address = Address.fromJson(jsonResponse);
  print(address.streets);
  return address;
}
