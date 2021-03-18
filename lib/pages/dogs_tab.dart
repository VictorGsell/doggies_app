import 'package:doggies_app/BLoC/bloc_provider.dart';
import 'package:doggies_app/BLoC/dog_bloc.dart';
import 'package:doggies_app/BLoC/events/refresh_event.dart';
import 'package:doggies_app/models/dog_model.dart';
import 'package:doggies_app/pages/dog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogsTab extends StatefulWidget {
  DogsTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return new DogsTabState();
  }
}

class DogsTabState extends State<DogsTab> {
  DogBloc _bloc;

  @override
  void initState() {
    _bloc =  BlocProvider.of<DogBloc>(context);
    _bloc.refreshEventSink.add(RefreshEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.dogsStream,
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
            return RefreshIndicator(
              onRefresh: _bloc.fetchDogs,
              child: ListView.separated(
                itemCount: (snapshot.data as List<DogModel>).length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  DogModel data = (snapshot.data as List<DogModel>)[index];
                  FadeInImage image = FadeInImage(
                    width: 75,
                    height: 60,
                    fit: BoxFit.fill,
                    placeholder: AssetImage("assets/image_placeholder.jpg"),
                    image: NetworkImage(data.image),
                  );
                  return ListTile(
                    dense: false,
                    title: Text('${data.breed}'),
                    subtitle: Text('${data.subBreed}'),
                    trailing: image,
                    onTap: () => openDetailsModal(data: data, image: image),
                  );
                },
              ),
            );
        });
  }

  void openDetailsModal({DogModel data, FadeInImage image}) {
    Dialog detailsModal = Dialog(
      child: DogCard(data: data, image: image),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
