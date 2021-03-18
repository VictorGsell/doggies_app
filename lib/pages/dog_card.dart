import 'package:doggies_app/models/dog_model.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final DogModel data;
  final FadeInImage image;

  DogCard({this.data, this.image});
  
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var cardDefaultWidth = deviceData.size.width / 1.2;
    var cardDefaultHeight = deviceData.size.height / 1.4;
    //var cardWidth = cardDefaultWidth > image.width.toInt() ? image.width.toInt() : cardDefaultWidth;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        color: Colors.grey.shade100,
        child: SizedBox(
          width: cardDefaultWidth,
          height: cardDefaultHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: FittedBox(
                    child: image
                  ),
                )
              ),
              Expanded(
                child: Column(
                  children: [
                    Divider(thickness: 2, indent: 10, endIndent: 10, color: Colors.black45),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0, right: 8.0),
                                child: Text('Breed:', style: Theme.of(context).textTheme.bodyText1),
                              ),
                              Expanded(child: Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: Text('${data.breed}', style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: false),
                              )),
                            ],
                          ),
                        ),
                    Divider(thickness: 2, indent: 30, endIndent: 30),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, right: 8.0),
                            child: Text('Sub-breed:',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Text('${data.subBreed}', style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: false),
                          )),
                        ],
                      ),
                    ),
                    Divider(thickness: 2, indent: 10, endIndent: 10, color: Colors.black45),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text('Informations:', style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Flexible(
                        flex: 8,
                        fit: FlexFit.loose,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
                            child: Text('${data.description}', style: Theme.of(context).textTheme.bodyText2),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
Widget old = Column(
  mainAxisAlignment: MainAxisAlignment.start,
  mainAxisSize: MainAxisSize.max,
  children: [
    Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)),
        child: Image.network(data.image, fit: BoxFit.cover),
      ),
    ),
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
);

*/