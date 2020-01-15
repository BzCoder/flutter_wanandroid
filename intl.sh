#!/usr/bin/env bash
flutter pub pub run intl_translation:extract_to_arb --output-dir=assets/i18n-arb lib/i18n/localization.dart
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/i18n --no-use-deferred-loading lib/i18n/localization.dart assets/i18n-arb/intl_*.arb