import 'package:flutter/material.dart';

class AnimateExpanded extends StatefulWidget {
  final String title, description;
  AnimateExpanded(this.title, this.description);
  
  @override
  _AnimateExpandedState createState() => _AnimateExpandedState();
}

class _AnimateExpandedState extends State<AnimateExpanded> {
  
  double _bodyHeight=0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _renderTitle(),
        _renderDetail(),
      ],
    );
  }
  Widget _renderDetail() {
    return Card(
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        height: _bodyHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 20.0),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 42,
              ),
              child: Text(
                this._bodyHeight==250.0 ? widget.description : '',
              ),
            ),
            ],
          ),
        ),
    );
  }
  Widget _renderTitle() {
    return Card(
      child: Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            IconButton(icon: Icon(this._bodyHeight==250.0 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down), onPressed: () {
              setState((){
                if(this._bodyHeight==250.0) {
                  this._bodyHeight=0.0;
                } else {
                  this._bodyHeight=250.0;
                }
              });
            },)
          ],
        ),
      ),
    );
  }
}
