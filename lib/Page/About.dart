import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: Color.fromARGB(255, 12, 126, 69),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "MEDILIFE",
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 126, 69)),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Version 2.0.0",
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  "lib/Image/medic.png",
                  width: 100,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "2024",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "Ardhiansyah Kurniawan",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "Deva Pratama P",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "Stefanus Raymond",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Support By :",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Sekolah Tinggi Informatika & Komputer",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Indonesia",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "www.stiki.ac.id",
                  style: TextStyle(
                      fontSize: 16, color: Color(hexColor("#2E9DFA"))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Image.asset(
                  "lib/Image/stiki.png",
                  width: 120,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff$color';
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}
