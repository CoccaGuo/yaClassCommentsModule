import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ScoreDistributePlot extends StatelessWidget {
  final List scoreData;
  const ScoreDistributePlot(this.scoreData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "总评成绩分布",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ))),
        Container(
          height: 150,
          child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 4),
              child: charts.BarChart(
                ChartBean.createData(scoreData),
              )),
        )
      ],
    );
  }
}

class ChartBean {
  static List<charts.Series<ScoreModel, String>> createData(List score) {
    List<ScoreModel> data = [];
    score.asMap().forEach((key, value) {
      data.add(ScoreModel((key * 5 + 60).toString(), value));
    });
    return [
      charts.Series<ScoreModel, String>(
        id: "scores",
        domainFn: (ScoreModel scores, _) => scores.scoreRange,
        measureFn: (ScoreModel scores, _) => scores.counts,
        data: data,
      )
    ];
  }
}

class ScoreModel {
  final String scoreRange;
  final int counts;

  ScoreModel(this.scoreRange, this.counts);
}
