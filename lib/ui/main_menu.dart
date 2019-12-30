import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/ui/products.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Foodoman'.toUpperCase(),
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 30)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                          String.fromCharCode(
                              FontAwesomeIcons.warehouse.codePoint),
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 30.0,
                              fontFamily: FontAwesomeIcons.warehouse.fontFamily,
                              package: FontAwesomeIcons.warehouse.fontPackage)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MainTile(
                      text: 'Produkty',
                      onClick: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Products())),
                      icon: FontAwesomeIcons.boxes),
                  MainTile(
                      text: 'Sektory',
                      onClick: () => print('Sektory'),
                      icon: FontAwesomeIcons.pallet),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MainTile(
                      text: 'Producenci',
                      onClick: () => print('Produty'),
                      icon: FontAwesomeIcons.industry),
                  MainTile(
                      text: 'Kategorie',
                      onClick: () => print('Sektory'),
                      icon: FontAwesomeIcons.stream),
                ],
              )
            ],
          ),
        ),
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
  double _elevation = 10.0;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.all(10),
        elevation: _elevation,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: InkWell(
          onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => Products()))},
          splashColor: Colors.indigo[600],
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
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
