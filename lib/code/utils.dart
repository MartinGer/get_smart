import 'package:flutter/material.dart';

Icon getIcon(String iconString) {
  switch (iconString) {
    case 'history':
      return new Icon(Icons.history);
    case 'person':
      return new Icon(Icons.person);
    case 'settings':
      return new Icon(Icons.settings);
    case 'map':
      return new Icon(Icons.map);
    default:
      return new Icon(Icons.arrow_right);
  }
}

String getIconString(Icon icon) {
  if (icon.icon == Icons.history) return 'history';
  else if (icon.icon == Icons.person) return 'person';
  else if (icon.icon == Icons.settings) return 'settings';
  else if (icon.icon == Icons.map) return 'map';
  else return 'arrow_right';
}