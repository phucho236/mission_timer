import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mission_timer/core/model/statistical_model.dart';

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate = false});

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory GroupedBarChart.withData(List<StatisticalModel> data) {
    return new GroupedBarChart(_createData(data));
  }
  static int formatInt(a, b) {
    final value = b / a;
    if (value.isNaN) return 0;
    return value.round();
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createData(
      List<StatisticalModel> data) {
    final thamGia = [
      new OrdinalSales(
        'HK1',
        formatInt(data[0].sumTask!, data[0].countDone!),
      ),
      new OrdinalSales('HK2', formatInt(data[1].sumTask!, data[1].countDone!)),
    ];

    final seThamGia = [
      new OrdinalSales(
        'HK1',
        formatInt(data[0].sumTask!, data[0].countAccepted!),
      ),
      new OrdinalSales(
          'HK2', formatInt(data[1].sumTask!, data[1].countAccepted!)),
    ];
    final chuaXacNhan = [
      new OrdinalSales(
          'HK1', formatInt(data[0].sumTask!, data[0].notAnswered!)),
      new OrdinalSales(
          'HK2', formatInt(data[1].sumTask!, data[1].notAnswered!)),
    ];
    final khonThamgia = [
      new OrdinalSales(
        'HK1',
        formatInt(data[0].sumTask!,
            (data[0].countRefuse! + data[0].countIncomplete!)),
      ),
      new OrdinalSales(
          'HK2',
          formatInt(data[1].sumTask!,
              (data[1].countRefuse! + data[1].countIncomplete!))),
    ];
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'ThamGia',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: thamGia,
        fillColorFn: (OrdinalSales sales, _) => charts.Color(
          a: 255,
          r: 0,
          g: 102,
          b: 179, //blu
        ),
      ),
      //255,66,103,244

      //   //255,132,91,239
      new charts.Series<OrdinalSales, String>(
        id: 'SeThamgia',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: seThamGia,
        fillColorFn: (OrdinalSales sales, _) => charts.Color(
          a: 255,
          r: 66,
          g: 133,
          b: 244, //blue occen
        ),
      ),

      new charts.Series<OrdinalSales, String>(
        id: 'ChuaXacNhan',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: chuaXacNhan,
        fillColorFn: (OrdinalSales sales, _) => charts.Color(
          a: 255,
          r: 132,
          g: 91,
          b: 239, //tim
        ),
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'KhongThamGia',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: khonThamgia,
        fillColorFn: (OrdinalSales sales, _) => charts.Color(
          a: 255,
          r: 244,
          g: 123,
          b: 123, //red
        ),
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;
  final Color? color;

  OrdinalSales(this.year, this.sales, {this.color});
}
