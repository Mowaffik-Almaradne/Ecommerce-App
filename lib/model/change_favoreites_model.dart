class ChangeFavorietsModel {
  bool? status;
  String? message;
  ChangeFavorietsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
