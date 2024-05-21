import 'package:flutter_facts_numbers/common/exception/exception.dart';
import 'package:flutter_facts_numbers/data/datasources/remote/number_remote.dart';
import 'package:flutter_facts_numbers/data/models/number_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_remote_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  //mock data
  final Response mockReponseData = Response(
    '{"number": 42, "text": "The answer is 42."}',
    200,
  );
  final Response mockReponseDataFail = Response(
    '{"number": 42, "text": "The answer is 42."}',
    404,
  );
  //mock functions
  final MockClient client = MockClient();
  //functions under test
  final NumberRemoteImpl numberRemote = NumberRemoteImpl(client);
  group('test getNumber()', () {
    test('return NumberModel when request api success', () async {
      //arrange
      when(
        client.get(
          Uri.parse('https://numbersapi.com/42/trivia'),
          headers: {'content-type': 'application/json'},
        ),
      ).thenAnswer((_) async => mockReponseData);
      //act
      final NumberModel result = await numberRemote.getNumber('trivia', 42);
      //assert
      expect(
        result,
        isA<NumberModel>(),
      );
      verify(
        client.get(
          Uri.parse('https://numbersapi.com/42/trivia'),
          headers: {'content-type': 'application/json'},
        ),
      ).called(1);
    });

    test('throw ServerException when request api fail', () async {
      //arrange
      when(
        client.get(
          Uri.parse('https://numbersapi.com/42/trivia'),
          headers: {'content-type': 'application/json'},
        ),
      ).thenAnswer((_) async => mockReponseDataFail);
      //act
      final Function call = numberRemote.getNumber;
      //assert
      expect(
        // ignore: avoid_dynamic_calls
        () => call('trivia', 42),
        throwsA(isA<ServerException>()),
      );
      verify(
        client.get(
          Uri.parse('https://numbersapi.com/42/trivia'),
          headers: {'content-type': 'application/json'},
        ),
      ).called(1);
    });
  });

  group('test getRandomNumber()', () {
    test('return NumberModel when request api success', () async {
      //arrange
      when(
        client.get(
          Uri.parse('https://numbersapi.com/random/trivia'),
          headers: {'content-type': 'application/json'},
        ),
      ).thenAnswer((_) async => mockReponseData);
      //act
      final NumberModel result = await numberRemote.getRandomNumber('trivia');
      //assert
      expect(
        result,
        isA<NumberModel>(),
      );
      verify(
        client.get(
          Uri.parse('https://numbersapi.com/random/trivia'),
          headers: {'content-type': 'application/json'},
        ),
      ).called(1);
    });

    test('throw ServerException when request api fail', () async {
      //arrange
      when(
        client.get(
          Uri.parse('https://numbersapi.com/random/trivia'),
          headers: {'content-type': 'application/json'},
        ),
      ).thenAnswer((_) async => mockReponseDataFail);
      //act
      final Function call = numberRemote.getRandomNumber;
      //assert
      expect(
        // ignore: avoid_dynamic_calls
        () => call('trivia'),
        throwsA(isA<ServerException>()),
      );
      verify(
        client.get(
          Uri.parse('https://numbersapi.com/random/trivia'),
          headers: {'content-type': 'application/json'},
        ),
      ).called(1);
    });
  });
}
