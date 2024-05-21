import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../../../common/configs/default_environment.dart';
import '../../../common/exception/exception.dart';
import '../../models/number_model.dart';

abstract class NumberRemote {
  Future<NumberModel> getNumber(String type, int number);
  Future<NumberModel> getRandomNumber(String type);
}

class NumberRemoteImpl implements NumberRemote {
  NumberRemoteImpl(this.client);
  final Client client;

  @override
  Future<NumberModel> getNumber(String type, int number) async {
    final Uri url = Uri.parse('http://numbersapi.com/$number/$type');

    return _get(url);
  }

  @override
  Future<NumberModel> getRandomNumber(String type) async {
    final Uri url =
        Uri.parse('http://numbersapi.com/${DefaultEnvironment.random}/$type');
    return _get(url);
  }

  Future<NumberModel> _get(Uri url) async {
    final Response response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: DefaultEnvironment.contentTypeJson,
      },
    );

    if (response.statusCode == 200) {
      return NumberModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    }
    throw ServerException();
  }
}
