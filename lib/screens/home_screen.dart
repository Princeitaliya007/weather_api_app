import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/api_helper.dart';
import '../modals/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  TextStyle titlestyle = const TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  TextStyle textStyle = const TextStyle(
    fontSize: 20,
    color: Colors.blueAccent,
  );

  late Future<WeatherModel?> fetchdata;

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchdata = ApiHelper.apiHelper.fetchWeatherData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: FutureBuilder(
        future: fetchdata,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "ERROR => ${snapshot.error}",
                style: textStyle,
              ),
            );
          } else if (snapshot.hasData) {
            WeatherModel? data = snapshot.data as WeatherModel?;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    child: TextField(
                      onSubmitted: (val) {
                        setState(() {
                          ApiHelper.apiHelper.CITY_NAME = val;
                        });

                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.0),
                        ),
                        hintText: ApiHelper.apiHelper.CITY_NAME,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "${data?.name}(${data?.country})",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "Clear Sky",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                              size: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${data?.temperature} °C",
                                  style: textStyle,
                                ),
                                Text(
                                  "Temperature",
                                  style: titlestyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.cloud,
                              color: Colors.white,
                              size: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${data?.weather}",
                                  style: textStyle,
                                ),
                                Text(
                                  "Weather",
                                  style: titlestyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.speed,
                              color: Colors.white,
                              size: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${data?.windspeed}",
                                  style: textStyle,
                                ),
                                Text(
                                  "Wind Speed",
                                  style: titlestyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.cloud_upload,
                              color: Colors.white,
                              size: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${data?.humidity}",
                                  style: textStyle,
                                ),
                                Text(
                                  "Humidity",
                                  style: titlestyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "Additional Information",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.flag,
                              color: Colors.white,
                              size: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${data?.country}",
                                  style: textStyle,
                                ),
                                Text(
                                  "Country",
                                  style: titlestyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.cloud,
                              color: Colors.white,
                              size: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "${data?.pressure}",
                                  style: textStyle,
                                ),
                                Text(
                                  "Pressure",
                                  style: titlestyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
