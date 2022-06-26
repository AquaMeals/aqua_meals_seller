String? getCurrentDate() {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  return "$day/$month/$year";
}
