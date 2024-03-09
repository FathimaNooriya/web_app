import 'package:flutter/services.dart';

class ServiceModel {
  final String serviceName;
  final Uint8List serviceImage;

  ServiceModel({
    required this.serviceName,
    required this.serviceImage,
  });
  Map<String, dynamic> toMap() {
    return {
      "Service Name": serviceName,
      "Service Image": serviceImage,
    };
  }
}
