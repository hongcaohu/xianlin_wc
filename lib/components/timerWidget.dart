import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:xianlin_wc/model/UsingModel.dart';

class TimerWidget extends StatefulWidget {

  TimerWidget({Key key, this.usingModel}): super(key: key);

  final UsingModel usingModel;

  @override
  _TimerWidgetState createState() {
    return _TimerWidgetState();
  }
}

class _TimerWidgetState extends State<TimerWidget> {

  String date;
  String time;
  String week;
  TimerUtil timer;

  @override
  void initState() {
    super.initState();
    //开始初始化定时器
    timer = createTimerUtil(1000, (i) {
      DateTime currentDT = DateTime.now().toUtc().add(Duration(hours: 8));
      setState(() {
        this.date =
            DateUtil.formatDate(currentDT, format: DataFormats.zh_y_mo_d);
        this.time =
            DateUtil.formatDate(currentDT, format: DataFormats.h_m_s);
        this.week = DateUtil.getZHWeekDay(currentDT);
      });
      widget.usingModel?.clearTodayUse();
    });
    //启动定时器
    timer?.startTimer();
  }

  TimerUtil createTimerUtil(int millisecond, OnTimerTickCallback callback) {
    TimerUtil timer = TimerUtil();
    timer.setInterval(millisecond);
    timer.setOnTimerTickCallback(callback);
    return timer;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            this.date + " " + this.week,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            this.time,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
