import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/localize.dart';
import 'package:anno1800_fanapp/pages/about/about.dart';
import 'package:anno1800_fanapp/pages/about/changelog.dart';
import 'package:anno1800_fanapp/pages/about/languages.dart';
import 'package:anno1800_fanapp/pages/about/licenses.dart';
import 'package:anno1800_fanapp/pages/about/thnx.dart';
import 'package:anno1800_fanapp/pages/buildings/buildings.dart';
import 'package:anno1800_fanapp/pages/buildings/buildingsInfo.dart';
import 'package:anno1800_fanapp/pages/goods/goodsChain.dart';
import 'package:anno1800_fanapp/pages/newsFeed/newsDetails.dart';
import 'package:anno1800_fanapp/pages/newsFeed/newsFeed.dart';
import 'package:anno1800_fanapp/pages/popNeeds/populationNeeds.dart';
import 'package:anno1800_fanapp/pages/popNeeds/populationNeedsCalc.dart';
import 'package:anno1800_fanapp/pages/popNeeds/populationNeedsCalcResult.dart';
import 'package:anno1800_fanapp/pages/goods/goods.dart';
import 'package:anno1800_fanapp/pages/goods/goodsInfo.dart';
import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/pages/splash.dart';
import 'package:catcher/catcher_plugin.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async
{
	//debug configuration
 	CatcherOptions debugOptions = CatcherOptions(PageReportMode(showStackTrace: true), [ConsoleHandler()]);

	//release configuration
	CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(),
	[
		EmailManualHandler(["menno@vleeuwen.me"])
	]);

	//profile configuration
	CatcherOptions profileOptions = CatcherOptions(
		NotificationReportMode(),
		[ConsoleHandler(), ToastHandler()],
		handlerTimeout: 10000,
	);

	//MyApp is root widget
	Catcher(MyApp(),
		debugConfig: debugOptions,
		releaseConfig: releaseOptions,
		profileConfig: profileOptions,
		enableLogger: true
	);
}

class MyApp extends StatelessWidget 
{
	Locale deviceLocale;
	var returnData = {};

	Globals globals = Globals();

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

		return MaterialApp(
			navigatorKey: Catcher.navigatorKey,
			title: 'Anno 1800 FanApp',
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
					iconTheme: IconThemeData(color: sand)
				),
			),
			supportedLocales: Globals.supportedLangs,
			localizationsDelegates: 
			[
				LocalizeDelegate(Globals.supportedLangs),
				GlobalMaterialLocalizations.delegate,
				GlobalWidgetsLocalizations.delegate
			],
			localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales)
			{
				deviceLocale = locale;
				locale = locale;

				for (Locale supportedLocale in supportedLocales)
				{
					if (supportedLocale.languageCode == locale.languageCode || supportedLocale.countryCode == locale.countryCode)
					{
						return supportedLocale;
					}
				}

				return supportedLocales.first;
			},
			initialRoute: '/',
			routes: 
			{
				'/': (context) => SplashScreen(),

				'/drawer/news': (context) => NewsFeed(),
				'/drawer/news/details': (context) => NewsDetails(),

				'/drawer/population needs': (context) => PopulationNeeds(),
				'/drawer/population needs/calc': (context) => PopulationNeedsCalc(),
				'/drawer/population needs/calc/result': (context) => PopNCalcResults(),

				'/drawer/settings': (context) => About(),
				'/drawer/donate': (context) => About(),
				'/drawer/about/changelog': (context) => Changelog(),
				'/drawer/about/licenses': (context) => Licenses(),
				'/drawer/about/languages': (context) => Languages(),

				'/drawer/goods': (context) => Goods(),
				'/goods/goodsInfo': (context) => GoodsInfo(),
				'/goods/goodsChain': (context) => GoodsChain(),

				'/drawer/buildings': (context) => Buildings(),
				'/buildings/buildingInfo': (context) => BuildingInfo(),

				'/thnx': (context) => Thnx()
			},
		);
	}
}