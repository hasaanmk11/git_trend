import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Color(0xFF212332),
    elevation: 0,
    title: RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 20, color: Colors.white),
        children: [
          TextSpan(text: 'Trending Git'),
          TextSpan(
            text: 'hub ',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          TextSpan(
            text: 'repos',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    centerTitle: true,
  );
}
