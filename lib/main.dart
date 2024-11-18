// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:navigation_bar_arduino/pages/NavigationDrawerWidget.dart';
import 'pages/temperature.dart';
import './pages/charts/Bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Smart Home App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _intpage = 0; // Track the selected page index

  // Create a GlobalKey for the CurvedNavigationBar
  GlobalKey<CurvedNavigationBarState> _curvednavigationkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade50,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Center(
            child: Text('ĐOM ĐÓM',textAlign: TextAlign.center,style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
               shadows: [
                BoxShadow(
                color: Colors.black38,// đổ bóng
                offset:Offset(3, 10),
                blurRadius: 6// đổ bóng
            )
                ]
            ),),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: _getBodyContent(_intpage),
        bottomNavigationBar: CurvedNavigationBar(
          key: _curvednavigationkey,
          index: _intpage, // Set the current selected index
          height: 65.0,
          items: const [
            Icon(Icons.home, size: 33, color: Colors.blue),

            Icon(Icons.add_chart_sharp, size: 33, color: Colors.blue),

            Icon(Icons.list, size: 33, color: Colors.blue),

            Icon(Icons.label, size: 33, color: Colors.blue),
            // Icon(Icons.account_balance,size: 33,Colors.blue),
            Icon(Icons.account_balance, size: 33, color: Colors.blue),

          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.indigo.shade50,
          animationCurve: Curves.bounceInOut,
          animationDuration: const Duration(microseconds: 600),
          onTap: (index) {
            setState(() {
              _intpage = index; // Update the selected index
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }

  Widget _getBodyContent(int pageIndex) {
    switch (pageIndex) {
       case 0:
        return _homeContent() ;
      case 1:
         return _BarContent();
      case 2:
        return _listContent();
      case 3:
        return _BarContent();
      case 4:
        return _AccountContent();
      default:
        return _homeContent();
    }
  }

  // Home Page content
  Widget _homeContent() {
    return Container(
      margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   'Hi Hữu Thắng',
              //   style: TextStyle(
              //     fontSize: 18,
              //     color: Colors.indigo,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // RotatedBox(
              //   quarterTurns: 135,
              //   child: Icon(
              //     Icons.bar_chart_rounded,
              //     color: Colors.indigo,
              //     size: 28,
              //   ),
              // ),
            ],
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 32),
                Center(
                  child: Image.asset(
                    'assets/images/banner.png',
                    scale: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Smart Home',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Định Hình Phương Hướng ',
                    style: TextStyle(
                      fontSize: 22,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // You can add your _cardMenu widgets here
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listContent() {
    return TemperaturePage();

  }

  // Dummy content for the third tab
  Widget _labelContent() {
    return const Center(
      child: Icon(Icons.label, size: 33, color: Colors.red),
    );
  }
}
Widget _BarContent() {
  return BarChartExample();
}

Widget _AccountContent() {
  return const Center(
    child: Icon(Icons.label, size: 33, color: Colors.red),
  );
}
