import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Gathering Dogs...", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(child: CircularProgressIndicator(strokeWidth: 5, backgroundColor: Colors.brown, valueColor: AlwaysStoppedAnimation<Color>(Colors.white),), width: 70, height: 70,),
            )
          ],
        ),
      ),
    );
  }
}