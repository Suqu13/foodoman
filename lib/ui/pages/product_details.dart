import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/bloc/products_bloc.dart';
import 'package:foodoman/domain/product.dart';
import 'package:foodoman/ui/shared_widgets/custom_backround_container.dart';
import 'package:foodoman/ui/shared_widgets/custom_image.dart';
import 'package:foodoman/ui/pages/product_details_edition.dart';
import 'package:foodoman/ui/pages/product_localization.dart';
import 'package:foodoman/ui/shared_widgets/custom_text_with_description.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../shared_widgets/custom_floating_button.dart';
import 'products_list.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = 'product_details';
  final int id;

  ProductDetails({@required this.id});

  @override
  Widget build(BuildContext context) => ProductDetailsBody(id: id);
}

class ProductDetailsBody extends StatefulWidget {
  final id;

  ProductDetailsBody({@required this.id});

  final buttons = (context, Product product,
          Function(int) afterNavigateToProductDetailsEdition) =>
      [
        CustomFloatingButtonItem(
          onPressed: () => print('priorities'),
          heroTag: 'priorities',
          tooltip: 'priorities',
          icon: FontAwesomeIcons.exclamation,
        ),
        CustomFloatingButtonItem(
          onPressed: () => Alert(
              context: context,
              title: 'Jesteś pewien, że chcesz usunąć produkt?',
              desc: 'Dokonane zmiany nie będą mogły zostać cofnięte!',
              buttons: [
                DialogButton(
                  child: Text(
                    'Tak',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Products())),
                ),
                DialogButton(
                  child: Text('Nie', style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.pop(context),
                )
              ]).show(),
          heroTag: 'remove',
          tooltip: 'remove',
          icon: FontAwesomeIcons.trash,
        ),
        CustomFloatingButtonItem(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsEdition(product: product)));
            afterNavigateToProductDetailsEdition(product.id);
          },
          heroTag: 'edit',
          tooltip: 'edit',
          icon: FontAwesomeIcons.pen,
        ),
        CustomFloatingButtonItem(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductLocalization(id: product.id))),
          heroTag: 'location',
          tooltip: 'location',
          icon: FontAwesomeIcons.mapMarkerAlt,
        ),
      ];

  @override
  State<StatefulWidget> createState() => ProductDetailsBodyState();
}

class ProductDetailsBodyState extends State<ProductDetailsBody> {
  ProductsBloc productsBloc;

  @override
  void initState() {
    productsBloc = ProductsBloc();
    productsBloc.fetchProductById(id: widget.id);
    super.initState();
  }

  @override
  void dispose() {
    productsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: productsBloc.product,
      builder: (BuildContext context, AsyncSnapshot<Product> product) {
        if (product.hasData) {
          return Scaffold(
              floatingActionButton: CustomFloatingButton(widget.buttons(context,
                  product.data, (id) => productsBloc.fetchProductById(id: id))),
              body: CustomBackgroundContainer(
                  child: ProductDetailsBodyContent(product: product.data)));
        } else {
          return CustomBackgroundContainer(child: Center(child: CircularProgressIndicator()));
        }
      });
}

class ProductDetailsBodyContent extends StatelessWidget {
  final Product product;

  ProductDetailsBodyContent({@required this.product});

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.only(top: 30.0, bottom: 80, left: 10, right: 10),
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(product.name,
                  style: TextStyle(color: Colors.grey[500], fontSize: 30)),
            ),
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
                      CustomTextWithDescription(
                          description: 'Sztuki w magazynie',
                          content: product.allPiecesNumber.toString()),
                      CustomTextWithDescription(
                          description: 'Waga [kg]',
                          content: product.weight.toString()),
                      CustomTextWithDescription(
                          description: 'Wysokość [cm]',
                          content: product.height.toString()),
                      CustomTextWithDescription(
                          description: 'Powierzchnia [cm^2]',
                          content: product.surface.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CustomTextWithDescription(
              description: 'Opis produktu',
              content: product.description.toString()),
          DoubleTextWithDoubleDescription(
              upperDescription: 'Nazwa producenta',
              upperContent: product.producer.name,
              lowerDescription: 'Opis producenta',
              lowerContent: product.producer.description)
        ],
      );
}

class DoubleTextWithDoubleDescription extends StatelessWidget {
  final String upperDescription;
  final String upperContent;
  final String lowerDescription;
  final String lowerContent;

  DoubleTextWithDoubleDescription(
      {@required this.upperDescription,
      this.upperContent,
      this.lowerDescription,
      this.lowerContent});

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
                Text(upperDescription,
                    style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                Text(upperContent,
                    style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                Padding(padding: EdgeInsets.all(5)),
                Text(lowerDescription,
                    style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                Text(lowerContent,
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]))
              ],
            ),
          ),
        ),
      );
}
