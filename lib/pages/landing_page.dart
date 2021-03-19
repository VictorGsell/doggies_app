import 'dart:async';
import 'package:doggies_app/models/dog_model.dart';
import 'package:doggies_app/providers/dog_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  final String _title = "DOGGIES";

  void load(BuildContext context, DogNotifier dogNotifier) async {
    try {
      await dogNotifier.fetchDogs();
      dogNotifier.disposeProgress();
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("A Network error occurred, retrying in 3s..."),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          )
      ).closed.then((value) => dogNotifier.progress = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DogNotifier>(
      builder: (context, dogNotifier, _) {
        load(context, dogNotifier);
        return Scaffold(
          backgroundColor: Colors.brown,
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/paw_logo.png", width: 200, height: 200, color: Colors.white),
                      Text('$_title', style: Theme.of(context).textTheme.headline1)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Text("Gathering Dogs...",
                          style: Theme.of(context).textTheme.subtitle2),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: SizedBox(
                          child: LinearProgressIndicator(
                            value: dogNotifier.progress,
                            backgroundColor: Colors.black45,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                          width: 250,
                          height: 10,
                        ),
                      ),
                      CircularProgressIndicator(
                        backgroundColor: Colors.brown,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
