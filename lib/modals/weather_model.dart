class WeatherModel {
  final String weather;
  final double temperature;
  final int pressure;
  final int humidity;
  final double windspeed;
  final String country;
  final String name;

  WeatherModel({
    required this.weather,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.windspeed,
    required this.country,
    required this.name,
  });

  factory WeatherModel.fromjson(Map<String, dynamic> json) {
    return WeatherModel(
      weather: json['weather'][0]['main'],
      temperature: json['main']['temp'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windspeed: json['wind']['speed'],
      country: json['sys']['country'],
      name: json['name'],
    );
  }
}
