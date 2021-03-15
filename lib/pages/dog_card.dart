import 'package:doggies_app/models/dog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final DogModel data;

  DogCard({this.data});

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    return SizedBox(
      width: deviceData.size.width / 1.2,
      height: deviceData.size.height / 1.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(data.image),
                ),
              )),
          Expanded(
              flex: 1,
              child: Text('${data.subBreed}')
          ),
          Expanded(
              flex: 1,
              child: Text('${data.breed}')
          ),
          Expanded(
              flex: 1,
              child: Text('${data.description}')
          ),
        ],
      ),
    );
  }
}
