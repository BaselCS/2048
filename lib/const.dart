import 'package:flutter/material.dart';

const Color constOutlineColor = Color(0xFFBCB09F);
const Color constCardColor = Color(0xFFD6CDC4);
const Color constActiveCardColor = Color(0xffEEE4DA);

///2
const Color constColor1 = Color(0xFFEEE4DA);

///4
const Color constColor2 = Color(0xFFEDE0C8);

///8
const Color constColor3 = Color(0xFFF2B179);

///16
const Color constColor4 = Color(0xFFF59563);

///32
const Color constColor5 = Color(0xFFF67C60);

///64
const Color constColor6 = Color(0xFFF65E3B);

///128
const Color constColor7 = Color(0xFFEDCF73);

///256
const Color constColor8 = Color(0xFFEDCC62);

///512
const Color constColor9 = Color(0xFFEDC850);

///1024
const Color constColor10 = Color(0xFFEDC53F);

///2048
const Color constColor11 = Color(0xFFEDC22D);

///4096
const Color constColor12 = Color(0xFF458B02);

///8192
const Color constColor13 = Color(0xFF5FC501);

///16384
const Color constColor14 = Color(0xFF57BB01);

///32768
const Color constColor15 = Color(0xFF4DAB00);

///65536
const Color constColor16 = Color(0xFF458B02);

///131072
const Color constColor17 = Color(0xFF000000);

class MyWidget extends StatelessWidget {
  final int value;
  const MyWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    switch (value) {
      case 0:
        return Container(
            decoration: const BoxDecoration(color: constCardColor, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: const Center(child: Text('', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 2:
        return Container(
            decoration: const BoxDecoration(color: constColor1, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 4:
        return Container(
            decoration: const BoxDecoration(color: constColor2, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 8:
        return Container(
            decoration: const BoxDecoration(color: constColor3, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 16:
        return Container(
            decoration: const BoxDecoration(color: constColor4, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 32:
        return Container(
            decoration: const BoxDecoration(color: constColor5, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 64:
        return Container(
            decoration: const BoxDecoration(color: constColor6, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 128:
        return Container(
            decoration: const BoxDecoration(color: constColor7, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 256:
        return Container(
            decoration: const BoxDecoration(color: constColor8, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 512:
        return Container(
            decoration: const BoxDecoration(color: constColor8, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 1024:
        return Container(
            decoration: const BoxDecoration(color: constColor10, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 2048:
        return Container(
            decoration: const BoxDecoration(color: constColor11, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 4096:
        return Container(
            decoration: const BoxDecoration(color: constColor12, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 8192:
        return Container(
            decoration: const BoxDecoration(color: constColor13, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 16384:
        return Container(
            decoration: const BoxDecoration(color: constColor14, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 32768:
        return Container(
            decoration: const BoxDecoration(color: constColor15, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 65536:
        return Container(
            decoration: const BoxDecoration(color: constColor16, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
      case 131072:
        return Container(
            decoration: const BoxDecoration(color: constColor17, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold))));
      default:
        return Container(
            decoration: const BoxDecoration(color: constCardColor, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(value.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))));
    }

    //  const Center(
    //     child: Text(values[row][column] > 0 ? values[row][column].toString() : '', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)));
  }
}
