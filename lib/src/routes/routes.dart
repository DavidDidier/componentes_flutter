import 'package:flutter/material.dart';

import '../pages/alerta_page.dart';
import '../pages/avatar_page.dart';
import '../pages/card_page.dart';
import '../pages/container_animated.dart';
import '../pages/home_page.dart';
import '../pages/inputs.dart';
import '../pages/listview_page.dart';
import '../pages/slider_page.dart';

/// It returns a map of strings to widget builders
///
/// Returns:
///   A Map<String, WidgetBuilder>
Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => const HomePage(),
    'alert': (context) => const AlertaPage(),
    'avatar': (context) => const AvatarPage(),
    'card': (context) => const CardPage(),
    'containerAnimated': (context) => ContainerAnimatedPage(),
    'inputs': (context) => const InputPage(),
    'slider': (context) => SliderPage(),
    'list': (context) => ListPage(),
  };
}
