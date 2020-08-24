import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

//  String time = "loading";

  void setupWorldTime() async {
    //Выгружаем Астанинское время
    WorldTime instance = WorldTime(location: "Almaty", flag: "kazakhstan.png", url:"Asia/Almaty");
    await instance.getTime();

  //    print(instance.time);
  //    setState(() {
  //      time = instance.time;
  //    });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime': instance.isDaytime,
  });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
      )
    );
  }
}
