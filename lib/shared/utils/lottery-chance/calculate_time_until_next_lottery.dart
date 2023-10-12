Map<String, int> calculateTimeUntilNextLottery(List<int> lotteryDays) {
  final now = DateTime.now();
  int daysRemaining = 0;
  int hoursRemaining = 0;
  int minutesRemaining = 0;
  int secondsRemaining = 0;
  // Find the next lottery day
  int nextLotteryDay = lotteryDays.firstWhere((day) => day >= now.weekday, orElse: () => lotteryDays.first);
  // Calculate time until the next lottery day
  if (nextLotteryDay == now.weekday) {
    // If today is a lottery day, calculate countdown until the next occurrence
    final nextLotteryTime = DateTime(now.year, now.month, now.day, 0, 0).add(const Duration(days: 1));
    final difference = nextLotteryTime.difference(now);
    daysRemaining = difference.inDays;
    hoursRemaining = difference.inHours % 24;
    minutesRemaining = difference.inMinutes % 60;
    secondsRemaining = difference.inSeconds % 60;
  } else {
    // If today is not a lottery day, calculate countdown until the next occurrence in the current week
    final nextLotteryTime = now.add(Duration(days: nextLotteryDay - now.weekday));
    final difference = nextLotteryTime.difference(now);
    daysRemaining = difference.inDays;
    hoursRemaining = difference.inHours % 24;
    minutesRemaining = difference.inMinutes % 60;
    secondsRemaining = difference.inSeconds % 60;
  }

  return {'days': daysRemaining, 'hours': hoursRemaining, 'minutes': minutesRemaining, 'seconds': secondsRemaining};
}
