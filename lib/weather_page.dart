// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/forecast_page.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF16173B),
                  Color(0xFF35376F),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.3, 0.9]),
          ),
          child:
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Peshawar',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Chance of Rain: 60%',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
            ),
            Expanded(child: Image.asset('assets/image2.png')),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  weatherData(
                    label: 'Temp',
                    data: '22 C',
                  ),
                  weatherData(
                    label: 'Wind',
                    data: '5km/h',
                  ),
                  weatherData(
                    label: 'Humidity',
                    data: '22%',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            weatherReport(),
            SizedBox(
              height: 25.0,
            ),
            bottomBar()
          ]),
        ),
      ),
    );
  }
}



class weatherData extends StatelessWidget {
  const weatherData({Key? key, required this.label, required this.data})
      : super(key: key);

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        label,
        style: kTextStyle,
      ),
      Text(
        data,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
      ),
    ]);
  }
}

class weatherReport extends StatelessWidget {
  const weatherReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
      // ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 17.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                  textAlign: TextAlign.left,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('View full report',
                        style: TextStyle(
                          color: Colors.white,
                        )))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  projectCard(
                    url:
                        'https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json',
                    time: '14.00',
                    temp: '22',
                    color: Colors.white,
                    textColor: Color(0xFF35376F),
                  ),
                  projectCard(
                      url:
                          'https://assets5.lottiefiles.com/temp/lf20_XkF78Y.json',
                      time: '14.00',
                      temp: '30',
                      color: Color(0xFF3F4059),
                      textColor: Colors.white),
                  projectCard(
                    url:
                        'https://assets5.lottiefiles.com/temp/lf20_Stdaec.json',
                    time: '14.00',
                    temp: '32',
                    color: Color(0xFF3F4059),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class projectCard extends StatelessWidget {
  const projectCard(
      {Key? key,
      required this.url,
      required this.time,
      required this.temp,
      required this.color,
      required this.textColor})
      : super(key: key);
  final String url;
  final String time;
  final String temp;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.0,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 10.0,
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              Expanded(
                child: Lottie.network(url, height: 82.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(time,
                      style: TextStyle(color: textColor, fontSize: 14.0)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "$temp C",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



class bottomBar extends StatelessWidget {
  const bottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Color(0xFF35376F),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 30.0,
                maxHeight: 450.0,
                minHeight: 300.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            context: context,
            builder: (context) => ForecastPage());
      },
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        width: MediaQuery.of(context).size.width - 30.0,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(
              Icons.explore,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/emoji.png'),
              maxRadius: 16.0,
            )
          ],
        ),
      ),
    );
  }
}



















// class weatherReportContainer extends StatelessWidget {
//   const weatherReportContainer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 5.0, right: 5.0),
//       color: Colors.black,
//       height: 85.0,
//       width: 155.0,
//       child: Row(
//         children: [
//           Lottie.network(
//               'https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json'),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('14.00'),
//               Text('14.00'),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }




          // Container(
          //   padding: EdgeInsets.all(20.0),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Recent Projects',
          //               style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.black,
          //                   fontSize: 20.0),
          //               textAlign: TextAlign.left,
          //             ),
          //             TextButton(
          //                 onPressed: () {launchURL();},
          //                 child: Text(
          //                   'View all',
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       decoration: TextDecoration.underline),
          //                 ))
          //           ],
          //         ),
          //       ),
          //       CarouselSlider(
          //           items: [
          //             projectCard(
          //               projectImageLabel: 'clime',
          //               projectText: 'Clime App',
          //             ),
          //             projectCard(
          //               projectImageLabel: 'flashChat',
          //               projectText: 'Flash Chat App',
          //             ),
          //             projectCard(
          //               projectImageLabel: 'bmi',
          //               projectText: 'BMI Calculator App',
          //             ),
          //           ],
          //           options: CarouselOptions(
          //             height: 150.0,
          //             enableInfiniteScroll: true,
          //             autoPlay: true,
          //             scrollDirection: Axis.horizontal,
          //           )),
          //     ],
          //   ),
          // ),





          // CarouselSlider(
          //     items: [

          //           projectCard(
          //             url:
          //                 'https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json',
          //             time: '14.00',
          //             temp: '32',
          //             color: Colors.white,
          //           ),
          //           projectCard(
          //             url:
          //                 'https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json',
          //             time: '14.00',
          //             temp: '32',
          //             color: Color(0xFF3F4059),
          //           ),

          //     ],
          //     options: CarouselOptions(
          //       height: 90.0,
          //       viewportFraction: 2.0,
          //       enableInfiniteScroll: true,
          //       scrollDirection: Axis.horizontal,
          //     )),




          
// CarouselSlider(
//                     items: [
//                       projectCard(
//                         projectImageLabel: 'clime',
//                         projectText: 'Clime App',
//                       ),
//                       projectCard(
//                         projectImageLabel: 'flashChat',
//                         projectText: 'Flash Chat App',
//                       ),
//                       projectCard(
//                         projectImageLabel: 'bmi',
//                         projectText: 'BMI Calculator App',
//                       ),
//                     ],
//                     options: CarouselOptions(
//                       height: 150.0,
//                       enableInfiniteScroll: true,
//                       autoPlay: true,
//                       scrollDirection: Axis.horizontal,
//                     )),
