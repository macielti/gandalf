import 'dart:convert';
import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

fixtureAsJson(String name) async {
  final stringJson = await File('test/fixtures/$name').readAsString();
  return json.decode(stringJson);
}
