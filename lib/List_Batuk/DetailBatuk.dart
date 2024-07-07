import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Component/ButtonCart.dart';

class DetailBatuk extends StatefulWidget {
  static const routeName = '/DetailBatuk';

  final String id;
  const DetailBatuk({super.key, required this.id});

  @override
  State<DetailBatuk> createState() => _DetailBatukState();
}

class _DetailBatukState extends State<DetailBatuk> {
  String id = '';
  String? image, name, deskripsi;
  String harga = '';
  FirebaseFirestore? firestore;
  CollectionReference? batuk;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    firestore = FirebaseFirestore.instance;
    batuk = firestore!.collection('Batuk');
    getData();
  }

  void getData() {
    batuk?.doc(id).get().then((value) {
      name = value.get('Nama Obat');
      harga = value.get('Harga').toString();
      deskripsi = value.get('Deskripsi');
      image = value.get('Gambar');
      setState(() {});
    });
  }

  void addToCart() async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final userDoc = FirebaseFirestore.instance.collection('Users').doc(currentUser.email);
    
    // Fetch the current cart
    DocumentSnapshot userSnapshot = await userDoc.get();
    List<dynamic> cart = userSnapshot.get('cart') ?? [];

    // Add new item to cart
    cart.add({
      'name': name,
      'price': harga,
      'quantity': 1,
      'image': image,
    });

    // Update the cart in Firestore
    await userDoc.update({'cart': cart});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          body: Column(mainAxisSize: MainAxisSize.min, children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                SizedBox(
                  height: 300,
                  width: 450,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    child: image == null
                        ? Image.network(
                            'https://icon-library.com/images/no-image-icon/no-image-icon-0.jpg')
                        : Image.network(
                            '$image',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                          ],
                        ))),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 25, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$name',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 10, top: 10, bottom: 5),
                        child: Row(
                          children: [
                            const SizedBox(width: 0),
                            Text('Rp. $harga',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green)),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 5),
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            // Text('$difficulty',
                            //     style:
                            //     (difficulty == 'Sulit')? GoogleFonts.montserrat(fontWeight: FontWeight.w300, color: Colors.red) :
                            //     (difficulty == 'Sedang')? GoogleFonts.montserrat(fontWeight: FontWeight.w300, color: Colors.yellow.shade700) :
                            //     GoogleFonts.montserrat(fontWeight: FontWeight.w300, color: Colors.green)
                            // ),
                          ],
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('$deskripsi',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyButtonCart(onTap: addToCart, text: 'Tambah Keranjang'),
          ]),
        ));
  }
}
