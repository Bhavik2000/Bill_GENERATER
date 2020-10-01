class Details {
  String order_no;
  String order_Date;
  String pan_no;
  String gst_reg_no;
  String description;
  String price;
  String quantity;
  String shipping_charge;
  String tax_rate;
  String tax_type;
  String tax_amount;
  Details(
      {this.order_no,
      this.order_Date,
      this.pan_no,
      this.gst_reg_no,
      this.description,
      this.price,
      this.quantity,
      this.shipping_charge,
      this.tax_rate,
      this.tax_amount,
      this.tax_type});
  // Details get details {
  //   Details details = Details(
  //     description: description,
  //     order_no: order_no,
  //     order_Date: order_Date,
  //     pan_no: pan_no,
  //     gst_reg_no: gst_reg_no,
  //   );
  //   return details;
  // }

  // void takeinformation({
  //   String orderno,
  //   String panno,
  //   String orderdate,
  //   String gstno,
  //   String description,
  //   String price,
  //   String quantity,
  //   String shipping_charge,
  //   double tax_rate,
  //   String tax_type,
  //   double tax_amount,
  // }) {
  //   order_no = orderno;
  //   order_Date = orderdate;
  //   pan_no = panno;
  //   gst_reg_no = gstno;
  //   description = description;
  //   price = price;
  //   quantity = quantity;
  //   shipping_charge = shipping_charge;
  //   tax_rate = tax_rate;
  //   tax_type = tax_type;
  //   tax_amount = tax_amount;
  // }
}
