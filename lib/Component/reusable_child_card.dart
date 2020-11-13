import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableChildCard extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  final double margin;
  final double padding;
  ReusableChildCard({@required this.label, @required this.fontSize, @required this.fontWeight, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: this.margin ?? 0),
      padding: EdgeInsets.only(left: this.margin ?? 0),
      child: Center(
        child: Text(
          this.label,
          style: GoogleFonts.getFont(
            'Architects Daughter',
            textStyle: TextStyle(fontSize: this.fontSize, fontWeight: this.fontWeight),
          ),
        ),
      ),
    );
  }
}
