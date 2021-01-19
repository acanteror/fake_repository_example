import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:problems_and_solutions_examples/features/user/domain/models/user.dart';

import '../../../../fixture_reader.dart';
import 'fakes/user.dart';

void main() {
  group('features.user', () {
    test(
      'User fromMap should return a valid model',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          fixture('test/features/user/domain/models/fixtures/user.json'),
        ) as Map<String, dynamic>;

        final User _result = User.fromMap(jsonMap);

        expect(_result, tUser);
      },
    );
  });
}
