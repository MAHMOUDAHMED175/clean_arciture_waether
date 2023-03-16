import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc/layout/weather_cubit.dart';
import 'package:weather_bloc/layout/weather_state.dart';
import 'package:weather_bloc/screens/searchCity.dart';

class HomeScreen extends StatelessWidget {
  String city_Name;
  HomeScreen({
    required this.city_Name,
});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>WeatherCubit()..getWeatherData(city_Name:city_Name),
      child:BlocConsumer<WeatherCubit,WeatherState>(
    listener: (context,state){
      if (state is WeatherGetDataSuccessfulState){
        print('allah akbar');
      }  else if (state is WeatherGetDataErrorState) {
        print('noooooooooooooooooooooooooooo');
      }
    },
    builder: (context,state) {
      var cubit= WeatherCubit.get(context).weatherModel;
      return Scaffold(

        backgroundColor: HexColor('#592192'),
        appBar: AppBar(
          backgroundColor:HexColor('#36268A'),
          elevation: 80.0,
          title:Text(
              'Weather Today',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width/20
            ),
          ),
          actions: [
            IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchCity()));

            },
                icon:const Icon(Icons.search_outlined)
            ),

            const SizedBox(
              width: 22.0,
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor:Colors.blueGrey[200],
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0)
                      ),
                      child:const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                image:AssetImage(
                          'assets/images/sun.png',
                        ),),
                      ),
                    ),
                    Positioned(
                      top: 19,
                        child: Text('Weather Today',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width/18,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,

                                colors:
                                [
                                  Colors.orange,
                                  Colors.black,
                                ]

                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'ENG.MAHMOUD MOUMEN',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width/21,
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 40.0
                  ),
                  child: Container(
                    height: 2.0,
                    color: Colors.black,
                  ),
                ),


                SizedBox(
                 height: 30.0,
               ),
               Row(
                 children: [
                   SizedBox(
                     width: 10.0,
                   ),
                   Icon(Icons.sunny_snowing),
                   SizedBox(
                     width: 40.0,
                   ),
                   Expanded(child: Text('Know The Weather',
                     style: TextStyle(
                       fontSize: MediaQuery.of(context).size.width/20,
                     ),),),
                 ],
               ),
                SizedBox(
                 height: 30.0,
               ),
               Row(
                 children:  [
                   SizedBox(
                     width: 10.0,
                   ),
                   Icon(Icons.person),
                   SizedBox(
                     width: 40.0,
                   ),
                   Expanded(child: Text('My Profile',
                     style: TextStyle(
                       fontSize: MediaQuery.of(context).size.width/20,
                     ),)),
                 ],
               ),
                SizedBox(
                 height: 30.0,
               ),
               Row(
                 children:  [
                   SizedBox(
                     width: 10.0,
                   ),
                   Icon(Icons.newspaper_rounded),
                   SizedBox(
                     width: 40.0,
                   ),
                   Expanded(child: Text('News About The Weather',
                     style: TextStyle(
                       fontSize: MediaQuery.of(context).size.width/20,
                     ),)),
                 ],
               ),
                SizedBox(
                 height: 30.0,
               ),
               Row(
                 children:  [
                   SizedBox(
                     width: 10.0,
                   ),
                   Icon(Icons.exit_to_app_sharp),
                   SizedBox(
                     width: 40.0,
                   ),
                   Expanded(child: Text('Sign Out',
                     style: TextStyle(
                       fontSize: MediaQuery.of(context).size.width/20,
                     ),)),
                 ],
               ),

                 SizedBox(
                  height: 80.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 40.0
                  ),
                  child: Container(
                    height: 2.0,
                    color: Colors.black,
                  ),
                ),

                Text('who are we',
                style: TextStyle(
                  color: Colors.black,
                fontSize: MediaQuery.of(context).size.width/22,
                ),
                ),
                 Text('AHMED MOHAMED',
                   style: TextStyle(
                     fontSize: MediaQuery.of(context).size.width/20,
                   ),),
                 Text('MOHAMED MOUMEN',
                   style: TextStyle(
                     fontSize: MediaQuery.of(context).size.width/20,
                   ),),
                 SizedBox(
                  height: 20.0,
                ),



              ],
            ),
          ),
        ),
        body: ConditionalBuilder(
          condition:WeatherCubit.get(context).weatherModel !=null,
          builder: (context){
            return  SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(
                          height: 150,
                          width: 2,
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(
                        width: 80.0,
                      ),
                      Text('TODAY',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/12,
                        ),),
                      SizedBox(
                        width: 80.0,
                      ),
                      Container(
                        alignment: Alignment(0,-0.4),
                        child: Container(
                          height: 150,
                          width: 2,
                          color: Colors.white,

                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors:
                              [
                                Colors.deepPurple,
                                Colors.deepOrangeAccent,
                              ]

                          ),
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text('   ${cubit?.location!.name}         ${cubit?.location!.country}',
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width/15,
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40.0,
                                  right: 40.0
                              ),
                              child: Container(
                                height: 1.0,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [

                                Container(
                                    height: 100.0,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                    child: Image(

                                        image:cubit?.forecast!.forecastday![0].day!.condition!.icon !=null
                                              ? NetworkImage(
                                              'http:${cubit?.forecast!.forecastday![0].day!.condition!.icon}')
                                              :AssetImage("${WeatherCubit.get(context).getImage()}") as ImageProvider,
                                    ),
                                ),
                                SizedBox(
                                  width: 60.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${DateFormat('EEEE').format(cubit!.forecast!.forecastday![0].date!)}',

                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width/14,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('${cubit?.forecast!.forecastday![0].day!.maxtempC!.ceil()}',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width/8,
                                            ),
                                          ),
                                          Text('/${cubit?.forecast!.forecastday![0].day!.mintempC!.floor()}',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context).size.width/12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text('${cubit?.current!.condition!.text}',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width/14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    'Weather Forecast For Days',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/18,
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: WeatherCubit.get(context).getThemeColor(),

                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      height: 300,
                      width: double.infinity,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children:[ Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text("DATE"),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Container(
                                    height:6.0,
                                    color: Colors.white,

                                  ),
                                  Text(
                                     "${DateFormat('EEEE').format(cubit?.forecast!.forecastday![0].date as DateTime)}",
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Text(
                                    "${DateFormat('EEEE').format(cubit?.forecast!.forecastday![1].date as DateTime)}",
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Text(
                                    "${DateFormat('EEEE').format(cubit?.forecast!.forecastday![2].date as DateTime)}",
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Container(
                              height: 230,
                              width: 2,
                              color: Colors.white,

                            ),

                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text('IMAGE'),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Container(
                                    height:6.0,
                                    color: Colors.white,

                                  ),
                                  CircleAvatar(
                                    child:Image(image:cubit.forecast!.forecastday![0].day!.condition!.icon !=null
                                      ? NetworkImage(
                                      'http:${cubit.forecast!.forecastday![0].day!.condition!.icon}')
                                    :AssetImage("${WeatherCubit.get(context).getImage()}") as ImageProvider,),),
                                SizedBox(
                                    height: 35.0,
                                  ),
                                  CircleAvatar(
                                    child:Image(image:cubit.forecast!.forecastday![1].day!.condition!.icon !=null
                                        ? NetworkImage(
                                        'http:${cubit.forecast!.forecastday![0].day!.condition!.icon}')
                                        :AssetImage("${WeatherCubit.get(context).getImage()}") as ImageProvider,),),
                                SizedBox(
                                    height: 35.0,
                                  ),
                                  CircleAvatar(
                                    child:Image(image:cubit.forecast!.forecastday![2].day!.condition!.icon !=null
                                        ? NetworkImage(
                                        'http:${cubit.forecast!.forecastday![0].day!.condition!.icon}')
                                        :AssetImage("${WeatherCubit.get(context).getImage()}") as ImageProvider,),),

                                ],
                              ),
                            ),
                            Container(
                              height: 230,
                              width: 2,
                              color: Colors.white,

                            ),


                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text('MAX'),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Container(
                                    height:6.0,
                                    color: Colors.white,

                                  ),
                                  Text('${cubit?.forecast!.forecastday![0].day!.maxtempC!.ceil()}',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Text('${cubit?.forecast!.forecastday![1].day!.maxtempC!.ceil()}',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Text('${cubit?.forecast!.forecastday![2].day!.maxtempC!.ceil()}',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),),

                                ],
                              ),
                            ),
                            Container(
                              height: 230,
                              width: 2,
                              color: Colors.white,

                            ),



                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text('MIN'),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Container(
                                    height:6.0,
                                    color: Colors.white,

                                  ),
                                  Text('${cubit?.forecast!.forecastday![0].day!.mintempC!.ceil()}',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Text('${cubit?.forecast!.forecastday![1].day!.mintempC!.ceil()}',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),),
                                  SizedBox(
                                    height: 35.0,
                                  ),
                                  Text('${cubit?.forecast!.forecastday![2].day!.mintempC!.ceil()}',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width/12,
                                    ),),

                                ],
                              ),
                            ),
                          ],
                        ),]
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Container(
                          height: 150,
                          width: 2,
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                      ),
                      Container(
                        alignment: Alignment(0,-0.4),
                        child: Container(
                          height: 150,
                          width: 2,
                          color: Colors.white,

                        ),
                      ),

                    ],
                  ),
                ],
              ),
            );
          },
          fallback: (BuildContext context)=>Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Container(
                      height: 250,
                      width: 2,
                      color: Colors.white,

                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),

                  Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height/4,
                          width:200,
                          child: Padding(
                            padding:  EdgeInsets.all(10.0),
                            child: AnalogClock(),
                          )),

                      Text('NOT FOUND',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/12,
                        ),),
                    ],
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Container(
                    height: 250,
                    width: 2,
                    color: Colors.white,

                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(

                  bottom: 20.0,
                  left: 20.0,
                  right: 20.0
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,

                          colors:
                          [
                            Colors.deepPurpleAccent,
                            Colors.white54,
                          ]

                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child:Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'You did not tell us about the name of the city  😔  Search by the name of the city ',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/17,
                        
                      ),
                    ),
                  ),

                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchCity()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  foregroundColor: Colors.amber,
                  backgroundColor: Colors.black,
                  elevation: 25,  // Elevation
                  shadowColor: Colors.white, // Shadow Color
                ),
                child:   Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width/17,

                    ),

                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchCity()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  foregroundColor: Colors.greenAccent,
                  backgroundColor: Colors.black,
                  elevation: 13,  // Elevation
                  shadowColor: Colors.white, // Shadow Color
                ),
                child:  const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '🔍',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),



            ],
          ),
        ),
      );
    }
      ),
    );
  }
}
