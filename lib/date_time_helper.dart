// convert date objecyt to yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  // year in yyyy
  String year = dateTime.year.toString();

  // month
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0' + month;
  }
  // day
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0' + day;

  }
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
