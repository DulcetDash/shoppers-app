// ignore_for_file: file_names

class DateParser {
  final String dateString;

  DateParser(this.dateString);

  //?1. Get normal readable time
  String getReadableTime() {
    DateTime dateTime = DateTime.parse(dateString);

    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  //?2. Get normal readable date
  String getReadableDate() {
    DateTime dateTime = DateTime.parse(dateString);

    return '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year} at ${getReadableTime()}';
  }
}
