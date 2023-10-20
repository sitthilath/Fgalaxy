import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class CountdownCurrentDrawLottery extends StatefulWidget {
  const CountdownCurrentDrawLottery({
    Key? key,
    required this.secondsRemaining,
    required this.whenTimeExpires,
    this.countDownTimerStyle,
    this.countDownFormatter,
  }) : super(key: key);

  final int secondsRemaining;
  final VoidCallback whenTimeExpires;
  final TextStyle? countDownTimerStyle;
  final Function(int seconds)? countDownFormatter;

  @override
  State<CountdownCurrentDrawLottery> createState() =>
      _CountdownCurrentDrawLotteryState();
}

class _CountdownCurrentDrawLotteryState
    extends State<CountdownCurrentDrawLottery> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Duration duration;

  Map<String, dynamic> get getTimerDisplayString {
    final duration = _controller.duration! * _controller.value;
    // if (widget.countDownFormatter != null) {
    //   return widget.countDownFormatter!(duration.inSeconds);
    // }
    return formatDDHHMMSS(duration.inSeconds);
  }

  Map<String, dynamic> formatDDHHMMSS(int seconds) {
    final days = (seconds / 86400).truncate();
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();
    return <String, dynamic>{
      'days': days,
      'hours': hours,
      'minutes': minutes,
      'seconds': (seconds % 60),
    };
  }

  @override
  void initState() {
    super.initState();
    duration = Duration(seconds: widget.secondsRemaining);
    _controller = AnimationController(vsync: this, duration: duration);
    _controller
      ..reverse(from: widget.secondsRemaining.toDouble())
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          widget.whenTimeExpires();
        }
      });
  }

  @override
  void didUpdateWidget(covariant CountdownCurrentDrawLottery oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.secondsRemaining != oldWidget.secondsRemaining) {
      setState(() {
        duration = Duration(seconds: widget.secondsRemaining);
        _controller.dispose();
        _controller = AnimationController(vsync: this, duration: duration);
        _controller
          ..reverse(from: widget.secondsRemaining.toDouble())
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.whenTimeExpires();
            }
          });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _timeBox(getTimerDisplayString['days'], 'day'),
              widthBox(6),
              SizedBox(
                height: 50,
                child: Text(
                  ':',
                  style: stylePrimary(size: 14, weight: FontWeight.w600),
                ),
              ),
              widthBox(9),
              _timeBox(getTimerDisplayString['hours'], 'hour'),
              widthBox(6),
              SizedBox(
                height: 50,
                child: Text(
                  ':',
                  style: stylePrimary(size: 14, weight: FontWeight.w600),
                ),
              ),
              widthBox(9),
              _timeBox(getTimerDisplayString['minutes'], 'minute'),
              widthBox(6),
              SizedBox(
                height: 50,
                child: Text(
                  ':',
                  style: stylePrimary(size: 14, weight: FontWeight.w600),
                ),
              ),
              widthBox(9),
              _timeBox(getTimerDisplayString['seconds'], 'second'),
            ],
          );
        },
      ),
    );
  }

  _timeBox(int time, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            time > 0 ? time.toString().padLeft(2, '0') : '00',
            style: styleWhite(weight: FontWeight.w800, size: 20),
          ),
        ),
        heightBox(5),
        Text(
          Txt.t(context, title),
          style: styleBlack(weight: FontWeight.w400, size: 14),
        ),
      ],
    );
  }
}
