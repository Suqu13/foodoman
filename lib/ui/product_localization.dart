import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/bloc/priorities_bloc.dart';
import 'package:foodoman/domain/priority.dart';
import 'package:foodoman/ui/product_details_edition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'floating_button.dart';
import 'products_list.dart';

class ProductLocalization extends StatelessWidget {
  final int id;

  ProductLocalization({@required this.id});

  @override
  Widget build(BuildContext context) => MyForm(id: id);
}

class MyForm extends StatefulWidget {
  final int id;
  final buttons = (context) => [
        FloatingButtonItem(
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
          onPressed: () => print('add'),
          heroTag: 'add',
          tooltip: 'add',
          icon: FontAwesomeIcons.plus,
          color: Colors.grey[500],
        ),
      ];

  MyForm({@required this.id});

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State<MyForm> with TickerProviderStateMixin {
  Priority _priority;
  PrioritiesBloc _prioritiesBloc;
  TextEditingController _priorityController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _prioritiesBloc = PrioritiesBloc();
    _priorityController = TextEditingController();
    _prioritiesBloc.fetchAllPrioritiesByProductId(id: widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _prioritiesBloc.dispose();
    _priorityController.dispose();
    super.dispose();
  }

  prepareItems(List<Priority> priorities) => priorities
      .map(
        (p) => DropdownMenuItem(value: p, child: Text(p.name)),
      )
      .toList();

  @override
  Widget build(BuildContext context) => Container(
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
      child: StreamBuilder(
          stream: _prioritiesBloc.priorities,
          builder:
              (BuildContext context, AsyncSnapshot<List<Priority>> priorities) {
            if (priorities.hasData) {
              return Scaffold(
                  floatingActionButton: FloatingButton(widget.buttons(context)),
                  body: Form(
                    key: _formKey,
                    child: ListView(
                        padding:
                            EdgeInsets.only(top: 40.0, left: 10, right: 10),
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("Wybierz priorytet!",
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 30)),
                            ),
                          ),
                          CustomDropdownButton(
                            labelText: 'Priorytet',
                            value: _priority,
                            items: prepareItems(priorities.data),
                            onChanged: (value) => setState(() {
                              _priority = value;
                            }),
                          ),
                          AnimatedSize(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            vsync: this,
                            child: TextWithDescription(
                              description: 'Opis priorytetu',
                              content: _priority == null
                                  ? 'Nie wybrano priorytetu!'
                                  : _priority.description,
                            ),
                          ),
                          CustomButton(
                            formKey: _formKey,
                            onPressed: () => {},
                            icon: FontAwesomeIcons.mapMarkerAlt,
                            snackBarMessage: "Zlokalizowano!",
                            text: "Lokalizuj",
                          ),
                        ]),
                  ));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }));
}

class TextWithDescription extends StatelessWidget {
  final String description;
  final String content;

  TextWithDescription({@required this.description, this.content});

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
