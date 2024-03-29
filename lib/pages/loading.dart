import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime example = WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png');
    await example.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': example.location,
      'flag': example.flag,
      'time': example.time,
      'isDaytime': example.isDaytime,
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
        child: SpinKitCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
