//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter/widgets.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:foodoman/bloc/producers_bloc.dart';
//import 'package:foodoman/bloc/products_bloc.dart';
//import 'package:foodoman/domain/producer.dart';
//import 'package:foodoman/domain/product.dart';
//import 'package:foodoman/ui/utils.dart';
//
//class ProductDetailsEdition extends StatelessWidget {
//  final Product product;
//
//  ProductDetailsEdition({@required this.product});
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//          width: double.infinity,
//          height: double.infinity,
//          decoration: BoxDecoration(
//              gradient: LinearGradient(
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter,
//            stops: [0.7, 0.9, 1.0],
//            colors: [
//              Colors.grey[100],
//              Colors.indigo[400],
//              Colors.indigo[600],
//            ],
//          )),
//          child: MyForm(product: product)),
//    );
//  }
//}
//
//class MyForm extends StatefulWidget {
//  final Product product;
//
//  MyForm({@required this.product});
//
//  @override
//  State<StatefulWidget> createState() => MyFormState();
//}
//
//class MyFormState extends State<MyForm> {
//  final _formKey = GlobalKey<FormState>();
//  ProductsBloc _productsBloc;
//  ProducersBloc _producersBloc;
//  TextEditingController nameController;
//  TextEditingController weightController;
//  TextEditingController heightController;
//  TextEditingController surfaceController;
//  TextEditingController descriptionController;
//  TextEditingController producerController;
//
//  @override
//  void initState() {
//    _productsBloc = ProductsBloc();
//    nameController =
//        TextEditingController(text: widget.product.name.toString());
//    weightController =
//        TextEditingController(text: widget.product.weight.toString());
//    heightController =
//        TextEditingController(text: widget.product.height.toString());
//    surfaceController =
//        TextEditingController(text: widget.product.surface.toString());
//    descriptionController =
//        TextEditingController(text: widget.product.description);
//    producerController =
//        TextEditingController(text: widget.product.producer.id.toString());
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    _productsBloc.dispose();
//    _producersBloc.dispose();
//    nameController.dispose();
//    weightController.dispose();
//    heightController.dispose();
//    surfaceController.dispose();
//    descriptionController.dispose();
//    producerController.dispose();
//    super.dispose();
//  }
//
//  editProduct(String id, Producer producer) {
//    _productsBloc.editProductPartially(
//        product: buildProductFromString(
//      id: id,
//      name: nameController.text,
////            na
////            id,
////            name.text, units.text, weight.text,
////            surface.text, height.text, description.text, producer));
//    ));
//  }
//
//  isNumeric(String value) => double.tryParse(value) != null;
//
//  @override
//  Widget build(BuildContext context) => Form(
//        key: _formKey,
//        child: ListView(
//          padding:
//              EdgeInsets.only(top: 40.0, left: 10, right: 10, bottom: 40.0),
//          children: <Widget>[
//            CustomTextFiled(labelText: 'Nazwa', textController: nameController),
//            CustomTextFiled(
//              labelText: 'Waga [kg]',
//              textController: weightController,
//              numbersOnly: true,
//            ),
//            CustomTextFiled(
//              labelText: 'Powierzchnia [cm^2]',
//              textController: surfaceController,
//              numbersOnly: true,
//            ),
//            CustomTextFiled(
//                labelText: 'Wysokość [cm]', textController: heightController),
//            CustomTextFiled(
//                labelText: 'Opis produktu',
//                textController: descriptionController),
//            CustomDropdownButton(
//                labelText: 'Producent',
//                textEditingController: producerController),
//            CustomButton(formKey: _formKey, callback: () => {})
//          ],
//        ),
//      );
//}
//
//class CustomButton extends StatelessWidget {
//  final GlobalKey<FormState> formKey;
//  final Function callback;
//
//  CustomButton({@required this.formKey, this.callback});
//
//  @override
//  Widget build(BuildContext context) => Container(
//        padding: EdgeInsets.all(20),
//        width: double.infinity,
//        child: RaisedButton(
//          padding: EdgeInsets.all(8.0),
//          color: Colors.white,
//          elevation: 10,
//          shape:
//              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//          onPressed: () {
//            if (formKey.currentState.validate()) {
//              callback();
//              Scaffold.of(context)
//                  .showSnackBar(SnackBar(content: Text('Zapisoano zmainy!')));
//            }
//          },
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text('Zapisz',
//                  style: TextStyle(fontSize: 20, color: Colors.grey[700])),
//              Icon(FontAwesomeIcons.save, color: Colors.grey[700])
//            ],
//          ),
//        ),
//      );
//}
//
//class CustomSmallLoadCard extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) => Container(
//        padding: EdgeInsets.all(20),
//        width: double.infinity,
//        child: Card(
//            color: Colors.white,
//            elevation: 10,
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(15.0)),
//            child: Container(
//              padding: EdgeInsets.all(8.0),
//              child: Center(child: CircularProgressIndicator()),
//            )),
//      );
//}
//
//class LoadingCard extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: double.infinity,
//      child: Card(
//        elevation: 10,
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//        child: Padding(
//          padding: EdgeInsets.all(8.0),
//          child: Center(child: CircularProgressIndicator()),
//        ),
//      ),
//    );
//  }
//}
//
//class CustomDropdownButton extends StatefulWidget {
//  final String labelText;
//  final TextEditingController textEditingController;
//
//  CustomDropdownButton({@required this.labelText, this.textEditingController});
//
//  @override
//  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
//}
//
//class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//  ProducersBloc _producersBloc;
//
//  @override
//  void initState() {
//    _producersBloc = ProducersBloc();
//    _producersBloc.fetchAllProducers();
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    _producersBloc.dispose();
//    super.dispose();
//  }
//
//  prepareItems(List<Producer> producers) => Map.fromIterable(producers,
//          key: (producer) => producer.id.toString(),
//          value: (producer) => producer.name)
//      .entries
//      .map(
//        (entry) => DropdownMenuItem(
//            value: entry.key.toString(), child: Text(entry.value)),
//      )
//      .toList();
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: double.infinity,
//      child: Card(
//        elevation: 10,
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//        child: Padding(
//          padding: EdgeInsets.all(8.0),
//          child: StreamBuilder(
//              stream: _producersBloc.producers,
//              builder: (BuildContext context,
//                  AsyncSnapshot<List<Producer>> producers) {
//                if (producers.hasData) {
//                  return Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      DropdownButtonHideUnderline(
//                        child: DropdownButtonFormField(
//                          value: widget.textEditingController.text,
//                          onChanged: (String value) {
//                            setState(() {
//                              widget.textEditingController.text = value;
//                            });
//                          },
//                          items: prepareItems(producers.data),
//                          decoration: InputDecoration(
//                            labelText: widget.labelText,
//                            border: InputBorder.none,
//                          ),
//                        ),
//                      )
//                    ],
//                  );
//                } else {
//                  return Center(child: CircularProgressIndicator());
//                }
//              }),
//        ),
//      ),
//    );
//  }
//}
//
//class AlwaysDisabledFocusNode extends FocusNode {
//  @override
//  bool get hasFocus => false;
//}
//
//class CustomDatePicker extends StatefulWidget {
//  final String labelText;
//  TextEditingController textEditingController;
//
//  CustomDatePicker({@required this.labelText, this.textEditingController});
//
//  @override
//  State createState() => _CustomDatePickerState();
//}
//
//class _CustomDatePickerState extends State<CustomDatePicker> {
//  validate() => widget.textEditingController.text == ''
//      ? 'Pole nie może pozostać puste'
//      : null;
//
//  Future<Null> selectDate(BuildContext context, DateTime initialDate) async {
//    final DateTime picked = await showDatePicker(
//        context: context,
//        initialDate: initialDate,
//        firstDate: DateTime(2000),
//        lastDate: DateTime(2100));
//    setState(() {
//      widget.textEditingController.text = translateDateTimeToString(picked);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) => Container(
//        width: double.infinity,
//        child: Card(
//          elevation: 10,
//          shape:
//              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//          child: Padding(
//              padding: EdgeInsets.all(8.0),
//              child: TextFormField(
//                onTap: () => selectDate(context, DateTime.now()),
//                focusNode: AlwaysDisabledFocusNode(),
//                controller: widget.textEditingController,
//                decoration: InputDecoration(
//                    labelText: widget.labelText,
//                    border: InputBorder.none,
//                    errorText: validate()),
//              )),
//        ),
//      );
//}
//
//class CustomTextFiled extends StatefulWidget {
//  final String labelText;
//  final bool numbersOnly;
//  TextEditingController textController = TextEditingController(text: '11');
//
//  CustomTextFiled(
//      {@required this.labelText,
//      this.textController,
//      this.numbersOnly = false});
//
//  @override
//  _CustomTextFiledState createState() => _CustomTextFiledState();
//}
//
//class _CustomTextFiledState extends State<CustomTextFiled> {
//  isNumeric(String value) => double.tryParse(value) != null;
//
//  @override
//  Widget build(BuildContext context) => Container(
//        width: double.infinity,
//        child: Card(
//          elevation: 10,
//          shape:
//              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//          child: Padding(
//              padding: EdgeInsets.all(8.0),
//              child: Column(
//                children: <Widget>[
//                  TextFormField(
//                      minLines: 1,
//                      maxLines: null,
//                      inputFormatters: widget.numbersOnly
//                          ? [WhitelistingTextInputFormatter.digitsOnly]
//                          : null,
//                      keyboardType:
//                          widget.numbersOnly ? TextInputType.number : null,
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Pole nie może pozostać puste';
//                        } else if (widget.numbersOnly && !isNumeric(value)) {
//                          return 'Proszę wprowadzić wartości liczbowe';
//                        }
//                        return null;
//                      },
//                      controller: widget.textController,
//                      decoration: InputDecoration(
//                        labelText: widget.labelText,
//                        border: InputBorder.none,
//                      )),
//                ],
//              )),
//        ),
//      );
//}
