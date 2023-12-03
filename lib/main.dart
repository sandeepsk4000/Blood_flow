import 'package:blood_donation_application/presentation/register_form.dart';
import 'package:blood_donation_application/presentation/screen_home.dart';
import 'package:blood_donation_application/presentation/update.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'presentation/donor_details_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "screenHome":(context) => const ScreenHome(),
        "registerForm":(context) => const RegisterForm(),
        "updateForm":(context) => const UpdateDonor(),
        "donorDetails":(context) => const ScreenDonorDetails() 
      },
      initialRoute: 'screenHome',
      
    );
  }
}