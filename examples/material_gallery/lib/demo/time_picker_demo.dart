// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';

class TimePickerDemo extends StatefulComponent {
  _TimePickerDemoState createState() => new _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  TimeOfDay _selectedTime = const TimeOfDay(hour: 7, minute: 28);

  Future _handleSelectTime() async {
    TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime
    );
    if (picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(center: new Text("Time Picker")),
      body: new Column(
        children: <Widget>[
          new Text('$_selectedTime'),
          new RaisedButton(
            onPressed: _handleSelectTime,
            child: new Text('SELECT TIME')
          ),
        ],
        justifyContent: FlexJustifyContent.center
      )
    );
  }
}
