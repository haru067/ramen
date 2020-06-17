import 'dart:ui';

import 'package:flutter/widgets.dart';

class TextSource {
  TextSource({
    @required this.title,
    @required this.greeting,
    @required this.counter,
  });

  final String title;
  final String greeting;
  final String Function(int) counter;

  factory TextSource.of(Locale locale) {
    switch (locale.languageCode) {
      case 'ja':
        return TextSource.ja();
      case 'en':
        return TextSource.en();
      default:
        return TextSource.ja();
    }
  }

  factory TextSource.ja() =>
      TextSource(
        title: "こんにちは",
        greeting: "ようこそ",
        counter: (count) => "$count回クリックされました",
      );

  factory TextSource.en() =>
      TextSource(
        title: "Hello",
        greeting: "Welcome",
        counter: (count) => "Clicked $count times",
      );
}