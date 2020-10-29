class OrderDetails {
  bool status;
  String message;
  Data data;

  OrderDetails({this.status, this.message, this.data});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<MData> data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<MData>();
      json['data'].forEach((v) {
        data.add(new MData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MData {
  String id;
  String foodMenuId;
  String menuName;
  String qty;
  String menuPriceWithoutDiscount;
  String menuPriceWithDiscount;
  String menuUnitPrice;
  String menuVatPercentage;
  String menuTaxes;
  String menuDiscountValue;
  String discountType;
  String menuNote;
  String discountAmount;
  String itemType;
  String cookingStatus;
  String cookingStartTime;
  String cookingDoneTime;
  String previousId;
  String salesId;
  String orderStatus;
  String userId;
  String outletId;
  String delStatus;

  MData(
      {this.id,
      this.foodMenuId,
      this.menuName,
      this.qty,
      this.menuPriceWithoutDiscount,
      this.menuPriceWithDiscount,
      this.menuUnitPrice,
      this.menuVatPercentage,
      this.menuTaxes,
      this.menuDiscountValue,
      this.discountType,
      this.menuNote,
      this.discountAmount,
      this.itemType,
      this.cookingStatus,
      this.cookingStartTime,
      this.cookingDoneTime,
      this.previousId,
      this.salesId,
      this.orderStatus,
      this.userId,
      this.outletId,
      this.delStatus});

  MData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodMenuId = json['food_menu_id'];
    menuName = json['menu_name'];
    qty = json['qty'];
    menuPriceWithoutDiscount = json['menu_price_without_discount'];
    menuPriceWithDiscount = json['menu_price_with_discount'];
    menuUnitPrice = json['menu_unit_price'];
    menuVatPercentage = json['menu_vat_percentage'];
    menuTaxes = json['menu_taxes'];
    menuDiscountValue = json['menu_discount_value'];
    discountType = json['discount_type'];
    menuNote = json['menu_note'];
    discountAmount = json['discount_amount'];
    itemType = json['item_type'];
    cookingStatus = json['cooking_status'];
    cookingStartTime = json['cooking_start_time'];
    cookingDoneTime = json['cooking_done_time'];
    previousId = json['previous_id'];
    salesId = json['sales_id'];
    orderStatus = json['order_status'];
    userId = json['user_id'];
    outletId = json['outlet_id'];
    delStatus = json['del_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['food_menu_id'] = this.foodMenuId;
    data['menu_name'] = this.menuName;
    data['qty'] = this.qty;
    data['menu_price_without_discount'] = this.menuPriceWithoutDiscount;
    data['menu_price_with_discount'] = this.menuPriceWithDiscount;
    data['menu_unit_price'] = this.menuUnitPrice;
    data['menu_vat_percentage'] = this.menuVatPercentage;
    data['menu_taxes'] = this.menuTaxes;
    data['menu_discount_value'] = this.menuDiscountValue;
    data['discount_type'] = this.discountType;
    data['menu_note'] = this.menuNote;
    data['discount_amount'] = this.discountAmount;
    data['item_type'] = this.itemType;
    data['cooking_status'] = this.cookingStatus;
    data['cooking_start_time'] = this.cookingStartTime;
    data['cooking_done_time'] = this.cookingDoneTime;
    data['previous_id'] = this.previousId;
    data['sales_id'] = this.salesId;
    data['order_status'] = this.orderStatus;
    data['user_id'] = this.userId;
    data['outlet_id'] = this.outletId;
    data['del_status'] = this.delStatus;
    return data;
  }
}
