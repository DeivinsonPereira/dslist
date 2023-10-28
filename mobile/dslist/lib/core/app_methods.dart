import 'package:flutter/material.dart';

Widget gameCard(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        url,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
