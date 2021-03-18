import 'package:doggies_app/BLoC/bloc_provider.dart';
import 'package:doggies_app/BLoC/dog_bloc.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  DogBloc _bloc;
  double _progress = 0;
  String _title = "DOGGIES";

  @override
  void initState() {
    _bloc = BlocProvider.of<DogBloc>(context);
    _loadApp();
    super.initState();
  }

  void _loadApp() {
    _bloc.dogsStream.listen(
        (_) => Navigator.of(context).pushNamedAndRemoveUntil(
            "/home", (route) => false), onError: (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("A Network error occurred, retrying in 5s..."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      Future.delayed(Duration(seconds: 5), () => _bloc.fetchDogs());
    });
    _bloc.progressStream.listen((progress) {
      setState(() {
        _progress = progress;
      });
    });
    _bloc.fetchDogs();
  }

  @override
  Widget build(BuildContext context) {
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
                        value: _progress,
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
  }
}
