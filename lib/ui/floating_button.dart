import 'package:flutter/material.dart';

class FloatingButtonItem{
  final Function onPressed;
  final String heroTag;
  final String tooltip;
  final IconData icon;
  final Color color;

  FloatingButtonItem({
    this.onPressed,
    this.heroTag,
    this.tooltip,
    this.icon,
    this.color
  });
}

class FloatingButton extends StatefulWidget {
  final List<FloatingButtonItem> _floatingButtons;

  FloatingButton(this._floatingButtons);

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
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
    _buttonColor = ColorTween(
      begin: Colors.white,
      end: Colors.white,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
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

  Widget createFloatingButton(FloatingButtonItem button) {
    return Container(
      child: FloatingActionButton(
        backgroundColor: button.color,
        heroTag: button.heroTag,
        onPressed: () => button.onPressed(),
        tooltip: button.tooltip,
        child: Icon(button.icon, size: 20.0),
      ),
    );
  }

  List<Widget> createFloatingButtonsList(List<FloatingButtonItem> buttons) {
    return buttons
        .asMap()
        .map((index, button) => MapEntry(
              index,
              Transform(
                transform: Matrix4.translationValues(
                  0.0,
                  _translateButton.value * (index + 1),
                  0.0,
                ),
                child: createFloatingButton(button),
              ),
            ))
        .values
        .toList()
        .reversed
        .toList();
  }

  Widget mainFloatingButton() {
    return FloatingActionButton(
          onPressed: animate,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animateIcon,
            color: _buttonColor.value,
          )
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnWidgets = List
        .from(createFloatingButtonsList(widget._floatingButtons))
      ..add(mainFloatingButton());
    return Column(
        mainAxisAlignment: MainAxisAlignment.end, children: columnWidgets);
  }
}
