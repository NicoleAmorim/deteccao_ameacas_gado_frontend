import 'package:flutter/material.dart';
import 'package:frontend_tcc/features/monitoramento/data/models/cameraModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/monitoramento/data/models/registrationModel.dart';

class RegistrationProvider extends ChangeNotifier {
  static const _prefsKey = 'registration_data_v1';

  RegistrationModel registration = RegistrationModel();
  bool loading = false;

  void updatePersonal({
    required String fullName,
    required String cpf,
    required String phone,
    required String email,
    required String password,
    required String cep,
    required String street,
    required String number,
    required String neighborhood,
    required String city,
    required String uf,
  }) {
    registration.fullName = fullName;
    registration.cpf = cpf;
    registration.phone = phone;
    registration.email = email;
    registration.password = password;
    registration.cep = cep;
    registration.street = street;
    registration.number = number;
    registration.neighborhood = neighborhood;
    registration.city = city;
    registration.uf = uf;
    notifyListeners();
  }

  void addCamera(CameraModel camera) {
    registration.cameras.add(camera);
    notifyListeners();
  }

  void removeCamera(String cameraId) {
    registration.cameras.removeWhere((c) => c.id == cameraId);
    notifyListeners();
  }

  Future<void> saveToPrefs() async {
    loading = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, registration.toJson());
    loading = false;
    notifyListeners();
  }

  Future<bool> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_prefsKey);
    if (json != null) {
      registration = RegistrationModel.fromJson(json);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> clearAll() async {
    registration = RegistrationModel();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
    notifyListeners();
  }
}