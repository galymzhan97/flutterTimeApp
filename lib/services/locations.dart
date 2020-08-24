import "package:http/http.dart";
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String flag;
  String url; //location url for API endpoint
  bool isDaytime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      //отправляем запрос
      Response res = await get("http://worldtimeapi.org/api/timezone/$url");
      //turning JSON data into a Map
      Map data = jsonDecode(res.body);

      //получаем данные
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      //print(datetime);
      //print(offset);

      //Парсим и конвертируем данные в объект
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);


      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print("Caught API error: $e");
      time = "Could not get correct time";
    }
  }

}