import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/bloc/products_bloc.dart';
import 'package:foodoman/domain/product.dart';
import 'package:foodoman/ui/shared_widgets/custom_backround_container.dart';
import 'package:foodoman/ui/shared_widgets/custom_image.dart';
import 'package:foodoman/ui/pages/product_details.dart';

import '../shared_widgets/custom_floating_button.dart';

class Products extends StatelessWidget {
  static const routeName = '/products';
  final buttons = [
    CustomSecondaryFloatingButton(
      onPressed: () => print('search'),
      heroTag: 'search',
      tooltip: 'search',
      icon: FontAwesomeIcons.search,
    ),
    CustomSecondaryFloatingButton(
      onPressed: () => print('add'),
      heroTag: 'add',
      tooltip: 'add',
      icon: FontAwesomeIcons.plus,
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Produkty")),
        floatingActionButton: CustomAnimatedFloatingButton(buttons: buttons),
        body: CustomBackgroundContainer(child: ProductsTilesList()),
      );
}

class ProductsTilesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductsTilesListState();
}

class ProductsTilesListState extends State<ProductsTilesList> {
  final productsBloc = ProductsBloc();

  @override
  void initState() {
    productsBloc.fetchAllProductsWithoutFields();
    super.initState();
  }

  @override
  void dispose() {
    productsBloc.dispose();
    super.dispose();
  }

  handleOnTap({id}) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetails(id: id)));
    productsBloc.fetchAllProductsWithoutFields();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: productsBloc.products,
      builder: (BuildContext context, AsyncSnapshot<List<Product>> products) {
        if (products.hasData) {
          return ListView.builder(
              itemCount: products.data.length,
              itemBuilder: (context, i) => ProductTile(
                    product: products.data[i],
                    key: Key(i.toString()),
                    onTap: () => handleOnTap(id: products.data[i].id),
                  ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

class ProductTile extends StatelessWidget {
  final Product product;
  final double elevation;
  final Function onTap;

  ProductTile({@required this.product, this.elevation = 10, this.onTap, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: InkWell(
              onTap: () => onTap(),
              splashColor: Colors.indigo[500],
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    CustomImage(
                      image: product.imageUrl,
                      height: 100,
                      width: 100,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.name.toUpperCase(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${product.allPiecesNumber} szt.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );
}
