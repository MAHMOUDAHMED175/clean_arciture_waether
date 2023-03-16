


import 'package:weather/weather/domain/entities/weather.dart';



//صلى على النبي انا هنا كدا خققت مبدا الخامس من مبادء ال solid principles
// dependency inversion principle

//معناه ان لو عندى طبقتين منفصلتين عن بعض زى الdata وال  domain انا هنا كدا عايز حاجه تكون bstract بين الاتنين علشان احقق المبدء واقدر اتواصل بينهم


abstract class BaseWeatherRepository {
  Future<Weather?> getWeatherByCityName(String cityName);
}