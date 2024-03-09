import 'dart:typed_data';


class CategoryModel {
  final String categoryName;
  final Uint8List categoryImage;
  final String categoryRate;
  final List<String> categoryIssue;
  final String? serviceId;
  final String serviceName;
  CategoryModel({
    required this.serviceName,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryRate,
    required this.categoryIssue,
    this.serviceId,
  });
  Map<String, dynamic> toMap() {
    return {
      "Service Name": serviceName,
      "Category Name": categoryName,
      "Category Rate": categoryRate,
      "Category Issue": categoryIssue,
      "CategoryImage": categoryImage,
      "Service Id": serviceId,
    };
  }
}
