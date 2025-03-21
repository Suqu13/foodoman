import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/ui/shared_widgets/custom_backround_container.dart';

import 'products_list.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomBackgroundContainer(child: MainMenuBody()),
      );
}

class MainMenuBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
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
                            TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                        String.fromCharCode(
                            FontAwesomeIcons.warehouse.codePoint),
                        style: TextStyle(
                            color: Colors.white,
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
                    icon: FontAwesomeIcons.boxes,
                    key: Key('products')),
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
      );
}

class MainTile extends StatelessWidget {
  final String text;
  final Function onClick;
  final IconData icon;
  final double elevation;

  MainTile(
      {@required this.text,
      this.onClick,
      this.icon,
      this.elevation = 10.0,
      key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.all(10),
        elevation: elevation,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: InkWell(
          onTap: () => onClick(),
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
                    Text(String.fromCharCode(icon.codePoint),
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 80.0,
                            fontFamily: icon.fontFamily,
                            package: icon.fontPackage)),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        text.toUpperCase(),
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
