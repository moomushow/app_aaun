import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> sliders = [
    'https://www.cmru.ac.th/assets/images/banners/th/23-07-2024/401e58e6223aaf9c65058370d2d0460129377fec.png',
    'https://www.cmru.ac.th/assets/images/banners/th/01-08-2024/099a5da16556c47d67fd872260f393af298a24f8.jpg',
    'https://www.cmru.ac.th/assets/images/banners/th/01-08-2024/6c68fa2bd3850ce0b6b6290b5e7b0c5ba3dd97c4.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 200,
            child: Swiper(
              itemCount: sliders.length,
              autoplay: true,
              itemBuilder: (context, index) {
                return Image.network(
                  sliders[index],
                  fit: BoxFit.fill,
                );
              },
            )),
      ],
    );
  }
}
