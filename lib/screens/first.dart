import 'package:Bill/models/Details.dart';
import 'package:Bill/providers/infomation.dart';
import 'package:Bill/widgets/drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import '../screens/second.dart';
import '../widgets/UserIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class First extends StatefulWidget {
  static const routeName = 'first-page';

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  final _pan_noFocusNode = FocusNode();
  final _gst_regFocusNode = FocusNode();
  final _order_noController = TextEditingController();
  final _order_DateController = TextEditingController();
  final _gst_regController = TextEditingController();
  final _pan_noController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _globalkey = GlobalKey<ScaffoldState>();
  Details _details;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pan_noFocusNode.dispose();
    _gst_regFocusNode.dispose();
    _order_noController.dispose();
    _order_DateController.dispose();
    _pan_noController.dispose();
    _gst_regController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _details = Provider.of<Information>(context, listen: false).details;

    if (_details.order_no != null) {
      _order_noController.text = _details.order_no;
      _order_noController.selection = TextSelection.fromPosition(
          TextPosition(offset: _order_noController.text.length));
    }

    if (_details.order_Date != null) {
      _order_DateController.text = _details.order_Date;
      _order_DateController.selection = TextSelection.fromPosition(
          TextPosition(offset: _order_DateController.text.length));
    }

    if (_details.pan_no != null) {
      _pan_noController.text = _details.pan_no;
      _pan_noController.selection = TextSelection.fromPosition(
          TextPosition(offset: _pan_noController.text.length));
    }

    if (_details.gst_reg_no != null) {
      _gst_regController.text = _details.gst_reg_no;
      _gst_regController.selection = TextSelection.fromPosition(
          TextPosition(offset: _gst_regController.text.length));
    }
    return;
  }

  String _orderno;
  String _order_Date;
  String _pan_no;
  String _gst_rsg_no;
  String selectDate;
  String substring;

  void _saveForm() {
    _formkey.currentState.save();
    if (_orderno != null) {
      Provider.of<Information>(context, listen: false).setOrderNumber(_orderno);
    }
    if (_order_Date != null) {
      Provider.of<Information>(context, listen: false)
          .setOrderDate(_order_Date);
    }
    if (_pan_no != null) {
      Provider.of<Information>(context, listen: false).setPanNumber(_pan_no);
    }
    if (_gst_rsg_no != null) {
      Provider.of<Information>(context, listen: false).setGST(_gst_rsg_no);
    }
    return;
  }

  Future<void> _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2222));
    if (picked != null)
      setState(() {
        selectDate = picked.toString();
        _saveForm();
      });
  }

  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    return GestureDetector(
      onTap: () {
        _saveForm();
        print(size);
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          'ORDER NO.',
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
                            // controller: _details.order_no == null
                            //     ? _order_noController
                            //     : _order_noController
                            //   ..text = _details.order_no,
                            controller: _order_noController,
                            style: TextStyle(fontSize: 18),
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).unfocus();
                            },
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              _orderno = newValue.trim();
                            },
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ORDER DATE',
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
                            autofocus: false,
                            // controller: _details.order_Date == null
                            //     ? _order_DateController
                            //     : _order_DateController
                            //   ..text = _details.order_Date,
                            controller: _order_DateController,
                            style: TextStyle(fontSize: 18),

                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              _selectDate();
                            },

                            onSaved: (_) {
                              if (selectDate != null) {
                                substring = selectDate.substring(0, 10);
                                print(substring);
                                _order_DateController.text = substring;
                                _order_Date = substring;
                                print(_order_Date);
                                print(_order_DateController.text);
                              }
                              return;
                            },

                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_pan_noFocusNode);
                            },

                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'PAN NO.',
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
                            autofocus: false,
                            // controller: _details.pan_no == null
                            //     ? _pan_noController
                            //     : _pan_noController
                            //   ..text = _details.pan_no,
                            controller: _pan_noController,
                            onSaved: (newValue) {
                              _pan_no = newValue.trim();
                            },
                            textCapitalization: TextCapitalization.characters,
                            style: TextStyle(fontSize: 18),
                            focusNode: _pan_noFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_gst_regFocusNode);
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
                      height: size * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'GST REG NO.',
                          style: TextStyle(fontSize: 18),
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
                            autofocus: false,
                            controller: _gst_regController,
                            // controller: _details.gst_reg_no == null
                            //     ? _gst_regController
                            //     : _gst_regController
                            //   ..text = _details.gst_reg_no,
                            // initialValue: _initValue['gst_reg_no'],
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              _saveForm();
                              FocusScope.of(context).unfocus();
                            },
                            textCapitalization: TextCapitalization.characters,
                            style: TextStyle(fontSize: 17),
                            focusNode: _gst_regFocusNode,
                            onSaved: (newValue) {
                              _gst_rsg_no = newValue.trim();
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
                      height: size * 0.10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                          child: const CircleAvatar(
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
                          child: const CircleAvatar(
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
                          child: const CircleAvatar(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: RaisedButton(
                            onPressed: () {
                              _saveForm();
                              if (_details.order_no.isEmpty ||
                                  _details.order_Date.isEmpty ||
                                  _details.pan_no.isEmpty ||
                                  _details.gst_reg_no.isEmpty) {
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
                              if (_details.order_no.length < 1) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please Enter valid ORDER NO...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              // if (_details.order_Date.length < 1) {
                              //   _globalkey.currentState.hideCurrentSnackBar();
                              //   _globalkey.currentState.showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //           'Please Enter valid ORDER DATE...'),
                              //       duration: Duration(seconds: 1),
                              //     ),
                              //   );
                              //   return;
                              // }
                              if (!RegExp(r"[A-Z0-9]+$")
                                  .hasMatch(_details.pan_no)) {
                                _globalkey.currentState.hideCurrentSnackBar();
                                _globalkey.currentState.showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please Enter valid PAN NO...'),
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
                                    content: Text(
                                        'Please Enter valid GST REG NO...'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                return;
                              }
                              Navigator.of(context).pushNamed(
                                Second.routeName,
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
