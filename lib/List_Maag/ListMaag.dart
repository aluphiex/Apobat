import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apobat/List_Maag/CardMaag.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaagList());
}
class MaagList extends StatefulWidget {
  static const routeName = '/MaagList';
  const MaagList({super.key});

  @override
  State<MaagList> createState() => _MaagListState();
}

class _MaagListState extends State<MaagList> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _Maag =
  FirebaseFirestore.instance.collection("Maag");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Maag'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
                child: StreamBuilder(
                    stream: _Maag.snapshots(),
                    builder: (context, AsyncSnapshot snapshots){
                      if (snapshots.connectionState == ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(color: Colors.green,),
                        );
                      }
                      if (snapshots.hasData){
                        return ListView.builder(
                            itemCount: snapshots.data?.docs.length,
                            itemBuilder: (context, index){
                              log('Index : $index');
                              QueryDocumentSnapshot<Object?>? ds =
                              snapshots.data?.docs[index];
                              log('Index : $ds');
                              return CardMaag(ds?.id);
                            });
                      }else{}
                      return Center(
                        child: CircularProgressIndicator(color: Colors.red,),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
