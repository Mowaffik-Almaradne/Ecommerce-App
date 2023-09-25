// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

void navegateTo(context, Widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return Widget;
      },
    ),
  );
}

void navegateToAndFinish(BuildContext context, Widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    (Route) => false,
  );
}
