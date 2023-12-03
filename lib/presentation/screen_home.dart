import 'package:blood_donation_application/application/components/appbar_widget.dart';
import 'package:blood_donation_application/presentation/register_form.dart';
import 'package:blood_donation_application/presentation/update.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  void deleteDonor(docId){
    donor.doc(docId).delete();
  }
  @override
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: CustomAppbar(text: "Blood Chain🩸")),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey.shade400,
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const RegisterForm(),
            // ));
            Navigator.of(context).pushNamed('registerForm');
          },
          child: const Icon(
            Icons.add,
            size: 35.0,
            color: Colors.red,
          ),
        ),
        body: StreamBuilder(
          stream: donor.orderBy('name').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("donorDetails",arguments: {
                          "name":donorSnap['name'],
                          "phone":donorSnap["phone"].toString(),
                          "group":donorSnap["group"]
                        });
                      },
                      child: ListTile(
                        tileColor: Colors.grey.shade400,
                        title: Text("Name : ${donorSnap['name']}"),
                        subtitle: Text(
                          "Blood group 🩸 : ${donorSnap['group']},",
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                 Navigator.of(context).pushNamed('updateForm', 
                                 arguments: {
                                  'name':donorSnap['name'],
                                  'phone':donorSnap['phone'],
                                  'group':donorSnap['group'],
                                  'id':donorSnap.id
                                 });
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () {
                                  deleteDonor(donorSnap.id);

                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
