import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomChildReusableCard extends StatelessWidget {
  final String label;
  BottomChildReusableCard({@required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.getFont(
            'Architects Daughter',
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
