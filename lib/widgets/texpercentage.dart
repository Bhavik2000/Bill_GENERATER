import 'package:flutter/material.dart';

class TextPercentage extends StatefulWidget {
  Function(int textpercentage) textper;
  TextPercentage(this.textper);
  @override
  _TextPercentageState createState() => _TextPercentageState();
}

class _TextPercentageState extends State<TextPercentage> {
  int _dropdownvalue = 12;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: _dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      style: const TextStyle(color: Colors.black),
      underline: SizedBox(),
      onChanged: (dv) {
        setState(() {
          _dropdownvalue = dv;
          widget.textper(_dropdownvalue);
        });
      },
      items: <int>[12, 13, 14, 15].map<DropdownMenuItem>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text('${value}'),
        );
      }).toList(),
    );
  }
}
