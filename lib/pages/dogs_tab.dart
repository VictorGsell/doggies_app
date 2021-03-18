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
  double _progress;
  bool _showProgress = false;

  @override
  void initState() {
    _bloc = BlocProvider.of<DogBloc>(context);
    _bloc.refreshEventSink.add(RefreshEvent());
    _bloc.progressStream.listen((progress) {
      if (this.mounted) {
        setState(() {
          _progress = progress;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _context = context;
    return StreamBuilder(
        stream: _bloc.dogsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("An error occurred."),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 15.0),
                    child: SizedBox(
                      width: 110,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: _refetch, child: Text("Retry")),
                    ),
                  ),
                  _showProgress
                      ? SizedBox(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.brown),
                              value: _progress),
                          width: 50,
                          height: 50)
                      : SizedBox(width: 50, height: 50)
                ],
              ),
            );
          } else if (!snapshot.hasData) {
            _bloc.refreshEventSink.add(RefreshEvent());
            return Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    value: _progress,
                    strokeWidth: 5,
                  ),
                  width: 70,
                  height: 70,
                ));
          }
          else
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                _showProgress
                    ? Positioned(
                        child: SizedBox(
                            child: CircularProgressIndicator(value: _progress),
                            width: 50,
                            height: 50),
                        top: 39,
                      )
                    : SizedBox(width: 0, height: 0),
                RefreshIndicator(
                  onRefresh: _refetch,
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
                )
              ],
            );
        });
  }

  Future<void> _refetch() async {
    if (this.mounted) {
      setState(() {
        _progress = 0;
        _showProgress = true;
      });
    }
    await _bloc.fetchDogs();
    if (this.mounted) {
      setState(() {
        _showProgress = false;
      });
    }
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
