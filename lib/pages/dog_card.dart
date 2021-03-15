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
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(data.image),
                ),
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                              child: Text('Breed:',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(child: Text('${data.breed}', overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: false)),
                          ],
                        ),
                      )),
                  Divider(),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                              child: Text('Sub-breed:',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(child: Text('${data.subBreed}', overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: false)),
                          ],
                        ),
                      ),
                  Divider(),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text('Informations:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Flexible(
                      flex: 8,
                      fit: FlexFit.loose,
                      child: SingleChildScrollView(
                        child: Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                                child: Text('${data.description}'),
                              ),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
