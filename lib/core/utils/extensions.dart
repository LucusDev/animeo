extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String addPrefixToUrl() {
    if (startsWith("http")) {
      return this;
    }
    return "https://$this";
  }
}
