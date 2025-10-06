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
}
