import 'package:flutter/material.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/aboutPage.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/loginPage.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step1PersonalData.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step2CameraRegistration.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step3Review.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/resetPassword.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/contactPage.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/supportPage.dart';
import '../../features/monitoramento/presentation/pages/cameraPage.dart';
import '../../features/monitoramento/presentation/pages/homePage.dart';
import '../../features/monitoramento/presentation/pages/SignInPage.dart';
import '../../features/monitoramento/presentation/pages/morePage.dart';
import '../../features/monitoramento/presentation/pages/notificationsPage.dart';
import '../../features/monitoramento/presentation/pages/profilePage.dart';
import '../../features/monitoramento/presentation/pages/recordingsPage.dart';

final appRoutes = <String, WidgetBuilder>{
  '/login': (context) => const LoginPage(),
  '/home': (context) => const HomePage(),
  '/camera': (context) => const CameraPage(),
  '/gravacoes': (context) => const RecordingsPage(),
  '/notificacoes': (context) => const NotificationsPage(),
  '/perfil': (context) => const ProfilePage(),
  '/adicionar-perfil': (context) => const SignInPage(),
  '/mais': (context) => const MorePage(),
  '/register/step1': (context) => const RegisterStep1Personal(),
  '/register/step2': (context) => const RegisterStep2Camera(),
  '/register/step3': (context) => const RegisterStep3Review(),
  '/reset-password': (context) => const ResetPasswordPage(),
  '/suporte': (context) => const SupportPage(),
  '/contato': (context) => const ContactPage(),
  '/sobre': (context) => const AboutPage(),

};
