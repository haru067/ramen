import 'package:flutter/widgets.dart';
import 'package:ramen/l10n/text_source.dart';

class TextResource {
  TextResource(Locale locale): this.source = TextSource.of(locale);

  final TextSource source;

  static TextSource of(BuildContext context) {
    return Localizations.of<TextResource>(context, TextResource).source;
  }
}