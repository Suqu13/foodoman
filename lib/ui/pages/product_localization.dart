import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodoman/bloc/priorities_bloc.dart';
import 'package:foodoman/domain/priority.dart';
import 'package:foodoman/ui/pages/product_localization_list.dart';
import 'package:foodoman/ui/shared_widgets/custom_backround_container.dart';
import 'package:foodoman/ui/shared_widgets/custom_dropdown_button.dart';
import 'package:foodoman/ui/shared_widgets/custom_switch_with_description.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../shared_widgets/custom_animated_text_with_description.dart';
import '../shared_widgets/custom_button.dart';
import '../shared_widgets/custom_floating_button.dart';
import 'products_list.dart';

class ProductLocalization extends StatelessWidget {
  final int id;

  ProductLocalization({@required this.id});

  @override
  Widget build(BuildContext context) => ProductLocalizationBody(id: id);
}

class ProductLocalizationBody extends StatefulWidget {
  final int id;
  final buttons = (context) => [
        CustomSecondaryFloatingButton(
          onPressed: () => Alert(
              context: context,
              title: 'Jesteś pewien, że chcesz usunąć priorytet?',
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
        CustomSecondaryFloatingButton(
          onPressed: () => print('edit'),
          heroTag: 'edit',
          tooltip: 'edit',
          icon: FontAwesomeIcons.pen,
        ),
        CustomSecondaryFloatingButton(
          onPressed: () => print('add'),
          heroTag: 'add',
          tooltip: 'add',
          icon: FontAwesomeIcons.plus,
        ),
      ];

  ProductLocalizationBody({@required this.id});

  @override
  State<StatefulWidget> createState() => ProductLocalizationBodyState();
}

class ProductLocalizationBodyState extends State<ProductLocalizationBody>
    with TickerProviderStateMixin {
  bool localizeAll;
  Priority _priority;
  PrioritiesBloc _prioritiesBloc;
  TextEditingController _priorityController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    localizeAll = false;
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

  handleOnPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductLocalizationList(
                productId: widget.id,
                priorityId: _priority?.id,
                localizeAll: localizeAll)));
  }

  handleOmSwitchChanged(bool value) {
    setState(() {
      localizeAll = value;
    });
  }

  String getPriorityDescriptionContent() {
    if (_priority == null && !localizeAll) return 'Nie wybrano priorytetu!';
    if (_priority == null || localizeAll) return '';
    return _priority.description;
  }

  String getSnackBarContent() {
    if (_priority == null && !localizeAll)
      return 'Lokalizacja jest niemożliwa!';
    return 'Zlokalizowano';
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: _prioritiesBloc.priorities,
      builder:
          (BuildContext context, AsyncSnapshot<List<Priority>> priorities) {
        if (priorities.hasData) {
          return Scaffold(
            appBar: AppBar(title: Text("Lokalizuj")),
              floatingActionButton:
                  CustomAnimatedFloatingButton(buttons: widget.buttons(context)),
              body: CustomBackgroundContainer(
                child: Form(
                  key: _formKey,
                  child: ListView(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 80.0, left: 10, right: 10),
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Wybierz priorytet",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30)),
                          ),
                        ),
                        CustomDropdownButton(
                          labelText: 'Priorytet',
                          value: _priority,
                          items: localizeAll
                              ? null
                              : prepareItems(priorities.data),
                          onChanged: (value) => setState(() {
                            _priority = value;
                          }),
                        ),
                        CustomAnimatedTextWithDescription(
                          description: 'Opis priorytetu',
                          content: getPriorityDescriptionContent(),
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 300),
                          vsync: this,
                        ),
                        CustomSwitchWitchDescription(
                            value: localizeAll,
                            fontSize: 15,
                            fontColor: Colors.grey[700],
                            description: "Lokalizuj wszystko",
                            handleOnChange: handleOmSwitchChanged),
                        CustomButton(
                          formKey: _formKey,
                          onPressed: () => handleOnPressed(),
                          icon: FontAwesomeIcons.mapMarkerAlt,
                          snackBarMessage: getSnackBarContent(),
                          text: "Lokalizuj",
                        ),
                      ]),
                ),
              ));
        } else {
          return CustomBackgroundContainer(
              child: Center(child: CircularProgressIndicator()));
        }
      });
}
