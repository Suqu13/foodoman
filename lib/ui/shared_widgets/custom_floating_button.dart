import 'package:flutter/material.dart';

class CustomSecondaryFloatingButton extends StatelessWidget {
  final Function onPressed;
  final String heroTag;
  final String tooltip;
  final IconData icon;

  CustomSecondaryFloatingButton(
      {this.onPressed, this.heroTag, this.tooltip, this.icon, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Container(
        child: FloatingActionButton(
          backgroundColor: Colors.grey[600],
          heroTag: heroTag,
          onPressed: () => onPressed(),
          tooltip: tooltip,
          child: Icon(icon, size: 20.0),
          key: null,
        ),
      );
}

class CustomPrimaryFloatingButton extends StatelessWidget {
  final Function onPressed;
  final Animation animation;
  final AnimatedIconData animatedIcon;

  CustomPrimaryFloatingButton(
      {@required this.onPressed, this.animation, this.animatedIcon, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      FloatingActionButton(
          onPressed: onPressed,
          child: AnimatedIcon(
            icon: animatedIcon,
            progress: animation,
          ));
}



class CustomAnimatedFloatingButton extends StatelessWidget {
  final List<CustomSecondaryFloatingButton> buttons;

  CustomAnimatedFloatingButton({@required this.buttons, key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _CustomAnimatedFloatingButtonStateful(buttons: buttons, key: key,);
}

class _CustomAnimatedFloatingButtonStateful extends StatefulWidget {
  final List<CustomSecondaryFloatingButton> buttons;

  _CustomAnimatedFloatingButtonStateful({@required this.buttons, key}) : super(key: key);

  @override
  _CustomAnimatedFloatingButtonState createState() =>
      _CustomAnimatedFloatingButtonState();
}

class _CustomAnimatedFloatingButtonState extends State<_CustomAnimatedFloatingButtonStateful>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    !isOpened ? _animationController.forward() : _animationController.reverse();
    isOpened = !isOpened;
  }

  List<Widget> createCustomSecondaryFloatingButtonsList(
      List<CustomSecondaryFloatingButton> buttons) {
    return buttons
        .asMap()
        .map((index, button) =>
        MapEntry(
          index,
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value * (index + 1),
              0.0,
            ),
            child: button,
          ),
        ))
        .values
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnWidgets = List.from(
        createCustomSecondaryFloatingButtonsList(widget.buttons))
      ..add(CustomPrimaryFloatingButton(
        onPressed: () => animate(), animatedIcon: AnimatedIcons.menu_close, animation: _animateIcon, key: widget.key,));
    return Column(
        mainAxisAlignment: MainAxisAlignment.end, children: columnWidgets);
  }
}
