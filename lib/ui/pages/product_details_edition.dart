import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/bloc/producers_bloc.dart';
import 'package:foodoman/bloc/products_bloc.dart';
import 'package:foodoman/domain/producer.dart';
import 'package:foodoman/domain/product.dart';
import 'package:foodoman/ui/shared_widgets/custom_backround_container.dart';
import 'package:foodoman/ui/shared_widgets/custom_button.dart';
import 'package:foodoman/ui/shared_widgets/custom_text_field_form_field.dart';

import '../shared_widgets/custom_dropdown_button.dart';

class ProductDetailsEdition extends StatelessWidget {
  final Product product;

  ProductDetailsEdition({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edytuj")),
      body: CustomBackgroundContainer(
          child: ProductDetailsEditionBody(product: product)),
    );
  }
}

class ProductDetailsEditionBody extends StatefulWidget {
  final Product product;

  ProductDetailsEditionBody({@required this.product});

  @override
  State<StatefulWidget> createState() => ProductDetailsEditionBodyState();
}

class ProductDetailsEditionBodyState extends State<ProductDetailsEditionBody> {
  final _formKey = GlobalKey<FormState>();
  ProductsBloc _productsBloc;
  ProducersBloc _producersBloc;
  TextEditingController nameController;
  TextEditingController weightController;
  TextEditingController heightController;
  TextEditingController surfaceController;
  TextEditingController descriptionController;
  Producer producer;

  @override
  void initState() {
    _productsBloc = ProductsBloc();
    _producersBloc = ProducersBloc();
    _producersBloc.fetchAllProducers();
    nameController =
        TextEditingController(text: widget.product.name.toString());
    weightController =
        TextEditingController(text: widget.product.weight.toString());
    heightController =
        TextEditingController(text: widget.product.height.toString());
    surfaceController =
        TextEditingController(text: widget.product.surface.toString());
    descriptionController =
        TextEditingController(text: widget.product.description);
    producer = widget.product.producer;
    super.initState();
  }

  @override
  void dispose() {
    _productsBloc.dispose();
    _producersBloc.dispose();
    nameController.dispose();
    weightController.dispose();
    heightController.dispose();
    surfaceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  prepareItems(List<Producer> producers) => producers
      .map((p) => DropdownMenuItem(
          value: p, child: Text(p.name, key: Key(p.id.toString()))))
      .toList();

  editProduct() {
    Product editedProduct = Product(
        id: widget.product.id,
        name: nameController.text,
        weight: double.parse(weightController.text),
        height: double.parse(heightController.text),
        surface: double.parse(surfaceController.text),
        description: descriptionController.text,
        producer: producer,
        allPiecesNumber: widget.product.allPiecesNumber,
        imageUrl: widget.product.imageUrl);
    _productsBloc.editProductPartially(product: editedProduct);
  }

  isNumeric(String value) => double.tryParse(value) != null;

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: _producersBloc.producers,
      builder: (BuildContext context, AsyncSnapshot<List<Producer>> producers) {
        if (producers.hasData) {
          return Form(
            key: _formKey,
            child: ListView(
              key: Key('customTextFieldsFormList'),
              padding:
                  EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 10.0),
              children: <Widget>[
                CustomTextFieldForm(
                    labelText: 'Nazwa',
                    controller: nameController,
                    key: Key('nameCustomFieldForm')),
                CustomTextFieldForm(
                  labelText: 'Waga [kg]',
                  controller: weightController,
                  numbersOnly: true,
                ),
                CustomTextFieldForm(
                  labelText: 'Powierzchnia [cm^2]',
                  controller: surfaceController,
                  numbersOnly: true,
                ),
                CustomTextFieldForm(
                    labelText: 'Wysokość [cm]',
                    controller: heightController,
                    numbersOnly: true),
                CustomTextFieldForm(
                    labelText: 'Opis produktu',
                    controller: descriptionController),
                CustomDropdownButton(
                    key: Key('producerCustomDropdownButton'),
                    items: prepareItems(producers.data),
                    onChanged: (value) => setState(() {
                          producer = value;
                        }),
                    labelText: 'Producent',
                    value: producer),
                CustomButton(
                  formKey: _formKey,
                  onPressed: () => editProduct(),
                  snackBarMessage: "Zapisano zmiany!",
                  text: "Zapisz",
                  icon: FontAwesomeIcons.save,
                  key: Key('saveCustomButton'),
                )
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}
