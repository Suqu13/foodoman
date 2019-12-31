import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/external/products_dictionary.dart';
import 'package:foodoman/ui/custom_image.dart';

import 'floating_button.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = 'product_details';
  final product = exemplaryProduct;
  final buttons = [
    FloatingButtonItem(
      onPressed: () => print('priorities'),
      heroTag: 'priorities',
      tooltip: 'priorities',
      icon: FontAwesomeIcons.exclamation,
      color: Colors.grey[500],
    ),
    FloatingButtonItem(
      onPressed: () => print('remove'),
      heroTag: 'remove',
      tooltip: 'remove',
      icon: FontAwesomeIcons.trash,
      color: Colors.grey[500],
    ),
    FloatingButtonItem(
      onPressed: () => print('edit'),
      heroTag: 'edit',
      tooltip: 'edit',
      icon: FontAwesomeIcons.pen,
      color: Colors.grey[500],
    ),
    FloatingButtonItem(
      onPressed: () => print('location'),
      heroTag: 'location',
      tooltip: 'location',
      icon: FontAwesomeIcons.mapMarkerAlt,
      color: Colors.grey[500],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(buttons),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(product.name.toUpperCase(),
                  style: TextStyle(color: Colors.grey[500], fontSize: 30)),
            ),
            Row(
              children: <Widget>[
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: CustomImage(
                    image: product.imageUrl,
                    width: 150,
                    height: 150,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextWithDescription(
                            description: 'Waga', content: '10kg'),
                        TextWithDescription(
                            description: 'Powierzchnia', content: '10cm^2'),
                        TextWithDescription(
                            description: 'Wysokość', content: '10cm'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            TextWithDescription(
                description: 'Termin przydatności do spożycia',
                content: '10-10-2019'),
            TextWithDescription(
                description: 'Producent', content: 'Producent A'),
          ],
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

class TextWithDescription extends StatelessWidget {
  final String description;
  final String content;

  TextWithDescription({@required this.description, this.content});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(description,
                    style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                Text(content,
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]))
              ],
            ),
          ),
        ),
      );
}
