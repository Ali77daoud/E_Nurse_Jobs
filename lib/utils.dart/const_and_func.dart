import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

const String validationPassword =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

const String baseUrl = 'http://apiamw-001-site1.dtempurl.com/api';

const List<String> homePageImg = [
  'assets/images/nurse.png',
  'assets/images/patient.png',
  'assets/images/logo.png',
  'assets/images/caring_type.png',
];

/////
const List<String> homePageTitles = [
  'Nurse',
  'Patient',
  'Caring',
  'Caring Type',
];

//////////////////////////////////////////////////
double getHeightInPercent(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.height) * (percent / 100);
}

////////////////////////////////////////////////////////////////
double getWidthInPercent(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.width) * (percent / 100);
}

////////////////////////////////////////////////////////////////
double getSp(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.width) * (percent / 300);
}

/////////////////////////////////////////////////////////////////
final String token = GetStorage().read<String>('token') ?? '';
