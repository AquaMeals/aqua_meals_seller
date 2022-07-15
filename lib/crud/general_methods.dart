String? getCurrentDate() {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  return "$day/$month/$year";
}

toCapitalize({String? string}) {
  return string.toString()[0].toUpperCase() + string!.substring(1);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
