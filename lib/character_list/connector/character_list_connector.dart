import 'dart:convert';

import 'package:marvel_api/character_list/connector/model/character_list_response.dart';
import 'package:marvel_api/commons/connector/connector.dart';

class CharacterListConnector extends Connector {
  CharacterListConnector({required this.path}) : super();

  final String path;

  Future<CharacterListResponse?>? getCharacterList() async {
    final response = await client.get(
      Uri.parse('$baseUrl$path'),
      params: {
        'apikey': '7aad2c2cad314c843b0d3a2374b49a39',
        'ts': 1,
        'hash': '095de9a5a1e8e35ee7d1f6ff41dd17ba'
      },
    );

    if (response.statusCode == 200) {
      return CharacterListResponse.fromJson(jsonDecode(response.body));
    }
  }
}
