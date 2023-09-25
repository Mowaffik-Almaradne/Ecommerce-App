class CategoriesModel {
  bool? status;
  CategoriesDataModel? data;

  CategoriesModel.froJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }
}

class CategoriesDataModel {
  int? currentPage;
  List<DataModelCategories> listDat = [];
  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      listDat.add(DataModelCategories.formJson(element));
    });
  }
}

class DataModelCategories {
  int? id;
  String? name;
  String? image;

  DataModelCategories.formJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
