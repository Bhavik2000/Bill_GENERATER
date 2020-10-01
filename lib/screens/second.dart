import 'package:Bill/models/Details.dart';
import 'package:Bill/providers/infomation.dart';
import 'package:Bill/screens/third.dart';
import 'package:Bill/widgets/drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import '../widgets/UserIcon.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  static const routeName = '/second-page';

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final _descriptionfocusnode = FocusNode();
  final _formkey = GlobalKey<FormState>();
  final _globalkey = GlobalKey<ScaffoldState>();

  final _descriptionController = TextEditingController();

  Details _details;
  String _description;

  void _temp() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _descriptionfocusnode.addListener(_temp);

    _details = Provider.of<Information>(context, listen: false).details;
    if (_details.description != null) {
      _descriptionController.text = _details.description;
      _descriptionController.selection = TextSelection.fromPosition(
          TextPosition(offset: _descriptionController.text.length));
    }
    return;
    // _descriptionController.text = '';
    // _descriptionController.selection = TextSelection.fromPosition(
    //     TextPosition(offset: _descriptionController.text.length));
  }

  void _saveform() {
    _formkey.currentState.save();

    if (_description != null) {
      Provider.of<Information>(context, listen: false)
          .setDescription(_description);
    }
    return;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    // _descriptionfocusnode.dispose();
    _descriptionfocusnode.removeListener(_temp);
    super.dispose();
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
                  children: [
                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DESCRIPTION',
                            style: TextStyle(fontSize: 17),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width > 500
                                ? 620
                                : 340,
                            child: TextFormField(
                              // controller: _details.description == null
                              //     ? _descriptionController
                              //     : _descriptionController
                              //   ..text = _details.description,
                              // initialValue: details.description,

                              controller: _descriptionController,

                              focusNode: _descriptionfocusnode,
                              onSaved: (value) {
                                _description = value;
                              },
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).unfocus();
                              },
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(fontSize: 18),
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              maxLines: 7,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size * 0.142,
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
                      width: 100,
                      child: RaisedButton(
                        onPressed: () {
                          _saveform();
                          if (_details.description.isEmpty) {
                            _globalkey.currentState.hideCurrentSnackBar();
                            _globalkey.currentState.showSnackBar(SnackBar(
                              content: Text('Please fill the above field...'),
                              duration: Duration(seconds: 1),
                            ));
                            return;
                          }
                          if (_details.description.length < 5) {
                            _globalkey.currentState.hideCurrentSnackBar();
                            _globalkey.currentState.showSnackBar(
                              SnackBar(
                                content:
                                    Text('Please Enter minimum 5 character...'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            return;
                          }
                          Navigator.of(context).pushNamed(Third.routeName);
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
    );
  }
}
