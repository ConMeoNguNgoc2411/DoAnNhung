import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import '../pages/charts/Bar.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  double heating = 0;
  double fan = 0;

  bool isFanOn = false; // State for Fan switch
  bool isACOn = false; // State for AC switch

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.pop(context);
          //       },
          //       child: const Icon(
          //         Icons.arrow_back_ios,
          //         color: Colors.indigo,
          //       ),
          //     ),
          //     // const RotatedBox(
          //     //   quarterTurns: 135,
          //     //   child: Icon(
          //     //     Icons.bar_chart_rounded,
          //     //     color: Colors.indigo,
          //     //     size: 28,
          //     //   ),
          //     // ),
          //   ],
          // ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Center(
                  child: Text(
                    'ĐIỀU KHIỂN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54,
                    fontSize: 35),
                  ),
                ),
                const SizedBox(height: 15),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     _roundedButton(title: 'HUU', isActive: true),
                //     _roundedButton(title: 'THANG'),
                //   ],
                // ),
                const SizedBox(height: 32),
                // Heating Section
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Icon(Icons.whatshot, color: Colors.red, size: 30),
                            Text(
                              'HEATING',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        value: heating,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: heating.round().toString(),
                        onChanged: (newHeating) {
                          setState(() => heating = newHeating);
                        },

                      ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 24),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text('0\u00B0'),
                      //       Text('15\u00B0'),
                      //       Text('30\u00B0'),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Fan Speed Section
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'FAN SPEED',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Slider(
                        value: fan,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: fan.round().toString(),
                        onChanged: (double newFan) {
                          setState(() {
                            fan = newFan;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Switches and Button Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Fan ON/OFF Switch
                          Row(
                            children: [

                              Switch(
                                value: isFanOn,
                                onChanged: (bool value) {
                                  setState(() {
                                    isFanOn = value;
                                  });
                                },
                                activeColor: Colors.indigo,
                              ),
                              Text(isFanOn ? "ON" : "OFF", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Switch(
                                value: isACOn,
                                onChanged: (bool value) {
                                  setState(() {
                                    isACOn = value;
                                  });
                                },
                                activeColor: Colors.indigo,
                              ),
                              Text(isACOn ? "ON" : "OFF", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Action Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text('Button'),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.indigo,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom rounded button for navigation or actions
  Widget _roundedButton({
    required String title,
    bool isActive = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 32,
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.indigo : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.indigo),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}


