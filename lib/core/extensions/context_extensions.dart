import 'package:flutter/material.dart';
import '../../l10n/generated/app_localizations.dart';

/// Convenience extensions on BuildContext for cleaner widget code.
extension ContextExtensions on BuildContext {
  /// Access localized strings: `context.l10n.appTitle`
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Access current theme: `context.theme`
  ThemeData get theme => Theme.of(this);

  /// Access screen size: `context.screenSize`
  Size get screenSize => MediaQuery.sizeOf(this);
}
