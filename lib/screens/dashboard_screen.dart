import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:wallet_flutter/screens/dashboard.dart';
import 'package:wallet_flutter/utilities/constants.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<charts.Series<Spend, String>> _seriesPieData;
  List<charts.Series<SpendDaily, String>> _seriesBarData;
  _generateData() {
    var spendPieData = [
      new Spend('Shopping', 10, Color(0xff3366cc)),
      new Spend('Rent', 35, Color(0xff990099)),
      new Spend('Food & Grocery', 25, Color(0xff109618)),
      new Spend('Entertainment', 15, Color(0xfffdbe19)),
      new Spend('Donation', 15, Color(0xffff9900)),
    ];
    var spendBarData = [
      new SpendDaily('1/12/19', 100,
          charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)),
      new SpendDaily('2/12/19', 150,
          charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)),
      new SpendDaily('3/12/19', 50,
          charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)),
      new SpendDaily('4/12/19', 70,
          charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)),
      new SpendDaily('5/12/19', 80,
          charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)),
    ];
    _seriesBarData.add(
      charts.Series(
        data: spendBarData,
        domainFn: (SpendDaily spendDaily, _) => spendDaily.day,
        measureFn: (SpendDaily spendDaily, _) => spendDaily.amount,
        colorFn: (SpendDaily spendDaily, _) => spendDaily.barColor,
        id: 'Daily Expenditure',
//        labelAccessorFn: (Spend spend, _) => '${spend.cost}',
      ),
    );

    _seriesPieData.add(
      charts.Series(
        data: spendPieData,
        domainFn: (Spend spend, _) => spend.spendOn,
        measureFn: (Spend spend, _) => spend.cost,
        colorFn: (Spend spend, _) =>
            charts.ColorUtil.fromDartColor(spend.colorVal),
        id: 'Spending',
        labelAccessorFn: (Spend spend, _) => '${spend.cost}',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Spend, String>>();
    _seriesBarData = List<charts.Series<SpendDaily, String>>();
    _generateData();
  }

  Material myHead(String title, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                        color: Color(color),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 14.0)),
                SizedBox(height: 10.0),
                Expanded(
                  child: charts.PieChart(
                    _seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 2),
                    behaviors: [
                      charts.DatumLegend(
                        outsideJustification:
                            charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding: EdgeInsets.all(4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'OpenSans',
                            fontSize: 11),
                      )
                    ],
                    defaultRenderer: charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Material myDailySpend(String title, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                        color: Color(color),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 14.0)),
                SizedBox(height: 10.0),
                Expanded(
                  child: charts.BarChart(
                    _seriesBarData,
                    animate: true,
                    animationDuration: Duration(seconds: 2),
                    domainAxis: new charts.OrdinalAxisSpec(
                        showAxisLine: false,
                        renderSpec: new charts.NoneRenderSpec()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Material myTransaction(String title, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Color(color),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 18.0),
              ),
              Text('McDonald\'s', style: dashboardBalanceActivity),
              Text(
                '- \$18',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 18.0),
              ),
              Text('13 November', style: dashboardAvailableActivity),
            ],
          ),
        ),
      ),
    );
  }

  Material myTotalBalance(String title, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Color(color),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 14.0),
              ),
              Text('\$1500', style: dashboardBalanceActivity),
              Text('\$15000.00 Available', style: dashboardAvailableActivity),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          myHead("Total Spending", 0xffed622b),
          myTotalBalance('Total Balance', 0xffff3266),
          myTransaction('Payments', 0xff622f74),
          myDailySpend('Daily Expenditure', 0xfff4c83f),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 400.0),
          StaggeredTile.extent(1, 100.0),
          StaggeredTile.extent(1, 200.0),
          StaggeredTile.extent(1, 100.0),
        ],
      ),
    );
  }
}

class Spend {
  String spendOn;
  double cost;
  Color colorVal;

  Spend(this.spendOn, this.cost, this.colorVal);
}

class SpendDaily {
  final String day;
  final int amount;
  final charts.Color barColor;

  SpendDaily(this.day, this.amount, this.barColor);
}
