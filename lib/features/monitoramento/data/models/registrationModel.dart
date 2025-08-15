import 'dart:convert';
import 'cameraModel.dart';

class RegistrationModel {
  String fullName;
  String phone;
  String email;
  String password;
  String address;

  String plan; // 'basic' | 'advanced' | 'premium'

  // payment
  String cardNumber;
  String cardExpiry;
  String cardCvv;
  String cardHolderName;
  String cardHolderCpf;

  List<CameraModel> cameras; // registered cameras
  List<String> selectedCameraIds; // ids selected for plan usage

  RegistrationModel({
    this.fullName = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.address = '',
    this.plan = 'basic',
    this.cardNumber = '',
    this.cardExpiry = '',
    this.cardCvv = '',
    this.cardHolderName = '',
    this.cardHolderCpf = '',
    List<CameraModel>? cameras,
    List<String>? selectedCameraIds,
  })  : cameras = cameras ?? [],
        selectedCameraIds = selectedCameraIds ?? [];

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'password': password,
      'address': address,
      'plan': plan,
      'cardNumber': cardNumber,
      'cardExpiry': cardExpiry,
      'cardCvv': cardCvv,
      'cardHolderName': cardHolderName,
      'cardHolderCpf': cardHolderCpf,
      'cameras': cameras.map((c) => c.toMap()).toList(),
      'selectedCameraIds': selectedCameraIds,
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      fullName: map['fullName'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      plan: map['plan'] ?? 'basic',
      cardNumber: map['cardNumber'] ?? '',
      cardExpiry: map['cardExpiry'] ?? '',
      cardCvv: map['cardCvv'] ?? '',
      cardHolderName: map['cardHolderName'] ?? '',
      cardHolderCpf: map['cardHolderCpf'] ?? '',
      cameras: map['cameras'] != null
          ? List<Map<String, dynamic>>.from(map['cameras'])
              .map((m) => CameraModel.fromMap(m))
              .toList()
          : [],
      selectedCameraIds: map['selectedCameraIds'] != null
          ? List<String>.from(map['selectedCameraIds'])
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) =>
      RegistrationModel.fromMap(json.decode(source));
}
