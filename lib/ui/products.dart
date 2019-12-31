import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/external/products_dictionary.dart';
import 'package:foodoman/ui/custom_image.dart';
import 'package:foodoman/ui/product_details.dart';

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
            itemBuilder: (context, i) => ProductTile(product: productsList[i])),
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

class ProductTile extends StatefulWidget {
  final Product product;

  ProductTile({@required this.product});

  @override
  State<StatefulWidget> createState() => ProductTileState();
}

class ProductTileState extends State<ProductTile> {
  double _elevation = 10.0;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: _elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductDetails())),
              splashColor: Colors.indigo[500],
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomImage(
                      image: widget.product.imageUrl,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.product.name.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.product.units} szt.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );
}
