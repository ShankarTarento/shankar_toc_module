import 'package:intl/intl.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';

class DateTimeHelper {
  static getFullTimeFormat(duration, {bool timelyDurationFlag = false}) {
    int hours = Duration(seconds: int.parse(duration)).inHours;
    int minutes = Duration(seconds: int.parse(duration)).inMinutes;
    int seconds = Duration(seconds: int.parse(duration)).inSeconds;
    String time;
    if (hours > 0) {
      if ((minutes - hours * 60) > 0) {
        time = hours.toString() +
            (timelyDurationFlag
                ? hours == 1
                    ? ' hour '
                    : ' hours '
                : 'h ') +
            (minutes - hours * 60).toString() +
            (timelyDurationFlag
                ? (minutes - hours * 60) == 1
                    ? ' minute '
                    : ' minutes '
                : 'm ');
      } else {
        time = hours.toString() +
            (timelyDurationFlag
                ? hours == 1
                    ? ' hour '
                    : ' hours '
                : 'h ');
      }
    } else if (minutes > 0) {
      if ((seconds - minutes * 60) > 0) {
        time = minutes.toString() +
            (timelyDurationFlag
                ? minutes == 1
                    ? ' minute '
                    : ' minutes '
                : 'm ') +
            (seconds - minutes * 60).toString() +
            (timelyDurationFlag
                ? seconds - minutes * 60 == 1
                    ? ' second '
                    : ' seconds '
                : 's');
      } else {
        time = minutes.toString() +
            (timelyDurationFlag
                ? minutes == 1
                    ? ' minute '
                    : ' minutes '
                : 'm ');
      }
    } else {
      time = seconds.toString() +
          (timelyDurationFlag
              ? seconds == 1
                  ? ' second '
                  : ' seconds '
              : 's');
    }
    return time;
  }

  static String getDateTimeInFormat(String dateTime,
      {String? desiredDateFormat}) {
    if (desiredDateFormat == null) {
      desiredDateFormat = IntentType.dateFormat;
    }
    final DateFormat formatter = DateFormat(desiredDateFormat);
    return formatter.format(DateTime.parse(dateTime));
  }

  static String getDateTimeFormatYYYYMMDD(String dateString) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = dateFormat.parse(dateString);
    return DateFormat("yyyy-MM-dd").format(dateTime);
  }

  static int getMilliSecondsFromTimeFormat(String duration) {
    List data = duration.split(' ');
    int totalDuration = 0;
    RegExp regex = RegExp(
        r'^\s*\d+\s*(h|hr|hour|hrs|m|min|minute|mins|s|sec|second|secs)\s*$',
        caseSensitive: false);
    data.removeWhere((element) => !(regex.hasMatch(element)));
    if (data.isEmpty) {
      return int.parse(duration);
    }
    for (var i = 0; i < data.length; i++) {
      int value =
          int.parse(data[i].toString().substring(0, data[i].length - 1));
      if (data[i].contains('h')) {
        totalDuration = totalDuration + (value * 60 * 60);
      } else if (data[i].contains('m')) {
        totalDuration = totalDuration + (value * 60);
      } else if (data[i].contains('s')) {
        totalDuration = totalDuration + value;
      }
    }
    return totalDuration;
  }

  static String getTimeFormatInHrs(int durationInMinutes) {
    if (durationInMinutes < 60) {
      return '${durationInMinutes}m';
    } else {
      int hours = durationInMinutes ~/ 60;
      int minutes = durationInMinutes % 60;
      if (minutes > 0) {
        return '${hours}h ${minutes}m';
      } else {
        return '${hours}h';
      }
    }
  }

  static String convertDateFormat(String date,
      {required String inputFormat, required String desiredFormat}) {
    DateTime parsedDate = DateFormat(inputFormat).parse(date.toString());
    return DateFormat(desiredFormat).format(parsedDate);
  }
}
