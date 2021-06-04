
import 'package:flutter/material.dart';

import 'animated_container_curs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _contenidors = [];
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _contenidors.add(AnimatedContainerCurs(key: UniqueKey()));
    _contenidors.add(AnimatedContainerCurs(key: UniqueKey()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInBack,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _contenidors,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            //El passem de visible a invisible
            setState(() {
              _visible = !_visible;
            });
            //Esperem una mica
            await Future.delayed(Duration(milliseconds: 600));
            //Fem el canvi d'ordre a la llista i el tornem a fer visible
            //Si no ho fem quedaria invisible
            setState(() {
              _contenidors = _contenidors.reversed.toList();
              _visible = !_visible; 
            });
          },
          child: Text("Reversed"),
        ),
      ],
    );
  }
}
