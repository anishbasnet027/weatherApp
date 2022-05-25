import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/services/weather_api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
//28.449657356016974, 83.87846436751433
  Future<void> getData() async {
    data =
        await client.getCurrentWeather(28.449657356016974, 83.87846436751433);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 33, 40),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/backheader.png"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          top: 85,
                          left: 110,
                          // bottom: -100,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/logo.png"),
                                    fit: BoxFit.cover)),
                          )),
                      Positioned(
                          top: 90,
                          left: 160,
                          // bottom: -100,
                          child: Container(
                            height: 100,
                            child: Text("Weather App",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20)),
                          )),
                      Positioned(
                        top: 150,
                        left: 60,
                        // bottom: -100,
                        child: Container(
                          height: 40,
                          width: 200,
                          child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 31, 33, 40),
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter a city',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 84, 84, 84),
                                      fontSize: 13))),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 255,
                        // bottom: -100,
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 108, 93, 211),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Center(
                              child: Text(
                            "Add City",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    height: 350,
                    width: 800,
                    //color: Colors.amber,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (() {}),
                                        child: Stack(children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 19, top: 10),
                                            width: 350,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/bluecloud.png")),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8)),
                                            ),
                                          ),
                                          Positioned(
                                            top: 40,
                                            left: 50,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Colombo, LK",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 228, 228, 228),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  "9.19am, feb 8",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 228, 228, 228),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                Text(
                                                  "Few Clouds",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 228, 228, 228),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 18),
                                        child: Container(
                                          height: 120,
                                          width: 350,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 56, 59, 71),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              )),
                                          //color: Color.fromARGB(255, 206, 206, 206),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Pressure: ",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          224,
                                                                          224,
                                                                          224),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "1018hPa",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        224,
                                                                        224,
                                                                        224),
                                                              ),
                                                            ),
                                                          ]),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(children: [
                                                            Text(
                                                              "Humidity: ",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          224,
                                                                          224,
                                                                          224),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "78%        ",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        224,
                                                                        224,
                                                                        224),
                                                              ),
                                                            ),
                                                          ]),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(children: [
                                                            Text(
                                                              "Visibility: ",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          224,
                                                                          224,
                                                                          224),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "8.0Km     ",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        224,
                                                                        224,
                                                                        224),
                                                              ),
                                                            ),
                                                          ])
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 80,
                                                        child: VerticalDivider(
                                                          color: Color.fromARGB(
                                                              255, 85, 85, 85),
                                                          thickness: 1.5,
                                                          indent: 0,
                                                          endIndent: 10,
                                                          width: 0,
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            height: 50,
                                                            width: 40,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/images/airicon.png"))),
                                                          ),
                                                          Text(
                                                            "4.0m/s 120 °",
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      224,
                                                                      224,
                                                                      224),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 80,
                                                        child: VerticalDivider(
                                                          color: Color.fromARGB(
                                                              255, 85, 85, 85),
                                                          thickness: 1.5,
                                                          indent: 0,
                                                          endIndent: 10,
                                                          width: 0,
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(children: [
                                                            Text(
                                                              "Sunrise: ",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          224,
                                                                          224,
                                                                          224),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "6:05am",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        224,
                                                                        224,
                                                                        224),
                                                              ),
                                                            ),
                                                          ]),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(children: [
                                                            Text(
                                                              "Sunset: ",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          224,
                                                                          224,
                                                                          224),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "6:05am ",
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        224,
                                                                        224,
                                                                        224),
                                                              ),
                                                            ),
                                                          ]),
                                                        ],
                                                      )
                                                    ])
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]);
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              child:
              CircularProgressIndicator();
            }
            return Container();
          },
        ));
  }
}
