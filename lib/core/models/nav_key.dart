import 'package:flutter/material.dart';

class NavKey<E> {
  NavKey({required this.key});
  final GlobalKey<NavigatorState> key;
}
