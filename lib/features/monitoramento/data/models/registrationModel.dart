import 'dart:convert';
import 'cameraModel.dart';

class RegistrationModel {
  String fullName;
  String cpf;
  String phone;
  String email;
  String password;
  String cep;
  String street;
  String number;
  String neighborhood;
  String city;
  String uf;
  List<CameraModel> cameras;

  RegistrationModel({
    this.fullName = '',
    this.cpf = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.cep = '',
    this.street = '',
    this.number = '',
    this.neighborhood = '',
    this.city = '',
    this.uf = '',
    List<CameraModel>? cameras,
  }) : cameras = cameras ?? [];

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'cpf': cpf,
      'phone': phone,
      'email': email,
      'password': password,
      'cep': cep,
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
      'city': city,
      'uf': uf,
      'cameras': cameras.map((c) => c.toMap()).toList(),
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      fullName: map['fullName'] ?? '',
      cpf: map['cpf'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      cep: map['cep'] ?? '',
      street: map['street'] ?? '',
      number: map['number'] ?? '',
      neighborhood: map['neighborhood'] ?? '',
      city: map['city'] ?? '',
      uf: map['uf'] ?? '',
      cameras: map['cameras'] != null
          ? List<Map<String, dynamic>>.from(map['cameras'])
              .map((m) => CameraModel.fromMap(m))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) =>
      RegistrationModel.fromMap(json.decode(source));
}