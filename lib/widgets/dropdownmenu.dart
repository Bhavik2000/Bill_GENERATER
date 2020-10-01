import 'package:flutter/material.dart';

class DropdowmMenulist extends StatefulWidget {
  Function(int dropvalue) dropvalue;
  DropdowmMenulist(this.dropvalue);
  @override
  _DropdowmMenuState createState() => _DropdowmMenuState();
}

class _DropdowmMenuState extends State<DropdowmMenulist> {
  int dropdownvalue = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      style: const TextStyle(color: Colors.black),
      underline: const SizedBox(),
      onChanged: (dv) {
        setState(() {
          dropdownvalue = dv;
          widget.dropvalue(dropdownvalue);
        });
      },
      items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text('${value}'),
        );
      }).toList(),
    );
  }
}
