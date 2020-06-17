import 'package:flutter/widgets.dart';
import 'text_resource.dart';

class LocalizationDelegate extends LocalizationsDelegate<TextResource> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['ja', 'en'].contains(locale.languageCode);

  @override
  Future<TextResource> load(Locale locale) async => TextResource(locale);

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}