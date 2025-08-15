import 'package:flutter/material.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/loginPage.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step1PersonalData.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step2PlanSelection.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step3Payment.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step4CameraRegistration.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step5CameraSelection.dart';
import 'package:frontend_tcc/features/monitoramento/presentation/pages/auth/registration/step6Review.dart';
import '../../features/monitoramento/presentation/pages/cameraPage.dart';
import '../../features/monitoramento/presentation/pages/homePage.dart';
import '../../features/monitoramento/presentation/pages/SignInPage.dart';
import '../../features/monitoramento/presentation/pages/morePage.dart';
import '../../features/monitoramento/presentation/pages/notificationsPage.dart';
import '../../features/monitoramento/presentation/pages/plansPage.dart';
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
  '/plans': (context) => const PlansPage(),
  '/register/step1': (context) => const RegisterStep1Personal(),
  '/register/step2': (context) => const RegisterStep2Plan(),
  '/register/step3': (context) => const RegisterStep3Payment(),
  '/register/step4': (context) => const RegisterStep4Camera(),
  '/register/step5': (context) => const RegisterStep5Selection(),
  '/register/step6': (context) => const RegisterStep6Review(),

};
