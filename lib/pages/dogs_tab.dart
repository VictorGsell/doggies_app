import 'dart:async';

import 'package:doggies_app/models/dog_model.dart';
import 'package:doggies_app/pages/dog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<DogModel> dogs = [
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
  DogModel(
      breed: "Spaniel",
      subBreed: "Sussex",
      image: "https://images.dog.ceo/breeds/spaniel-sussex/n02102480_267.jpg",
      description:
          "A spaniel is a type of gun dog. Spaniels were especially bred to flush game out of denser brush. By the late 17th century spaniels had been specialized into water and land breeds."),
];

class DogsTab extends StatefulWidget {
  DogsTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return new DogsTabState();
  }
}

class DogsTabState extends State<DogsTab> {
  StreamController<List<DogModel>> _controller;

  DogsTabState() {
    _controller = StreamController<List<DogModel>>();
    _controller.sink.add(dogs);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(child: Text("An error occurred."));
          else if (!snapshot.hasData)
            return Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                  strokeWidth: 5,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
                ),
                width: 70,
                height: 70,
            ));
          else
            return ListView.separated(
              itemCount: (snapshot.data as List<DogModel>).length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                DogModel data = (snapshot.data as List<DogModel>)[index];
                return ListTile(
                  dense: false,
                  title: Text('${data.breed}'),
                  subtitle: Text('${data.subBreed}'),
                  trailing: Image.network('${data.image}'),
                  onTap: () => openDetailsModal(data),
                );
              },
            );
        });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void openDetailsModal(DogModel data) {
    Dialog detailsModal = Dialog(
      child: DogCard(data: data),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
    showGeneralDialog(
        context: context,
        barrierLabel: "barrier",
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 300),
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        },
        pageBuilder: (context, _, __) {
          return detailsModal;
        });
  }
}
