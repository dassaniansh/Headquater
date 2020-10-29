class GetMenu {
  bool status;
  String message;
  List<Data> data;

  GetMenu({this.status, this.message, this.data});

  GetMenu.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String code;
  String name;
  String description;
  int salePrice;
  int taxInformation;
  Null vatId;
  String userId;
  String companyId;
  String photo;
  String vegItem;
  String beverageItem;
  String barItem;
  String delStatus;
  String categoryName;
  Null percentage;
  String itemSold;

  Data(
      {this.id,
      this.code,
      this.name,
      this.description,
      this.salePrice,
      this.taxInformation,
      this.vatId,
      this.userId,
      this.companyId,
      this.photo,
      this.vegItem,
      this.beverageItem,
      this.barItem,
      this.delStatus,
      this.categoryName,
      this.percentage,
      this.itemSold});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    salePrice = json['sale_price'];
    taxInformation = json['tax_information'];
    vatId = json['vat_id'];
    userId = json['user_id'];
    companyId = json['company_id'];
    photo = json['photo'];
    vegItem = json['veg_item'];
    beverageItem = json['beverage_item'];
    barItem = json['bar_item'];
    delStatus = json['del_status'];
    categoryName = json['category_name'];
    percentage = json['percentage'];
    itemSold = json['item_sold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['sale_price'] = this.salePrice;
    data['tax_information'] = this.taxInformation;
    data['vat_id'] = this.vatId;
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['photo'] = this.photo;
    data['veg_item'] = this.vegItem;
    data['beverage_item'] = this.beverageItem;
    data['bar_item'] = this.barItem;
    data['del_status'] = this.delStatus;
    data['category_name'] = this.categoryName;
    data['percentage'] = this.percentage;
    data['item_sold'] = this.itemSold;
    return data;
  }
}
