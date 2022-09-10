library dni_nie_validator;

extension Dni_Nie_validator on String {
  /// Validate if the DNI entered is valid in format and calculate the corresponding letter.
  bool isValidDNI() {
    final String _dni = "^\\d{8}[a-zA-Z]{1}\$";
    List<String> letters = [
      "T",
      "R",
      "W",
      "A",
      "G",
      "M",
      "Y",
      "F",
      "P",
      "D",
      "X",
      "B",
      "N",
      "J",
      "Z",
      "S",
      "Q",
      "V",
      "H",
      "L",
      "C",
      "K",
      "E"
    ];
    if (RegExp(_dni, caseSensitive: false, multiLine: false).hasMatch(this.toString())) {
      final letter = letters[(int.parse(this.substring(0, 8)) % 23)];
      if (letter == this.substring(8, 9).toUpperCase().toString()) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  /// Validate if the NIE entered is valid in format and calculate the corresponding letter.
  bool isValidNIE() {
    String _nie = "";
    final String _nieRegex = "^[XxYyZz]{1}[0-9]{7}[a-zA-Z]{1}\$";
    List<String> letters = [
      "T",
      "R",
      "W",
      "A",
      "G",
      "M",
      "Y",
      "F",
      "P",
      "D",
      "X",
      "B",
      "N",
      "J",
      "Z",
      "S",
      "Q",
      "V",
      "H",
      "L",
      "C",
      "K",
      "E"
    ];
    if (RegExp(_nieRegex, caseSensitive: false, multiLine: false).hasMatch(this.toString())) {
      switch (this.substring(0, 1).toUpperCase().toString()) {
        case 'X':
          _nie = this.replaceAll(this.substring(0, 1), '0');
          break;
        case 'Y':
          _nie = this.replaceAll(this.substring(0, 1), '1');
          break;
        case 'Z':
          _nie = this.replaceAll(this.substring(0, 1), '2');
          break;
      }

      final letter = letters[(int.parse(_nie.substring(0, 8)) % 23)];
      if (letter == _nie.substring(8, 9).toUpperCase().toString()) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  /// Validate if the CIF entered is valid in format and calculate the corresponding letter.
  /// Translate from https://gist.github.com/afgomez/5691823#file-validate_spanish_id-js
  bool isValidCIF() {
    final String _cifRegex = r'[ABCDEFGHJNPQRSUVW]\d{7}[0-9A-J]';

    if (!RegExp(_cifRegex, caseSensitive: false, multiLine: false).hasMatch(this.toString())) {
      return false;
    }

    String letter = this.toString().substring(0, 1);
    String number = this.toString().substring(1, 8);
    String control = this.toString().substring(8);
    int evenSum = 0;
    int oddSum = 0;
    int lastDigit = 0;
    int n;

    for (var i = 0; i < number.length; i++) {
      n = int.parse(number[i]);

      // Odd positions (Even index equals to odd position. i=0 equals first position)
      if (i % 2 == 0) {
        // Odd positions are multiplied first.
        n *= 2;

        // If the multiplication is bigger than 10 we need to adjust
        oddSum += n < 10 ? n : n - 9;

        // Even positions
        // Just sum them
      } else {
        evenSum += n;
      }
    }
    String strSum = (evenSum + oddSum).toString();
    lastDigit = int.parse(strSum[strSum.length - 1]);

    int controlDigit = lastDigit != 0 ? (10 - lastDigit) : lastDigit;
    String controlLetter = 'JABCDEFGHI'[controlDigit];

    // Control must be a digit
    if ('ABEH'.contains(letter)) {
      return control == controlDigit.toString();

      // Control must be a letter
    } else if ('PQSW'.contains(letter)) {
      return control == controlLetter;

      // Can be either
    } else {
      return control == controlDigit.toString() || control == controlLetter;
    }
  }
}
