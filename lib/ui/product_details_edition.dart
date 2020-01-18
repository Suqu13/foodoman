import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/bloc/producers_bloc.dart';
import 'package:foodoman/bloc/products_bloc.dart';
import 'package:foodoman/domain/producer.dart';
import 'package:foodoman/domain/product.dart';
import 'package:foodoman/ui/utils.dart';

class ProductDetailsEdition extends StatelessWidget {
  final Product product;

  ProductDetailsEdition({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
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
          child: MyForm(product: product)),
    );
  }
}

class MyForm extends StatefulWidget {
  final Product product;

  MyForm({@required this.product});

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
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
      .map((p) => DropdownMenuItem(value: p, child: Text(p.name)))
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
              padding:
                  EdgeInsets.only(top: 40.0, left: 10, right: 10, bottom: 40.0),
              children: <Widget>[
                CustomTextFiled(labelText: 'Nazwa', controller: nameController),
                CustomTextFiled(
                  labelText: 'Waga [kg]',
                  controller: weightController,
                  numbersOnly: true,
                ),
                CustomTextFiled(
                  labelText: 'Powierzchnia [cm^2]',
                  controller: surfaceController,
                  numbersOnly: true,
                ),
                CustomTextFiled(
                    labelText: 'Wysokość [cm]', controller: heightController),
                CustomTextFiled(
                    labelText: 'Opis produktu',
                    controller: descriptionController),
                CustomDropdownButton(
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
                    icon: FontAwesomeIcons.save)
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

class CustomButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function onPressed;
  final String snackBarMessage;
  final String text;
  final IconData icon;

  CustomButton(
      {@required this.formKey,
      this.onPressed,
      this.snackBarMessage,
      this.text,
      this.icon});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: RaisedButton(
          padding: EdgeInsets.all(8.0),
          color: Colors.white,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          onPressed: () {
            if (formKey.currentState.validate()) {
              onPressed();
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(snackBarMessage)));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text,
                  style: TextStyle(fontSize: 20, color: Colors.grey[700])),
              Icon(icon, color: Colors.grey[700])
            ],
          ),
        ),
      );
}

class CustomDropdownButton<T> extends StatelessWidget {
  final void Function(T) onChanged;
  final String labelText;
  T value;
  final List<DropdownMenuItem<T>> items;

  CustomDropdownButton(
      {@required this.onChanged, this.labelText, this.value, this.items});

  @override
  Widget build(BuildContext context) {
    print(items);
    return Container(
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
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  value: value,
                  onChanged: (value) => onChanged(value),
                  items: items,
                  decoration: InputDecoration(
                    labelText: labelText,
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class CustomTextFiled extends StatelessWidget {
  final String labelText;
  final bool numbersOnly;
  final TextEditingController controller;

  CustomTextFiled(
      {@required this.labelText, this.numbersOnly = false, this.controller});

  isNumeric(String value) => double.tryParse(value) != null;

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
                children: <Widget>[
                  TextFormField(
                      minLines: 1,
                      maxLines: null,
                      inputFormatters: numbersOnly
                          ? [WhitelistingTextInputFormatter.digitsOnly]
                          : null,
                      keyboardType: numbersOnly ? TextInputType.number : null,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Pole nie może pozostać puste';
                        } else if (numbersOnly && !isNumeric(value)) {
                          return 'Proszę wprowadzić wartości liczbowe';
                        }
                        return null;
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: labelText,
                        border: InputBorder.none,
                      )),
                ],
              )),
        ),
      );
}
