String updateTime = '';

class UpdateTime {
  static String whenUpdated(
    int updateTime,
  ) {
    final time = DateTime.now().millisecondsSinceEpoch;
    final differenceTime = time - updateTime;

    late final String result;

    if (differenceTime > 1000 && differenceTime < 60000) {
      result = 'Updated ${differenceTime ~/ 1000} seconds ago';
    } else if (differenceTime > 60000 && differenceTime < 3600000) {
      result = 'Updated ${differenceTime ~/ 60000} minutes ago';
    } else if (differenceTime > 3600000 && differenceTime < 86400000) {
      result = 'Updated ${differenceTime ~/ 3600000} hours ago';
    } else if (differenceTime > 86400000) {
      result = 'Updated ${differenceTime ~/ 86400000} days ago';
    }

    return result;
  }
}
