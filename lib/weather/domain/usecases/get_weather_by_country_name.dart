

import 'package:flutter/material.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';

import '../../data/repository/weather_repository.dart';
import '../entities/weather.dart';
//ال usecase  يعنى مطلوب منى ايه
//ال usecase دى البوابه اللى من خلالها هتعامل مع كلا من  presentation layer وال data layer
//بحيث هاخد مثلا اسم المدينه من الpresentation وهوديها للداتا وبعد كدا هرجع تانى بطريق عكسى علشان اابعت الداتا اللى انا جبتها من الداتا واحطها فى الpresentation






  // هنا انا هاخد ريفرينش من كلاس بتاع الريبوزيترى علشان كلاس الريبوزيترى هوا اللى هيتعامل مع طبقه الداتا وال يوز كيس هيا اللى هتتعامل مع الريبوزيترى  فالبتالى اليوزكيس

  class GetWeatherByCountryName {
  final BaseWeatherRepository repository;

  GetWeatherByCountryName(this.repository);

  Future<Weather?> execute(String cityName) async {
  return await repository.getWeatherByCityName(cityName);
  }





  String getImage() {
    if (weatherModel!.current!.condition!.text == 'Sunny' || weatherModel!.current!.condition!.text == 'Clear' ||  weatherModel!.current!.condition!.text == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (


    weatherModel?.current!.condition!.text == 'Blizzard' ||  weatherModel?.current!.condition!.text == 'Patchy snow possible'  ||  weatherModel?.current!.condition!.text == 'Patchy sleet possible' || weatherModel?.current!.condition!.text == 'Patchy freezing drizzle possible' || weatherModel?.current!.condition!.text == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherModel?.current!.condition!.text == 'Freezing fog' || weatherModel?.current!.condition!.text == 'Fog' ||  weatherModel?.current!.condition!.text == 'Heavy Cloud' || weatherModel?.current!.condition!.text == 'Mist' || weatherModel?.current!.condition!.text == 'Fog' || weatherModel?.current!.condition!.text == 'Heavy rain') {
      return 'assets/images/cloudy.png';
    } else if (weatherModel?.current!.condition!.text == 'Patchy rain possible' ||
        weatherModel?.current!.condition!.text == 'Heavy Rain' ||
        weatherModel?.current!.condition!.text == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherModel?.current!.condition!.text == 'Thundery outbreaks possible' || weatherModel?.current!.condition!.text == 'Moderate or heavy snow with thunder' || weatherModel?.current!.condition!.text == 'Patchy light snow with thunder'|| weatherModel?.current!.condition!.text == 'Moderate or heavy rain with thunder' || weatherModel?.current!.condition!.text == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/cloudy.png';
    }
  }
  MaterialColor getThemeColor() {
    if (weatherModel?.current!.condition!.text == 'Sunny' || weatherModel?.current!.condition!.text == 'Clear' ||  weatherModel?.current!.condition!.text == 'partly cloudy') {
      return Colors.orange;
    } else if (

    weatherModel?.current!.condition!.text == 'Blizzard' ||  weatherModel?.current!.condition!.text == 'Patchy snow possible'  ||  weatherModel?.current!.condition!.text == 'Patchy sleet possible' || weatherModel?.current!.condition!.text == 'Patchy freezing drizzle possible' || weatherModel?.current!.condition!.text == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherModel?.current!.condition!.text == 'Freezing fog' || weatherModel?.current!.condition!.text == 'Fog' ||  weatherModel?.current!.condition!.text == 'Heavy Cloud' || weatherModel?.current!.condition!.text == 'Mist' || weatherModel?.current!.condition!.text == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherModel?.current!.condition!.text == 'Patchy rain possible' ||
        weatherModel?.current!.condition!.text == 'Heavy Rain' ||
        weatherModel?.current!.condition!.text == 'Overcast' ||
        weatherModel?.current!.condition!.text == 'Showers') {
      return Colors.blue;
    } else if (weatherModel?.current!.condition!.text == 'Thundery outbreaks possible' || weatherModel?.current!.condition!.text == 'Moderate or heavy snow with thunder' || weatherModel?.current!.condition!.text == 'Patchy light snow with thunder'|| weatherModel?.current!.condition!.text == 'Moderate or heavy rain with thunder' || weatherModel?.current!.condition!.text == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

  }