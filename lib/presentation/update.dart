import 'package:blood_donation_application/application/components/appbar_widget.dart';
import 'package:blood_donation_application/application/core/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UpdateDonor extends StatefulWidget {
 // final Map<String,dynamic> docs;
  
  const UpdateDonor({super.key});

  @override
  State<UpdateDonor> createState() => _UpdateDonorState();

}


class _UpdateDonorState extends State<UpdateDonor> {
    String? selectedGroup;
  final List<String> bloodGroups = [
    'A',
    'A+',
    'B+',
    'B-',
    'O+',
    "O-",
    'AB+',
    'AB-'
  ];
  final TextEditingController nameTextEditingController=TextEditingController();
final TextEditingController phoneTextEditingController=TextEditingController();
  
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
      
  void updateUser(docId){
    final data={
      'name':nameTextEditingController.text,
      'phone':phoneTextEditingController.text,
      'group':selectedGroup
    };
    donor.doc(docId).update(data);
    

  }
      
        

  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map;
    nameTextEditingController.text=args['name'].toString();
    phoneTextEditingController.text=args['phone'].toString();
    selectedGroup=args['group'].toString();
    final docId=args['id'].toString();
    
    
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppbar(text: "Update Donor ")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  'assets/register.webp',
                  height: 200,
                ),
              ),
              KHight30,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: MyTextForm(hint: "Name",controller: nameTextEditingController),
              ),
              KHight10,
               Padding(
                padding:const EdgeInsets.only(left: 20, right: 20),
                child: MyTextForm(
                  controller: phoneTextEditingController,
                  hint: "Phone number ☎",
                  textInputType: TextInputType.number,
                  maxLength: 10,
                ),
              ),
              KHight10,
              // const Padding(
              //   padding: EdgeInsets.only(left: 20, right: 20),
              //   child: MyTextForm(hint: "Blood group 🩸"),
              // ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: DropdownButtonFormField(
                    value: selectedGroup,
                    decoration:  InputDecoration(
                      focusColor: Colors.grey.shade300,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
                      label: const  Text("Select blood group🩸",
                      style: TextStyle(
                        color: Colors.white
                      ),)
                    ),
                    items: bloodGroups
                        .map((e) => DropdownMenuItem(child: Text(e),
                        value: e,))
                        .toList(),
                    onChanged: (value) {
                      selectedGroup = value as String? ;
                    },
                  )),
              KHight20,
              InkWell(
                onTap: () {
                  
                  Navigator.of(context).pop();
                  updateUser(docId);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey.shade300),
                  height: 50,
                  width: 300,
                  child: const Center(child: Text("Update")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextForm extends StatelessWidget {
  final String hint;
  final TextInputType? textInputType;
  final int? maxLength;
  final TextEditingController? controller;
  const MyTextForm(
      {super.key, required this.hint, this.textInputType, this.maxLength,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      maxLength: maxLength,
      decoration: InputDecoration(
          focusColor: Colors.grey.shade300,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white)),
    );
  }

}
