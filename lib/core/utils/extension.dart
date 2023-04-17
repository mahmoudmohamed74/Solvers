// ignore_for_file: non_constant_identifier_names

import 'package:solvers/core/utils/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZeroDouble() {
    if (this == null) {
      return Constants.zeroDouble;
    } else {
      return this!;
    }
  }
}

extension NonNullList on List<String>? {
  List<String> orEmptyList() {
    if (this == null) {
      return Constants.emptyList;
    } else {
      return this!;
    }
  }
}

extension NonNullBoll on bool? {
  bool orFalse() {
    if (this == null) {
      return Constants.FALSE;
    } else {
      return this!;
    }
  }
}
