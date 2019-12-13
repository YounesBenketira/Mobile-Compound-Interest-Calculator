import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatefulWidget {
  final Widget child;
  final List<Map<String, String>> values;

  SimpleLineChart(this.values, {
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  List<charts.Series<Point, int>> _seriesLineData;
  int min = 0;
  int max = 100;

  _generateData() {
    if (widget.values == null) return;
    min = int.parse(widget.values.elementAt(1)["index"]);
    max = int.parse(widget.values.elementAt(widget.values.length - 1)["index"]);

    List<Point> points = [];

    for (Map<String, String> entry in widget.values) {
      if (entry["index"] == "Age") continue;
      points.add(new Point(entry["index"], entry["value"]));
    }

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.MaterialPalette.green.shadeDefault,
        id: 'Projection',
        data: points,
        domainFn: (Point point, _) => int.parse(point.age),
        measureFn: (Point point, _) => int.parse(point.value),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesLineData = List<charts.Series<Point, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: charts.LineChart(_seriesLineData,
                    domainAxis: new charts.NumericAxisSpec(
                      viewport: new charts.NumericExtents(min, max),
                    ),
                    defaultRenderer: new charts.LineRendererConfig(
                        includePoints: true,
                        includeLine: true,
                        includeArea: true,
                        stacked: true),
                    animate: true,
                    animationDuration: Duration(seconds: 2),
                    behaviors: [
                      new charts.LinePointHighlighter(
                          showHorizontalFollowLine:
                          charts.LinePointHighlighterFollowLineType.nearest,
                          showVerticalFollowLine: charts
                              .LinePointHighlighterFollowLineType.nearest),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Point {
  String age;
  String value;

  Point(this.age, this.value);
}
