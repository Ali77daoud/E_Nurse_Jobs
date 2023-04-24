import 'package:e_nurse_jobs/view/screens/auth_screens/signup_screen.dart';
import 'package:e_nurse_jobs/view/screens/home_page_screens/home_page.dart';
import 'package:e_nurse_jobs/view/screens/home_page_screens/nurse_pages/add_nurse.dart';
import 'package:e_nurse_jobs/view/screens/home_page_screens/nurse_pages/details_nurse.dart';
import 'package:e_nurse_jobs/view/screens/home_page_screens/nurse_pages/edit_nurse.dart';
import 'package:e_nurse_jobs/view/screens/home_page_screens/nurse_pages/nurse_page.dart';
import 'package:e_nurse_jobs/view/screens/home_page_screens/patient_pages/details_patient.dart';
import 'package:e_nurse_jobs/view/screens/home_page_screens/patient_pages/patient_page.dart';
import 'package:get/route_manager.dart';

import '../view/screens/auth_screens/login_screen.dart';
import '../view/screens/welcome_screen.dart';

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const registerScreen = '/registerScreen';
  static const homeScreen = '/homeScreen';
  static const nursePage = '/nursePage';
  static const addNursePage = '/addNursePage';
  static const editNursePage = '/editNursePage';
  static const detailsNursePage = '/detailsNursePage';
  static const patientPage = '/patientPage';
  static const detailsPatientPage = '/detailsPatientPage';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),

    /////////// auth route
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    // /////////////////////
    GetPage(
      name: Routes.registerScreen,
      page: () => SignUpScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // // /// app route
    GetPage(
      name: Routes.homeScreen,
      page: () => HomePageScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    // ////////
    GetPage(
      name: Routes.nursePage,
      page: () => NursePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    // ////////
    GetPage(
      name: Routes.addNursePage,
      page: () => AddNursePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    // ////////
    GetPage(
      name: Routes.editNursePage,
      page: () => EditNursePage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    // ////////
    GetPage(
      name: Routes.detailsNursePage,
      page: () => DetailsNursePge(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    ////////////////////////patient patient//////////////////////////////////////////
    // ////////
    GetPage(
      name: Routes.patientPage,
      page: () => PatientPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    // ////////
    GetPage(
      name: Routes.detailsPatientPage,
      page: () => DetailsPatientPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    ////
  ];
}
