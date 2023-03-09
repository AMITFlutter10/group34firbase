import 'package:flutter/material.dart';
import 'package:group34firbase/utilities/routes.dart';
import 'package:group34firbase/view/pages/login_screen.dart';
import 'package:group34firbase/view/pages/register_page.dart';


Route<dynamic>onGenerate(RouteSettings routeSettings){
  switch (routeSettings.name){
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(builder:
        (_)=> LoginScreen(),
        settings: routeSettings
    );
      case AppRoutes.registerPageRoute:
          default:  return MaterialPageRoute(builder:
          (_)=> RegisterScreen(),
          settings: routeSettings
      );

  }

}