class MyOrder {
  bool status;
  String message;
  Data data;

  MyOrder({this.status, this.message, this.data});

  MyOrder.fromJson(Map<String, dynamic> json) {
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
  String customerId;
  String saleNo;
  String totalItems;
  String subTotal;
  String paidAmount;
  String dueAmount;
  Null disc;
  Null discActual;
  String vat;
  String totalPayable;
  String paymentMethodId;
  String closeTime;
  Null tableId;
  String totalItemDiscountAmount;
  String subTotalWithDiscount;
  String subTotalDiscountAmount;
  String totalDiscountAmount;
  String deliveryCharge;
  String subTotalDiscountValue;
  String subTotalDiscountType;
  String saleDate;
  String dateTime;
  String orderTime;
  String mpay;
  String cookingStartTime;
  String cookingDoneTime;
  String modified;
  String userId;
  String waiterId;
  String outletId;
  String orderStatus;
  String orderType;
  String delStatus;
  String saleVatObjects;

  MData(
      {this.id,
      this.customerId,
      this.saleNo,
      this.totalItems,
      this.subTotal,
      this.paidAmount,
      this.dueAmount,
      this.disc,
      this.discActual,
      this.vat,
      this.totalPayable,
      this.paymentMethodId,
      this.closeTime,
      this.tableId,
      this.totalItemDiscountAmount,
      this.subTotalWithDiscount,
      this.subTotalDiscountAmount,
      this.totalDiscountAmount,
      this.deliveryCharge,
      this.subTotalDiscountValue,
      this.subTotalDiscountType,
      this.saleDate,
      this.dateTime,
      this.orderTime,
      this.mpay,
      this.cookingStartTime,
      this.cookingDoneTime,
      this.modified,
      this.userId,
      this.waiterId,
      this.outletId,
      this.orderStatus,
      this.orderType,
      this.delStatus,
      this.saleVatObjects});

  MData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    saleNo = json['sale_no'];
    totalItems = json['total_items'];
    subTotal = json['sub_total'];
    paidAmount = json['paid_amount'];
    dueAmount = json['due_amount'];
    disc = json['disc'];
    discActual = json['disc_actual'];
    vat = json['vat'];
    totalPayable = json['total_payable'];
    paymentMethodId = json['payment_method_id'];
    closeTime = json['close_time'];
    tableId = json['table_id'];
    totalItemDiscountAmount = json['total_item_discount_amount'];
    subTotalWithDiscount = json['sub_total_with_discount'];
    subTotalDiscountAmount = json['sub_total_discount_amount'];
    totalDiscountAmount = json['total_discount_amount'];
    deliveryCharge = json['delivery_charge'];
    subTotalDiscountValue = json['sub_total_discount_value'];
    subTotalDiscountType = json['sub_total_discount_type'];
    saleDate = json['sale_date'];
    dateTime = json['date_time'];
    orderTime = json['order_time'];
    mpay = json['mpay'];
    cookingStartTime = json['cooking_start_time'];
    cookingDoneTime = json['cooking_done_time'];
    modified = json['modified'];
    userId = json['user_id'];
    waiterId = json['waiter_id'];
    outletId = json['outlet_id'];
    orderStatus = json['order_status'];
    orderType = json['order_type'];
    delStatus = json['del_status'];
    saleVatObjects = json['sale_vat_objects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['sale_no'] = this.saleNo;
    data['total_items'] = this.totalItems;
    data['sub_total'] = this.subTotal;
    data['paid_amount'] = this.paidAmount;
    data['due_amount'] = this.dueAmount;
    data['disc'] = this.disc;
    data['disc_actual'] = this.discActual;
    data['vat'] = this.vat;
    data['total_payable'] = this.totalPayable;
    data['payment_method_id'] = this.paymentMethodId;
    data['close_time'] = this.closeTime;
    data['table_id'] = this.tableId;
    data['total_item_discount_amount'] = this.totalItemDiscountAmount;
    data['sub_total_with_discount'] = this.subTotalWithDiscount;
    data['sub_total_discount_amount'] = this.subTotalDiscountAmount;
    data['total_discount_amount'] = this.totalDiscountAmount;
    data['delivery_charge'] = this.deliveryCharge;
    data['sub_total_discount_value'] = this.subTotalDiscountValue;
    data['sub_total_discount_type'] = this.subTotalDiscountType;
    data['sale_date'] = this.saleDate;
    data['date_time'] = this.dateTime;
    data['order_time'] = this.orderTime;
    data['mpay'] = this.mpay;
    data['cooking_start_time'] = this.cookingStartTime;
    data['cooking_done_time'] = this.cookingDoneTime;
    data['modified'] = this.modified;
    data['user_id'] = this.userId;
    data['waiter_id'] = this.waiterId;
    data['outlet_id'] = this.outletId;
    data['order_status'] = this.orderStatus;
    data['order_type'] = this.orderType;
    data['del_status'] = this.delStatus;
    data['sale_vat_objects'] = this.saleVatObjects;
    return data;
  }
}
