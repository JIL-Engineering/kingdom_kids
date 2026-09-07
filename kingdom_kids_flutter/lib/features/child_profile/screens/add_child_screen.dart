import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddChildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RichText(text: TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black),
              children: [
                TextSpan(text: 'Who is reading today?', style: TextStyle(fontSize: 28, fontFamily: GoogleFonts.plusJakartaSans.toString(), fontWeight: FontWeight.bold)),
                TextSpan(text: 'Select your profile to continue the adventure.', style: TextStyle(fontFamily: GoogleFonts.plusJakartaSans.toString(), fontSize: 18,)),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}