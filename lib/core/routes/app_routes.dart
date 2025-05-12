import 'package:flutter/material.dart';
import '../../features/monitoramento/presentation/pages/cameraPage.dart';
import '../../features/monitoramento/presentation/pages/homePage.dart';
import '../../features/monitoramento/presentation/pages/loginPage.dart';
import '../../features/monitoramento/presentation/pages/SignInPage.dart';
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
};
