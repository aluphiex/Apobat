import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:apobat/List_Flu/DetailFlu.dart';

import 'DetailDemam.dart';



class CardDemam extends StatefulWidget {
  final String? id;
  const CardDemam(this.id, {Key? key}) : super(key: key);

  @override
  State<CardDemam> createState() => _CardDemamState();
}

class _CardDemamState extends State<CardDemam> {

  String id = '';
  String? image, name,deskripsi;
  String harga='';
  FirebaseFirestore? firestore;
  CollectionReference? demam;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();


  @override
  void initState() {
    super.initState();
    id = widget.id!;
    firestore = FirebaseFirestore.instance;
    demam = firestore!.collection('Demam');
    getData();
  }

  void getData() {
    demam?.doc(id).get().then((value) {
      name = value.get('Nama Obat');
      harga = value.get('Harga').toString();
      deskripsi = value.get('Deskripsi');
      image = value.get('Gambar');

      if (mounted) {
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {Navigator.pushNamed(context, DetailDemam.routeName, arguments: id);},
        child: Card(
          margin: const EdgeInsets.only(top:8,bottom: 20,left:8,right:8),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(children: <Widget>[
            SizedBox(
                height: 90,
                width: 100,
                child: Hero(
                  tag: image.toString(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(14), bottom: Radius.circular(14)),
                    child: image == null ? Image.network('https://th.bing.com/th/id/OIP.r4eciF-FM2-3WdhvxTmGEgHaHa?pid=ImgDet&rs=1')
                        : Image.network(
                      image??'',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    name??'',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 7),
                SizedBox(
                  width: 150,
                  child: Text(
                    "Rp."+harga??'',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ],
            ),

          ]),
        )

    );
  }
}
