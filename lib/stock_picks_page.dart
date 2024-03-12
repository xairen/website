import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'navigation_drawer.dart'; // Ensure this path is correct for your project

class StockPicksPage extends StatefulWidget {
  @override
  _StockPicksPageState createState() => _StockPicksPageState();
}

class _StockPicksPageState extends State<StockPicksPage> {
  String? selectedSymbol;
  bool isChartVisible = false;

  Future<List<FlSpot>> fetchStockData(String symbol) async {
    const String apiKey = '5T6SATLY9GEM1CE7';
    final Uri url = Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$symbol&apikey=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final Map<String, dynamic> timeSeries = json['Time Series (Daily)'];
      List<FlSpot> spots = [];
      int index = 0;
      timeSeries.forEach((date, data) {
        final double closePrice = double.parse(data['4. close']);
        spots.add(FlSpot(index.toDouble(), closePrice));
        index++;
      });
      return spots.reversed.toList(); // Reverse to ensure chronological order
    } else {
      throw Exception('Failed to load stock data');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> stocks = [
      {'symbol': 'AAPL', 'name': 'Apple Inc.'},
      {'symbol': 'GOOGL', 'name': 'Google Inc.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Picks'),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...stocks.map((stock) => ListTile(
                  title: Text(stock['name']!),
                  onTap: () {
                    setState(() {
                      selectedSymbol = stock['symbol'];
                      isChartVisible = selectedSymbol == stock['symbol']
                          ? !isChartVisible
                          : true;
                    });
                  },
                )),
            if (isChartVisible && selectedSymbol != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${stocks.firstWhere((s) => s['symbol'] == selectedSymbol)['name']} Stock Chart',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 250, // Control the chart size
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<List<FlSpot>>(
                        future: fetchStockData(selectedSymbol!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            return LineChart(
                              LineChartData(
                                gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize:
                                        22, // Adjust as needed for label spacing
                                    getTitles: (value) {
                                      // Define how X-axis labels should appear
                                      return value % 5 == 0
                                          ? value.toInt().toString()
                                          : '';
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    getTitles: (value) {
                                      // Define how Y-axis labels should appear
                                      return '\$${value.toInt()}';
                                    },
                                    reservedSize:
                                        28, // Adjust as needed for label spacing
                                  ),
                                  topTitles: SideTitles(
                                      showTitles:
                                          false), // Disable top axis labels
                                  rightTitles: SideTitles(
                                      showTitles:
                                          false), // Disable right axis labels
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border(
                                    bottom:
                                        BorderSide(), // Show bottom border line
                                    left: BorderSide(), // Show left border line
                                    right: BorderSide
                                        .none, // Hide right border line
                                    top:
                                        BorderSide.none, // Hide top border line
                                  ),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: snapshot.data!,
                                    isCurved: true,
                                    colors: [Colors.blue],
                                    barWidth: 3,
                                    isStrokeCapRound: true,
                                    dotData: FlDotData(show: false),
                                    belowBarData: BarAreaData(show: false),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'This chart represents the daily closing prices.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
