import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
  });

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _switchValue,
      onChanged: (value) {
        setState(() {
          _switchValue = value;
        });
      },
      activeColor: Colors.white,
      inactiveTrackColor: const Color(0xffC6C4D4),
      activeTrackColor: const Color(0xff00F0FF),
      inactiveThumbColor: Colors.white,
      splashRadius: 0,
    );
  }
}
