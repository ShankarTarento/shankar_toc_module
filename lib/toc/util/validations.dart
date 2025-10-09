import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/toc_localizations.dart';
import 'package:toc_module/toc/constants/toc_constants.dart';

class Validations {
  static validateFullName(
      {required BuildContext context, required String value}) {
    if (value.isEmpty) {
      return TocLocalizations.of(context)!.mProfileFullNameMandatory;
    } else if (!RegExp(r"^[a-zA-Z' ]+$").hasMatch(value)) {
      return TocLocalizations.of(context)!.mProfileFullNameWithConditions;
    } else {
      return null;
    }
  }

  static validateEmployeeId(
      {required BuildContext context, required String value}) {
    RegExp regExp = RegExp(r"^[\p{Letter}\p{Number}]+$", unicode: true);
    if (value.isNotEmpty && !regExp.hasMatch(value)) {
      return TocLocalizations.of(context)!.mProfileEmployeeIdNotValidMsg;
    }
    return null;
  }

  static validateEmployeeIdBLendedProgramForm(
      {required BuildContext context, required String value}) {
    RegExp regExp = RegExp(r"^[\p{Letter}\p{Number}]+$", unicode: true);
    if (value.isEmpty || !regExp.hasMatch(value)) {
      return TocLocalizations.of(context)!.mProfileEmployeeIdNotValidMsg;
    }
    return null;
  }

  static validatePrimaryEmail(
      {required BuildContext context, required String value}) {
    RegExp regExp = RegExpressions.validEmail;
    if (value.isEmpty) {
      return TocLocalizations.of(context)!.mProfilePrimaryEmailMandatory;
      // EnglishLang.firstNameMandatory
      //     .replaceAll(EnglishLang.firstName, EnglishLang.primaryEmail);
    }
    String? matchedString = regExp.stringMatch(value);
    if (matchedString == null ||
        matchedString.isEmpty ||
        matchedString.length != value.length) {
      return TocLocalizations.of(context)!.mStaticEmailValidationText;
    }
    return null;
  }

  static bool isValidEmail(
      {required BuildContext context, required String value}) {
    bool isValid = false;
    RegExp regExp = RegExpressions.validEmail;

    String? matchedString = regExp.stringMatch(value);
    if (matchedString == null ||
        matchedString.isEmpty ||
        matchedString.length != value.length) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  static bool isValidMobile(
      {required BuildContext context, required String value}) {
    bool isValid = false;
    RegExp regExp = RegExpressions.validPhone;

    if (value.trim().isEmpty) {
      isValid = false;
    } else if ((value.trim().length > 0 && value.trim().length != 10) ||
        !regExp.hasMatch(value)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }

  static validatePinCode(String value) {
    if (value.trim().isEmpty) {
      return null;
    } else if ((value.trim().length > 0 && value.length != 6) ||
        !RegExp(r'^[0-9]+$').hasMatch(value) ||
        value.startsWith('0')) {
      return "Please enter a valid 6 digit pincode";
    } else
      return null;
  }

  static validatePinCodeBlendedProgram(String value) {
    if (value.trim().isEmpty) {
      return "Please enter a valid 6 digit pincode";
    } else if ((value.trim().length > 0 && value.length != 6) ||
        !RegExp(r'^[0-9]+$').hasMatch(value) ||
        value.startsWith('0')) {
      return "Please enter a valid 6 digit pincode";
    } else
      return null;
  }

  static validateMobile(
      {required BuildContext context, required String value}) {
    if (value.trim().isEmpty) {
      return null;
    } else if (value.trim().length != 10 ||
        !RegExpressions.validPhone.hasMatch(value)) {
      return TocLocalizations.of(context)!.mEditProfilePleaseAddValidNumber;
    } else
      return null;
  }

  static validateDesignation(
      {required BuildContext context, required String value}) {
    if (value.trim().isEmpty) {
      return TocLocalizations.of(context)!.mDesignationMandatory;
    } else
      return null;
  }

  static String? validateGroup(
      {required BuildContext context, required String value}) {
    if (value.trim().isEmpty) {
      return TocLocalizations.of(context)!.mGroupMandatory;
    } else
      return null;
  }
}
