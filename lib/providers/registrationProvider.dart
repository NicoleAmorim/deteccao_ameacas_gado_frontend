import 'package:flutter/material.dart';
import 'package:frontend_tcc/features/monitoramento/data/models/cameraModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/monitoramento/data/models/registrationModel.dart';

class RegistrationProvider extends ChangeNotifier {
  static const _prefsKey = 'registration_data_v1';

  RegistrationModel registration = RegistrationModel();
  bool loading = false;

  // plan camera limits
  int getPlanLimit(String plan) {
    switch (plan) {
      case 'basic':
        return 1;
      case 'advanced':
        return 3;
      case 'premium':
        return 999;
      default:
        return 1;
    }
  }

  void updatePersonal({
    required String fullName,
    required String phone,
    required String email,
    required String password,
    required String address,
  }) {
    registration.fullName = fullName;
    registration.phone = phone;
    registration.email = email;
    registration.password = password;
    registration.address = address;
    notifyListeners();
  }

  void updatePlan(String plan) {
    registration.plan = plan;
    // ensure selected cameras fit limit
    final limit = getPlanLimit(plan);
    if (registration.selectedCameraIds.length > limit) {
      registration.selectedCameraIds =
          registration.selectedCameraIds.sublist(0, limit);
    }
    notifyListeners();
  }

  void updatePayment({
    required String cardNumber,
    required String cardExpiry,
    required String cardCvv,
    required String cardHolderName,
    required String cardHolderCpf,
  }) {
    registration.cardNumber = cardNumber;
    registration.cardExpiry = cardExpiry;
    registration.cardCvv = cardCvv;
    registration.cardHolderName = cardHolderName;
    registration.cardHolderCpf = cardHolderCpf;
    notifyListeners();
  }

  void addCamera(CameraModel camera) {
    registration.cameras.add(camera);
    notifyListeners();
  }

  void removeCamera(String cameraId) {
    registration.cameras.removeWhere((c) => c.id == cameraId);
    registration.selectedCameraIds.remove(cameraId);
    notifyListeners();
  }

  void selectCamera(String cameraId) {
    final limit = getPlanLimit(registration.plan);
    if (registration.selectedCameraIds.contains(cameraId)) {
      registration.selectedCameraIds.remove(cameraId);
    } else {
      if (registration.selectedCameraIds.length < limit) {
        registration.selectedCameraIds.add(cameraId);
      }
    }
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
