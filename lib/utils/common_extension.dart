///
/// @date: 2022/4/15 09:58
/// @author: Sensi
/// @remark:
///
extension Date on DateTime {
  String toFormat() {
    final date = DateTime.now();
    final year = date.year;
    final month = date.month;
    final day = date.day;
    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final second = date.second.toString().padLeft(2, '0');
    return '$year-$month-$day $hour:$minute:$second';
  }
}
