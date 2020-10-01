import 'package:Bill/models/Details.dart';
import 'package:Bill/providers/infomation.dart';
import 'package:Bill/screens/four.dart';
import 'package:Bill/widgets/drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../widgets/UserIcon.dart';

class Third extends StatefulWidget {
  static const routeName = '/third-page';

  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  final _quantityFocusNode = FocusNode();
  final _shippingchargeFocusNode = FocusNode();
  final _unipriceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _shipping_chargeController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _globalkey = GlobalKey<ScaffoldState>();
  Details _details;
  String _unitprice;
  String _quantity;
  String _shipping_charge;

  @override
  void dispose() {
    // TODO: implement dispose
    _quantityFocusNode.dispose();
    _shippingchargeFocusNode.dispose();
    _quantityController.dispose();
    _shipping_chargeController.dispose();
    _unipriceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _details = Provider.of<Information>(context, listen: false).details;
    if (_details.price != null) {
      _unipriceController.text = _details.price;
      _unipriceController.selection = TextSelection.fromPosition(
          TextPosition(offset: _unipriceController.text.length));
    }
    if (_details.quantity != null) {
      _quantityController.text = _details.quantity;
      _quantityController.selection = TextSelection.fromPosition(
          TextPosition(offset: _quantityController.text.length));
    }
    if (_details.shipping_charge != null) {
      _shipping_chargeController.text = _details.shipping_charge;
      _shipping_chargeController.selection = TextSelection.fromPosition(
          TextPosition(offset: _shipping_chargeController.text.length));
    }
    return;
  }

  void _saveform() {
    _formkey.currentState.save();
    if (_quantity != null) {
      Provider.of<Information>(context, listen: false).setQuantity(_quantity);
    }
    if (_unitprice != null) {
      Provider.of<Information>(context, listen: false).setUnitprice(_unitprice);
    }
    if (_shipping_charge != null) {
      Provider.of<Information>(context, listen: false)
          .setShippingCharge(_shipping_charge);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    return GestureDetector(
      onTap: () {
        _saveform();
        FocusNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        key: _globalkey,
        drawer: OwnDrawer(),
        appBar: AppBar(
          actions: [UserIcon()],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: size * 0.05,
                    ),
                    const Text(
                      'INVOICE DETAILS',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size * 0.10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'UNIT PRICE',
                          style: TextStyle(fontSize: 17),
                        ),
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width > 500
                              ? 450
                              : 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: TextFormField(
                            // autofocus: true,
                            // controller: _details.price == null
                            //     ? _unipriceController
                            //     : _unipriceController
                            //   ..text = _details.price,
                            controller: _unipriceController,
                            onSaved: (newValue) {
                              _unitprice = newValue.trim();
                            },
                            textInputAction: TextInputAction.next,
                            style: TextStyle(fontSize: 18),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_quantityFocusNode);
                            },
                            keyboardType: TextInputType.number,
                            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size * 0.067,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'QUANTITY',
                          style: TextStyle(fontSize: 17),
                        ),
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width > 500
                              ? 450
                              : 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: TextFormField(
                            // controller: _details.quantity == null
                            //     ? _quantityController
                            //     : _quantityController
                            //   ..text = _details.quantity,
                            controller: _quantityController,
                            onSaved: (newValue) {
                              _quantity = newValue.trim();
                            },
                            textInputAction: TextInputAction.next,
                            style: TextStyle(fontSize: 18),
                            focusNode: _quantityFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_shippingchargeFocusNode);
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size * 0.067,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 100,
                          height: 37,
                          child: const AutoSizeText(
                            'SHIPPING CHARGES',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width > 500
                              ? 450
                              : 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: TextFormField(
                            // controller: _details.shipping_charge == null
                            //     ? _shipping_chargeController
                            //     : _shipping_chargeController
                            //   ..text = _details.shipping_charge,
                            controller: _shipping_chargeController,
                            onSaved: (newValue) {
                              _shipping_charge = newValue.trim();
                            },
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              _saveform();
                              FocusScope.of(context).unfocus();
                            },
                            style: TextStyle(fontSize: 18),
                            focusNode: _shippingchargeFocusNode,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size * 0.172,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.white,
                          ),
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircleAvatar(
                          radius: 12,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.white,
                          ),
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircleAvatar(
                          radius: 12,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.amber,
                          ),
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircleAvatar(
                          radius: 12,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.white,
                          ),
                          backgroundColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: RaisedButton(
                            onPressed: () {
                              _saveform();
                              Navigator.of(context).pop();
                            },
                            child: const AutoSizeText(
                              'BACK',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: RaisedButton(
                            onPressed: () {
                              _saveform();
                              if (_details.price.isEmpty ||
                                  _details.quantity.isEmpty ||
                                  _details.shipping_charge.isEmpty) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please fill the above field...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              if (double.tryParse(_details.price) == null) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Please Enter valid UNIT PRICE...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              if (int.tryParse(_details.quantity) == null) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please Enter valid QUANTITY...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              if (double.tryParse(_details.shipping_charge) ==
                                  null) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Please Enter valid SHIPPING CHARGES...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              Navigator.of(context).pushNamed(
                                Four.routeName,
                              );
                            },
                            child: const AutoSizeText(
                              'NEXT',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              maxLines: 1,
                            ),
                            color: Colors.amber,
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
          ),
        ),
      ),
    );
  }
}
