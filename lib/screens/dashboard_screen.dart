import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:wallet_flutter/screens/dashboard.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<charts.Series<Spend, String>> _seriesPieData;

  _generateData() {
    var spendPieData = [
      new Spend('Shopping', 10, Color(0xff3366cc)),
      new Spend('Rent', 35, Color(0xff990099)),
      new Spend('Food & Grocery', 25, Color(0xff109618)),
      new Spend('Entertainment', 15, Color(0xfffdbe19)),
      new Spend('Donation', 15, Color(0xffff9900)),
    ];

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
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        },
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
              )),
            ],
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
            ],
          ),
        ),
      ),
    );
  }

  Material myWeeklyExpenditure(String title, int color) {
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
        actions: <Widget>[Icon(Icons.settings)],
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          myHead("Total Spending", 0xffed622b),
          myTotalBalance('Total Balance', 0xffff3266),
          myTransaction('Transactions', 0xff26cb3c),
          myWeeklyExpenditure('Weekly Expense', 0xff622f74)
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, MediaQuery.of(context).size.height * 0.5),
          StaggeredTile.extent(1, 200.0),
          StaggeredTile.extent(1, 200.0),
          StaggeredTile.extent(2, 300),
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