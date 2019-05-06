import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/pages/splash.dart';
import 'package:anno1800_fanapp/pages/newsFeed.dart';
import 'package:anno1800_fanapp/pages/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget 
{
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context)
	{
		MaterialColor darkBrown = const MaterialColor(
			//#714F28
			0xff714F28, const
			{
				50 : const Color(0xff714F28),
				100 : const Color(0xff714F28),
				200 : const Color(0xff714F28),
				300 : const Color(0xff714F28),
				400 : const Color(0xff714F28),
				500 : const Color(0xff714F28),
				600 : const Color(0xff714F28),
				700 : const Color(0xff714F28),
				800 : const Color(0xff714F28),
				900 : const Color(0xff714F28)
			}
		);

		MaterialColor sand = const MaterialColor(
			//#FFE4AD
			0xffFFE4AD, const 
			{
				50 : const Color(0xffFFE4AD),
				100 : const Color(0xffFFE4AD),
				200 : const Color(0xffFFE4AD),
				300 : const Color(0xffFFE4AD),
				400 : const Color(0xffFFE4AD),
				500 : const Color(0xffFFE4AD),
				600 : const Color(0xffFFE4AD),
				700 : const Color(0xffFFE4AD),
				800 : const Color(0xffFFE4AD),
				900 : const Color(0xffFFE4AD)
			}
		);

		globals.sideMenu = SideMenu();

		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: darkBrown,
				canvasColor: sand,
				appBarTheme: AppBarTheme(
					textTheme: TextTheme(
						title: TextStyle(
							color: sand,
							fontSize: 20,
							fontWeight: FontWeight.w500
						)
					),
					iconTheme: IconThemeData(color: sand),

				)
			),
			initialRoute: '/newsFeed',
			routes: 
			{
				'/': (context) => SplashScreen(),

				'/newsFeed': (context) => NewsFeed(),
			},
		);
	}
}