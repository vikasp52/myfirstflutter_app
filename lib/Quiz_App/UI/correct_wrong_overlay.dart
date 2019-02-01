import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {

  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  _CorrectWrongOverlayState createState() => _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _iconAnimationController = new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeInOut);
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: ()=> widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(angle: _iconAnimation.value * 2 * pi,
              child: new Icon(widget._isCorrect == true? Icons.done: Icons.clear, size: _iconAnimation.value * 80.0,),
              )
            ),
            new Text(widget._isCorrect == true ? "Correct!": "Wrong!", style: TextStyle(
              fontSize: 30.0,
              color: Colors.white
            ),),
          ],
        ),
      ),
    );
  }
}
