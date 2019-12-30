import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/external/products_dictionary.dart';

import 'floating_button.dart';

class Products extends StatelessWidget {
  static const routeName = '/products';
  final buttons = [
    FloatingButtonItem(
      onPressed: () => print('search'),
      heroTag: 'search',
      tooltip: 'search',
      icon: FontAwesomeIcons.search,
      color: Colors.grey[500],
    ),
    FloatingButtonItem(
      onPressed: () => print('add'),
      heroTag: 'add',
      tooltip: 'add',
      icon: FontAwesomeIcons.plus,
      color: Colors.grey[500],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(buttons),
//      floatingActionButton: FloatingActionButton(onPressed: () => {}),
      body: Container(
        child: ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (context, i) => MainTile(
                text: productsList[i].name,
                onClick: () => print('Produty'),
                icon: FontAwesomeIcons.boxes)),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.7, 0.9, 1.0],
          colors: [
            Colors.grey[100],
            Colors.indigo[400],
            Colors.indigo[600],
          ],
        )),
      ),
    );
  }
}

class MainTile extends StatefulWidget {
  final String text;
  final Function onClick;
  final IconData icon;

  MainTile({@required this.text, this.onClick, this.icon});

  @override
  State<StatefulWidget> createState() => MainTileState();
}

class MainTileState extends State<MainTile> {
  double _elevation = 1.0;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => setState(() {
          _elevation = 10.0;
        }),
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: _elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInBack,
              alignment: Alignment(0.0, 0.0),
              width: 140,
              height: 190,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(String.fromCharCode(widget.icon.codePoint),
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 80.0,
                            fontFamily: widget.icon.fontFamily,
                            package: widget.icon.fontPackage)),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        widget.text.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );
}
