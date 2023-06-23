import 'package:apobat/Component/CardCategory.dart';
import 'package:apobat/Page/Akun_Page.dart';
import 'package:apobat/Page/Cart_Page.dart';
import 'package:apobat/Page/Home_Page.dart';
import 'package:flutter/material.dart';

class Landing_Page extends StatefulWidget {
  const Landing_Page({super.key});

  @override
  State<Landing_Page> createState() => _Landing_PageState();
}

class _Landing_PageState extends State<Landing_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: true,
            title: const Text('APOBAT'),
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'lib/Image/pills.png',
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.medical_services),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Obat',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\n\n\t\t\t\tLayanan Apotek',style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text('Selengkapnya\t\t\t\t\t',style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              CardCategory()
            ]),
          ),
        ],
      ),
    );
  }
}
