import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/bloc/products_sets_bloc.dart';
import 'package:foodoman/domain/product_set.dart';
import 'package:foodoman/ui/shared_widgets/custom_backround_container.dart';
import 'package:foodoman/ui/shared_widgets/custom_icon_button.dart';

class ProductLocalizationList extends StatelessWidget {
  final int productId;
  final int priorityId;
  final bool localizeAll;

  ProductLocalizationList(
      {@required this.productId, this.priorityId, this.localizeAll});

  @override
  Widget build(BuildContext context) => ProductLocalizationListBody(
      productId: productId,
      priorityId: priorityId,
      localizeAll: localizeAll);
}

class ProductLocalizationListBody extends StatefulWidget {
  final int productId;
  final int priorityId;
  final bool localizeAll;

  ProductLocalizationListBody(
      {@required this.productId, this.priorityId, this.localizeAll});

  @override
  State<StatefulWidget> createState() => ProductLocalizationListBodyState();
}

class ProductLocalizationListBodyState
    extends State<ProductLocalizationListBody> with TickerProviderStateMixin {
  ProductsSetsBloc _productsSetsBloc;

  @override
  void initState() {
    _productsSetsBloc = ProductsSetsBloc();
    widget.localizeAll
        ? _productsSetsBloc.fetchAllProductsSetsByProductId(
            productId: widget.productId)
        : _productsSetsBloc.fetchAllProductsSetsByProductIdAndPriorityId(
            productId: widget.productId, priorityId: widget.priorityId);
    super.initState();
  }

  @override
  void dispose() {
    _productsSetsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: _productsSetsBloc.productsSets,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductSet>> productsSets) {
        if (productsSets.hasData) {
          return Scaffold(
            body: CustomBackgroundContainer(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 40.0, bottom: 40, left: 10, right: 10),
                  itemCount: productsSets.data.length,
                  itemBuilder: (context, i) => LocalizationTile(
                      productSet: productsSets.data[i],
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      vsync: this)),
            ),
          );
        } else {
          return CustomBackgroundContainer(child: Center(child: CircularProgressIndicator()));
        }
      });
}

class LocalizationTile extends StatelessWidget {
  final ProductSet productSet;
  final Duration duration;
  final Curve curve;
  final TickerProvider vsync;
  final double paddingBetweenText = 2;

  LocalizationTile(
      {@required this.productSet, this.duration, this.curve, this.vsync});

  Widget simpleNormalTextWithDescription(
          {String description, String content}) =>
      Container(
        padding: EdgeInsets.all(paddingBetweenText),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(description,
                style: TextStyle(fontSize: 10, color: Colors.grey[700])),
            Text(content,
                style: TextStyle(fontSize: 15, color: Colors.grey[700])),
          ],
        ),
      );

  Widget simpleHighlightedTextWithDescription(
          {String description, String content}) =>
      Container(
        padding: EdgeInsets.all(paddingBetweenText),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(description,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.indigo[400],
                    fontWeight: FontWeight.bold)),
            Text(content,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo[600],
                    fontWeight: FontWeight.bold)),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 80),
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                simpleNormalTextWithDescription(
                    description: "Ilość sztuk w lokalizacji",
                    content: productSet.pieces.toString()),
                simpleNormalTextWithDescription(
                    description: "Data ważności",
                    content:
                        productSet.expiryDate.toIso8601String().split('T')[0]),
                simpleNormalTextWithDescription(
                    description: "Ilość sztuk w lokalizacji",
                    content: productSet.pieces.toString()),
                simpleNormalTextWithDescription(
                    description: "Ilość sztuk w lokalizacji",
                    content: productSet.pieces.toString()),
                simpleHighlightedTextWithDescription(
                    description: "Numer regału",
                    content: productSet.rack.number.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    simpleHighlightedTextWithDescription(
                        description: "Numer sektora",
                        content: productSet.rack.sector.number.toString()),
                    Row(
                      children: <Widget>[
                        CustomIconButton(
                          size: 20.0,
                          color: Colors.indigo[400],
                          splashColor: Colors.grey[200],
                          padding: EdgeInsets.all(10.0),
                          iconData: FontAwesomeIcons.pen,
                          onPressed: () => {},
                        ),
                        CustomIconButton(
                          size: 20.0,
                          color: Colors.indigo[400],
                          splashColor: Colors.grey[200],
                          padding: EdgeInsets.all(10.0),
                          iconData: FontAwesomeIcons.info,
                          onPressed: () => {},
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
