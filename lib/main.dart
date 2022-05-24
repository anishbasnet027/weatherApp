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
                                      color: Colors.white, fontSize: 14))),
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
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Text("data"),
                  )
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
