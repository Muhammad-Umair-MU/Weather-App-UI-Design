// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            width: 50.0,
            child: Divider(
              color: Colors.black,
              thickness: 5.0,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 25.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Next Forecast',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text('See all',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent.shade100))
                ]),
          ),
          Expanded(
            child: forecasting(
              url: 'https://assets3.lottiefiles.com/temp/lf20_dgjK9i.json',
            ),
          ),
          Expanded(
            child: forecasting(
              url:
                  'https://assets8.lottiefiles.com/packages/lf20_61b51axd.json',
            ),
          ),
          Expanded(
            child: forecasting(
              url:
                  'https://assets3.lottiefiles.com/private_files/lf30_jr9yjlcf.json',
            ),
          ),
        ],
      ),
    );
  }
}

class forecasting extends StatelessWidget {
  const forecasting({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 90.0, maxHeight: 90.0),
            decoration: BoxDecoration(
              color: Color(0xFF16173B),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Lottie.network(url),
          ),
          Container(
            height: 70.0,
            width: 175,
            padding: EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Text(
                  '32',
                  style: TextStyle(
                      color: Color(0xFF35376F),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Monday',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        )),
                    Text('6 October')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
