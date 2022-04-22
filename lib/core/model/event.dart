import 'package:flutter/material.dart';

class Event {
  final String title;
  final Color? color;
  final int index;
  const Event(this.title, this.index, {this.color});

  @override
  String toString() => title;
}