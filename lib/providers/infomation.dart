import 'package:Bill/models/Details.dart';

import 'package:flutter/material.dart';

class Information with ChangeNotifier {
  // List<Details> _items = [];
  // List<Details> get items {
  //   return [..._items];
  // }

  // void addDetail(Details details) {
  //   final Details newDetails = Details(
  //       order_no: details.order_no,
  //       order_Date: details.order_Date,
  //       pan_no: details.pan_no,
  //       gst_reg_no: details.gst_reg_no,
  //       description: details.description,
  //       price: details.price,
  //       quantity: details.quantity,
  //       shipping_charge: details.shipping_charge,
  //       tax_rate: details.tax_rate,
  //       tax_type: details.tax_type,
  //       tax_amount: details.tax_amount);
  //   items.add(newDetails);
  //   notifyListeners();
  // }

  Details details = new Details();

  setOrderNumber(String orderNumber) {
    print(details);
    details.order_no = orderNumber;
    notifyListeners();
  }

  setOrderDate(String orderDate) {
    details.order_Date = orderDate;
    notifyListeners();
  }

  setPanNumber(String panNumber) {
    details.pan_no = panNumber;
    notifyListeners();
  }

  setGST(String gstNumber) {
    details.gst_reg_no = gstNumber;
    notifyListeners();
  }

  setDescription(String description) {
    details.description = description;
    notifyListeners();
  }

  setQuantity(String quatity) {
    details.quantity = quatity;
    notifyListeners();
  }

  setUnitprice(String price) {
    details.price = price;
    notifyListeners();
  }

  setShippingCharge(String shippingCharge) {
    details.shipping_charge = shippingCharge;
    notifyListeners();
  }

  setTaxrate(String taxRate) {
    details.tax_rate = taxRate;
    notifyListeners();
  }

  setTaxtype(String taxType) {
    details.tax_type = taxType;
    notifyListeners();
  }

  setTaxAmount(String taxAmount) {
    details.tax_amount = taxAmount;
    notifyListeners();
  }

  // Details getDetails() {
  //   if (details.order_no.isEmpty) {
  //     return null;
  //   }
  //   Details information = Details(
  //     order_no: details.order_no,
  //     order_Date: details.order_Date,
  //     pan_no: details.pan_no,
  //     gst_reg_no: details.gst_reg_no,
  //   );
  //   return information;
  // }
  // String getOrderNumber() {
  //   details.order_no == null ? '' : details.order_no;

  //   // return details.order_no;
  // }

  // String getOrderDate() {
  //   details.order_Date == null ? '' : details.order_Date;
  // }

  // String getPanNumber() {
  //   return details.pan_no;
  // }

  // String getGST() {
  //   return details.gst_reg_no;
  // }
}
