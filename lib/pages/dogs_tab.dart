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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}