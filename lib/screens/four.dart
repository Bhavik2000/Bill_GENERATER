import 'package:Bill/providers/infomation.dart';
import 'package:Bill/screens/fifth.dart';
import 'package:Bill/widgets/drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import '../screens/second.dart';
// import 'package:Bill/screens/third.dart'
import 'package:flutter/material.dart';
import '../widgets/UserIcon.dart';
import '../models/Details.dart';

class Four extends StatefulWidget {
  static const routeName = '/four-page';

  @override
  _FourState createState() => _FourState();
}

class _FourState extends State<Four> {
  final _taxtypeFocusNode = FocusNode();
  final _taxamountFocusNode = FocusNode();
  final _taxrateController = TextEditingController();
  final _taxtypeController = TextEditingController();
  final _taxamountController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _globalkey = GlobalKey<ScaffoldState>();
  Details _details;
  String _taxrate;
  String _taxtype;
  String _taxamount;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _taxtypeFocusNode.dispose();
    _taxamountFocusNode.dispose();
    _taxrateController.dispose();
    _taxtypeController.dispose();
    _taxamountController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _details = Provider.of<Information>(context, listen: false).details;
    if (_details.tax_rate != null) {
      _taxrateController.text = _details.tax_rate;
      _taxrateController.selection = TextSelection.fromPosition(
          TextPosition(offset: _taxrateController.text.length));
    }
    if (_details.tax_type != null) {
      _taxtypeController.text = _details.tax_type;
      _taxtypeController.selection = TextSelection.fromPosition(
          TextPosition(offset: _taxtypeController.text.length));
    }
    if (_details.tax_amount != null) {
      _taxamountController.text = _details.tax_amount;
      _taxamountController.selection = TextSelection.fromPosition(
          TextPosition(offset: _taxamountController.text.length));
    }
  }

  void _saveForm() {
    _formkey.currentState.save();
    if (_taxrate != null) {
      Provider.of<Information>(context, listen: false).setTaxrate(_taxrate);
    }
    if (_taxtype != null) {
      Provider.of<Information>(context, listen: false).setTaxtype(_taxtype);
    }
    if (_taxamount != null) {
      Provider.of<Information>(context, listen: false).setTaxAmount(_taxamount);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    return GestureDetector(
      onTap: () {
        _saveForm();
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
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size * 0.10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'TAX RATE',
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
                            // controller: _details.tax_rate == null
                            //     ? _taxrateController
                            //     : _taxrateController
                            //   ..text = _details.tax_rate,
                            controller: _taxrateController,
                            onSaved: (newValue) {
                              _taxrate = newValue.trim();
                            },
                            style: TextStyle(fontSize: 18),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_taxtypeFocusNode);
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
                        const Text(
                          'TAX TYPE',
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          width: 40,
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
                            controller: _taxtypeController,
                            // controller: _details.tax_type == null
                            //     ? _taxtypeController
                            //     : _taxtypeController
                            //   ..text = _details.tax_type,
                            onSaved: (newValue) {
                              _taxtype = newValue.trim();
                            },
                            textCapitalization: TextCapitalization.characters,
                            style: TextStyle(fontSize: 18),
                            textInputAction: TextInputAction.next,
                            focusNode: _taxtypeFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_taxamountFocusNode);
                            },
                            keyboardType: TextInputType.name,
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
                          'TAX AMOUNT',
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          width: 20,
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
                            controller: _taxamountController,
                            // controller: _details.tax_amount == null
                            //     ? _taxamountController
                            //     : _taxamountController
                            //   ..text = _details.tax_amount,
                            onSaved: (newValue) {
                              _taxamount = newValue.trim();
                            },
                            style: TextStyle(fontSize: 18),
                            textInputAction: TextInputAction.done,
                            focusNode: _taxamountFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                              FocusScope.of(context).unfocus();
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
                      height: size * 0.045,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: RaisedButton(
                            onPressed: () {
                              if (_details.tax_rate.isEmpty ||
                                  _details.tax_type.isEmpty ||
                                  _details.tax_amount.isEmpty) {
                                _globalkey.currentState.showSnackBar(SnackBar(
                                    content: Text(
                                        'Please fill the above field...')));
                                return;
                              }
                              if (int.tryParse(_details.tax_rate) == null) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please Enter valid TAX RATE...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              if (!RegExp(r"[A-Z0-9]+$")
                                  .hasMatch(_details.gst_reg_no)) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please Enter valid TAX TYPE...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              if (double.tryParse(_details.tax_amount) ==
                                  null) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text('Please Enter TAX AMOUNT...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              Navigator.of(context).pushNamed(
                                Fifth.routeName,
                              );
                            },
                            textColor: Colors.white,
                            child: const AutoSizeText(
                              'GENERATE INVOICE',
                              style: TextStyle(
                                fontSize: 18,
                              ),
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
                    SizedBox(
                      height: size * 0.045,
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
                        SizedBox(
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
                              _saveForm();

                              Navigator.of(context).pop();
                            },
                            child: const AutoSizeText(
                              'BACK',
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
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: RaisedButton(
                            onPressed: () {
                              _saveForm();

                              if (int.tryParse(_details.tax_rate) == null) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please Enter valid TAX RATE...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              if (!RegExp(r"[A-Z0-9]+$")
                                  .hasMatch(_details.gst_reg_no)) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please Enter valid TAX TYPE...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              if (double.tryParse(_details.tax_amount) ==
                                  null) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text('Please Enter TAX AMOUNT...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              Navigator.of(context).popUntil(
                                  ModalRoute.withName(Second.routeName));
                            },
                            child: const AutoSizeText(
                              'EDIT DESCRIPTION',
                              style: TextStyle(
                                fontSize: 19,
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
