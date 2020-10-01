import 'dart:io';
import 'dart:async';
import 'package:Bill/models/Details.dart';
import 'package:Bill/providers/infomation.dart';
import 'package:Bill/screens/fullpdfviewerscreen.dart';
import 'package:Bill/screens/invoice.dart';
import 'package:Bill/widgets/drawer.dart';
import 'package:Bill/widgets/texpercentage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/UserIcon.dart';
import '../widgets/dropdownmenu.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Fifth extends StatefulWidget {
  static const routeName = '/fifth-page';

  @override
  _FifthState createState() => _FifthState();
}

class _FifthState extends State<Fifth> {
  Details _details;
  double _finalprice;
  double _gsttaxamount;
  double _totalAmount;
  int _finalDropvalue = 1;
  int _finalper = 12;

  void dropdownvalue(int dropdownvalue) {
    setState(() {
      _finalDropvalue = dropdownvalue;
      // _finalDropvalue.toDouble();
    });
  }

  void textpercentage(int _taxper) {
    setState(() {
      _finalper = _taxper;
      // _finalDropvalue.toDouble();
    });
  }

  Future<String> _createPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    pw.Text('SOLUTION HUB',
                        style: pw.TextStyle(
                            fontSize: 25, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Text('VENDORS',
                        style: pw.TextStyle(
                            fontSize: 25, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Text('Billing address:',
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      width: 175,
                      child: pw.Flexible(
                        child: pw.Text(
                          'Udhaaharan City,Survey No, 100/1, Kalpana Village, Kriti Nagar, Anaamikpradesh, 5000000 IN',
                          style: pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    pw.SizedBox(
                      width: 200,
                      child: pw.Flexible(
                        child: pw.Text(
                          'Kriti Kalpana, 11-1-1111/11, Ocha Nagar, Mayadesh 11111, IN',
                          style: pw.TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: pw.TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 50,
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      'PAN No. ${_details.pan_no}',
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  children: [
                    pw.Text('GST Registration No. ${_details.gst_reg_no}',
                        style: pw.TextStyle(
                            fontSize: 16, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.SizedBox(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Order No: ${_details.order_no}',
                              style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(
                            height: 20,
                          ),
                          pw.Text('Order Date: ${_details.order_Date}',
                              style: pw.TextStyle(
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold)),
                        ],
                      ),
                    ),
                    pw.SizedBox(
                      width: 160,
                      child: pw.Flexible(
                          child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text(
                            'Invoice Number',
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.Text(
                            'IN-KRI1-111111',
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 40,
                ),
                pw.Container(
                  child: pw.Table(
                    border: pw.TableBorder(),
                    columnWidths: {
                      0: pw.FlexColumnWidth(1.2),
                      1: pw.FlexColumnWidth(3.5),
                      2: pw.FlexColumnWidth(2),
                      3: pw.FlexColumnWidth(1.2),
                      4: pw.FlexColumnWidth(3.5),
                      5: pw.FlexColumnWidth(1.8),
                      6: pw.FlexColumnWidth(2),
                      7: pw.FlexColumnWidth(2),
                      8: pw.FlexColumnWidth(2.5),
                    },
                    // columnWidths: {
                    //   0: pw.IntrinsicColumnWidth(),
                    //   1: pw.IntrinsicColumnWidth(),
                    //   2: pw.IntrinsicColumnWidth()
                    // },
                    // defaultColumnWidth: pw.FixedColumnWidth(100),
                    // defaultVerticalAlignment:
                    //     pw.TableCellVerticalAlignment.middle,
                    children: [
                      pw.TableRow(children: [
                        pw.Center(
                          child: pw.Text('Sl No.',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Center(
                          child: pw.Text('Description',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Text('Unit Price',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.Center(
                          child: pw.Text('Qty',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Center(
                          child: pw.Text('Net Amount',
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Text('Tax Rate',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.Text('Tax Type',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.Text('Tax Amt.',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.Text('Total Amt.',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                      ]),
                      pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: pw.Center(
                              child: pw.Text(
                                '1',
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: pw.Center(
                              child: pw.Text(
                                _details.description,
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: pw.Center(
                              child: pw.Text(
                                '${double.parse(_details.price)}',
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: pw.Center(
                              child: pw.Text(
                                '${_finalDropvalue.toInt()}',
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: pw.Center(
                              child: pw.Text(
                                '${double.parse(_details.price) * _finalDropvalue.toDouble()}',
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: pw.Center(
                              child: pw.Text(
                                _details.tax_rate,
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: pw.Center(
                              child: pw.Text(
                                _details.tax_type,
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: pw.Center(
                              child: pw.Text(
                                '${double.parse(_details.tax_amount)}',
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: pw.Center(
                              child: pw.Text(
                                '${double.parse(_details.tax_amount) + double.parse(_details.price) * _finalDropvalue.toDouble()}',
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      pw.TableRow(children: [
                        pw.Center(
                          child: pw.Text('',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: pw.Center(
                            child: pw.Text(
                              'Shipping charges',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: pw.Center(
                            child: pw.Text(
                              _details.shipping_charge,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        pw.Text(''),
                        pw.Text(''),
                        pw.Text(''),
                        pw.Text(''),
                        pw.Text(''),
                        pw.Padding(
                          padding: pw.EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: pw.Center(
                            child: pw.Text(
                              _details.shipping_charge,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      pw.TableRow(children: [
                        pw.Text(''),
                        pw.Padding(
                          padding: pw.EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: pw.Center(
                            child: pw.Text(
                              '${_details.tax_type} tax amount',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: pw.Center(
                            child: pw.Text(
                              '${_gsttaxamount.toStringAsFixed(1)}',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        pw.Text(''),
                        pw.Text(''),
                        pw.Padding(
                          padding: pw.EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: pw.Center(
                            child: pw.Text(
                              '${_finalper}%',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        pw.Text(''),
                        pw.Text(''),
                        pw.Padding(
                          padding: pw.EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: pw.Center(
                            child: pw.Text(
                              '${_gsttaxamount.toStringAsFixed(1)}',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'TOTAL AMOUNT:',
                      style: pw.TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    pw.Text(
                      '${_totalAmount.toStringAsFixed(2)}',
                      style: pw.TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
    List<int> bytes = pdf.save();
    Directory directory = await getExternalStorageDirectory();
    String path = directory.path;
    File file = File('$path/Bill(${_details.order_Date}).pdf');
    await file.writeAsBytes(bytes, flush: true);
    String pdfpath = '$path/Bill(${_details.order_Date}).pdf';
    return pdfpath;
  }

  Future<String> _invoiceCreate() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            child: pw.Column(
              // crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'ORDER NO.',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        _details.order_no,
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ), //first
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'ORDER DATE.',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        _details.order_Date,
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ), //sencond
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'PAN NO.',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        _details.pan_no,
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ), //third
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'GST REG NO.',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        _details.gst_reg_no,
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ), //fourth
                pw.SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'DESCRIPTION',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.SizedBox(
                        child: pw.Text(
                          '${_details.description.trim()}',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'UNIT PRICE',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        '${double.parse(_details.price)}',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'QUANTITY',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        '${_finalDropvalue.toInt()}',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'SHIPPING CHARGES',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        '${double.parse(_details.shipping_charge)}',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'TEX PERCENTAGE(%)',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        '${_finalper}%',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'TEX TYPE',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        _details.tax_type,
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'TEX AMOUNT',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        '${double.parse(_details.tax_amount)}',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        '${_details.tax_type} TEX AMOUNT',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        '${_gsttaxamount.toStringAsFixed(1)}',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                pw.SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'TOTAL AMOUNT',
                        style: pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      pw.Text(
                        '${_totalAmount.toStringAsFixed(2)}',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    List<int> bytes = pdf.save();
    Directory directory = await getExternalStorageDirectory();
    String path = directory.path;
    File file = File('$path/Invoice.pdf');
    await file.writeAsBytes(bytes, flush: true);
    String pdfpath = '$path/Invoice.pdf';
    return pdfpath;
  }

  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    _details = Provider.of<Information>(context, listen: false).details;
    print(_details);
    _finalprice = double.parse(_details.price) * (_finalDropvalue.toDouble());
    _gsttaxamount = (_finalprice +
            double.parse(_details.tax_amount) +
            double.parse(_details.shipping_charge)) *
        (_finalper.toDouble() / 100);
    _totalAmount = _finalprice +
        double.parse(_details.tax_amount) +
        double.parse(_details.shipping_charge) +
        _gsttaxamount;
    // print(_finalprice);
    print(_finalDropvalue);
    return Scaffold(
      drawer: OwnDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'INVOICE PREVIEW',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [UserIcon()],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 35,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ORDER NO.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        _details.order_no,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'ORDER DATE.',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      _details.order_Date,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PAN NO.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        _details.pan_no,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'GST REG NO.',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      _details.gst_reg_no,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 42,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DESCRIPTION',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: AutoSizeText(
                          _details.description,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                          maxFontSize: 15,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // Flexible(
                      //   fit: ,
                      //   child: Text(
                      //     _details.description,
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 15,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'UNIT PRICE',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${double.parse(_details.price)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'QUANTITY',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        child: DropdowmMenulist(dropdownvalue),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'SHIPPING CHARGES',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${double.parse(_details.shipping_charge)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TAX PERCENTAGE(%)',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        child: TextPercentage(textpercentage),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TAX TYPE',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      _details.tax_type,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TAX AMOUNT',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${double.parse(_details.tax_amount)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_details.tax_type} TAX AMOUNT',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${_gsttaxamount.toStringAsFixed(1)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TOTAL AMOUNT',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${_totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: false,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.all(20),
                                height: size * 0.285,
                                color: Colors.transparent,
                                child: Container(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 70,
                                              width: 150,
                                              child: RaisedButton(
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                onPressed: () =>
                                                    _invoiceCreate()
                                                        .then((path) {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).push(
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .downToUp,
                                                      child: Invoice(path),
                                                    ),
                                                  );
                                                }),
                                                child: const AutoSizeText(
                                                  'INVOICE',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            SizedBox(
                                              height: 70,
                                              width: 160,
                                              child: RaisedButton(
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                onPressed: () =>
                                                    _createPDF().then((path) {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).push(
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .downToUp,
                                                      child:
                                                          Fullpdfviewer(path),
                                                    ),
                                                  );
                                                }),
                                                child: const AutoSizeText(
                                                  'GST INVOICE',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: const AutoSizeText(
                        'GENERATE',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                        maxLines: 1,
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
