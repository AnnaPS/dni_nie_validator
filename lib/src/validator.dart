library dni_nie_validator;

extension Dni_Nie_validator on String {
  bool isValidDNI() {
    final String _DNI = "^\\d{8}[a-zA-Z]{1}\$";
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
    if (RegExp(_DNI, caseSensitive: false, multiLine: false)
        .hasMatch(this.toString())) {
      final letter = letters[(int.parse(this.substring(0, 8)) % 23)];
      if (letter == this.substring(8, 9).toUpperCase().toString()) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  bool isValidNIE() {
    String _nie = "";
    final String _NIE = "^[XxYyZz]{1}[0-9]{7}[a-zA-Z]{1}\$";
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
    if (RegExp(_NIE, caseSensitive: false, multiLine: false)
        .hasMatch(this.toString())) {
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
}
