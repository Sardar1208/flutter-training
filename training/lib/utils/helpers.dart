String getDate(String longDate) {
  DateTime newDate = DateTime.parse(longDate);
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return '${newDate.day} ${months[newDate.month - 1]}';
}
