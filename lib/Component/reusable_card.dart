import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget childWidget;
  final Color color;
  final double padding;

  ReusableCard({@required this.childWidget, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(this.padding ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: this.color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: this.childWidget,
    );
  }
}
