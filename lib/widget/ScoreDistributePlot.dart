import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartBean {
  static List<charts.Series<ScoreModel, String>> createData(
      BuildContext context, List score) {
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
        fillColorFn: (ScoreModel scores, _) => charts.Color.fromHex(
            code: "#" +
                Theme.of(context)
                    .primaryColor
                    .value
                    .toRadixString(16)
                    .substring(2)),
      )
    ];
  }
}

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
                ChartBean.createData(context, scoreData),
              )),
        )
      ],
    );
  }
}

class ScoreModel {
  final String scoreRange;
  final int counts;

  ScoreModel(this.scoreRange, this.counts);
}
