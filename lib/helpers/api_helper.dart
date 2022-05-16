import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modals/weather_model.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  // String BASE_URL = "https://api.openweathermap.org/data/2.5/weather?";
  String CITY_NAME = "surat";
  String API_KEY = "11e07f49d288001c55d47fc31c13d252";

  Future<WeatherModel?> fetchWeatherData() async {

    String API = "https://api.openweathermap.org/data/2.5/weather?q=$CITY_NAME&units=metric&appid=$API_KEY";

    http.Response res = await http.get(Uri.parse(API));

    Map<String, dynamic> Data = jsonDecode(res.body);

    WeatherModel weatherModel = WeatherModel.fromjson(Data);

    print(weatherModel);

    return weatherModel;
  }
}

// 11e07f49d288001c55d47fc31c13d252