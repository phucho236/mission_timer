import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {this.animate = false});

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory GroupedBarChart.withRandomData() {
    return new GroupedBarChart(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final thamGia = [
      new OrdinalSales('HK1', random.nextInt(100), color: Colors.red),
      new OrdinalSales('HK2', random.nextInt(100)),
      new OrdinalSales('HK3', random.nextInt(100)),
    ];

    final khonThamgia = [
      new OrdinalSales('HK1', random.nextInt(100)),
      new OrdinalSales('HK2', random.nextInt(100)),
      new OrdinalSales('HK3', random.nextInt(100)),
    ];

    final seThamGia = [
      new OrdinalSales('HK1', random.nextInt(100)),
      new OrdinalSales('HK2', random.nextInt(100)),
      new OrdinalSales('HK3', random.nextInt(100)),
    ];
    final chuaXacNhan = [
      new OrdinalSales('HK1', random.nextInt(100)),
      new OrdinalSales('HK2', random.nextInt(100)),
      new OrdinalSales('HK3', random.nextInt(100)),
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
          b: 179,
        ),
      ),
      //255,66,103,244
      new charts.Series<OrdinalSales, String>(
        id: 'KhongThamGia',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: khonThamgia,
        fillColorFn: (OrdinalSales sales, _) => charts.Color(
          a: 255,
          r: 66,
          g: 133,
          b: 244,
        ),
      ),

      //   //255,132,91,239
      new charts.Series<OrdinalSales, String>(
        id: 'SeThamgia',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: seThamGia,
        fillColorFn: (OrdinalSales sales, _) => charts.Color(
          a: 255,
          r: 132,
          g: 91,
          b: 239,
        ),
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'ChuaXacNhan',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: chuaXacNhan,
        fillColorFn: (OrdinalSales sales, _) => charts.Color(
          a: 255,
          r: 244,
          g: 123,
          b: 123,
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
