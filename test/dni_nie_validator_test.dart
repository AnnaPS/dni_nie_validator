import 'package:flutter_test/flutter_test.dart';

import 'package:dni_nie_validator/dni_nie_validator.dart';

void main() {
  test('validate DNI', () {
    expect('54566045v'.isValidDNI(), true);
    expect('54566045V'.isValidDNI(), true);
    expect('54566045i'.isValidDNI(), false);
  });
  test('validate CIF', () {
    expect('E47460258'.isValidCIF(), true);
    expect('J95486403'.isValidCIF(), true);
    expect('F14547923'.isValidCIF(), false);
  });
}
