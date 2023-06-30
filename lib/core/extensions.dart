import 'package:intl/intl.dart';

extension DateTimeEx on int {
  String toDateTime() {
    final formatter = DateFormat('MMM d');
    final date = DateTime.fromMillisecondsSinceEpoch((this / 1000).round());
    return formatter.format(date);
  }
}