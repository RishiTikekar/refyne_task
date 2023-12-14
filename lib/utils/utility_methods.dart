class UtilityMethod {
  static bool isValidMap(dynamic value) {
    return value is Map && value.isNotEmpty;
  }

  static bool isValidList(dynamic value) {
    return value is List && value.isNotEmpty;
  }
}
