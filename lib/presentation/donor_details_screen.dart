import 'package:blood_donation_application/application/components/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenDonorDetails extends StatelessWidget {

  const ScreenDonorDetails(
      {super.key,
      });

  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map;
    return   Scaffold(
      
      backgroundColor: Colors.red,
      appBar:  const  PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppbar(text: 'Donor Details')),
        
         body: Center(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const   SizedBox(height: 70,),
             const  Image(image: AssetImage('assets/blooddonor.png')),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Name      :",
                    style: GoogleFonts.roboto(fontSize: 25,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold),),
              
                    Text(args["name" ], style: GoogleFonts.roboto(fontSize: 25,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            const   SizedBox(height: 20,),
              
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Group 🩸  :",
                    style: GoogleFonts.roboto(fontSize: 25,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold),),
              
                    Text(args["group" ], style: GoogleFonts.roboto(fontSize: 25,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Contact ☎:",
                    style: GoogleFonts.roboto(fontSize: 25,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold),),
                
                    Text(args["phone" ], style: GoogleFonts.roboto(fontSize: 25,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
           ),
         ));
  }
}
