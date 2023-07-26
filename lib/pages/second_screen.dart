import 'package:flutter/material.dart';

import '../classes/language_constants.dart';

class SecondScreen extends StatefulWidget {
  var name, email, date, time;
   SecondScreen({super.key, required this.name, required this.email, required this.date, required this.time});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).secondScreen),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${translation(context).name}: ${widget.name}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Text("${translation(context).email}: ${widget.email}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Text("${translation(context).dateOfBirth}: ${widget.date}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Text("${translation(context).time}: ${widget.time}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}
