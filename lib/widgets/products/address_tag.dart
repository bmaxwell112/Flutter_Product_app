import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String _address;

  const AddressTag(this._address);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Text(_address),
    );
  }
}
