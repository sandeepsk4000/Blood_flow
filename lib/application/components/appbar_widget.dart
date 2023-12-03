import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  final String text;
  const  CustomAppbar({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
       centerTitle: true,
          title:  Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(text,
            style: GoogleFonts.dancingScript(
              fontSize: 30,
              color: Colors.red,
              fontWeight: FontWeight.w900
            )),
          ),
          elevation: 0,
          backgroundColor: Colors.grey.shade400,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}