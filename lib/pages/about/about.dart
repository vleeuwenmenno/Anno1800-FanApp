import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:anno1800_fanapp/widgets/detailedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class About extends StatefulWidget 
{
	@override
	AboutState createState() => AboutState();
}

class AboutState extends State<About> 
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		return WillPopScope(
			onWillPop: () async => false,
			child: Scaffold(
				appBar: AppBar(
					title: Text('About'),
				),
				drawer: SideMenu(activePageId: 7),
				body: Stack(
					children: <Widget>
					[
						Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget>
							[
								MenuEntryRow(
									mainText: "Changelog",
									type: MenuEntryRowType.None,
									onTap: ()
									{
										Navigator.pushNamed(context, "/drawer/about/changelog");
									},
								),

								MenuEntryRow(
									mainText: "Licenses",
									type: MenuEntryRowType.None,
									onTap: ()
									{
										Navigator.pushNamed(context, "/drawer/about/licenses");
									},
								)
							]
						),

						Container(
							alignment: FractionalOffset.bottomCenter,
							child: Column(
								mainAxisAlignment: MainAxisAlignment.end,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: <Widget>
								[	
									DetailedButton(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										controller: DetailedButtonController(enabled: true, forceEnabled: true),
										onPressed: ()
										{
											
										},
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												Image.asset("assets/icons/other/Balance.png", width: 32),
												Padding(padding: EdgeInsets.all(4)),
												RichText(
													text: TextSpan(
														text: "Every credit counts...",
														style: TextStyle(
															fontFamily: 'Angsana New',
															fontSize: 14.0,
															color: const Color(0xffFFE4AD),
															fontWeight: FontWeight.bold
														)
													),
												)
											],
										),
									),

									Padding(padding: EdgeInsets.all(5)),
									
									DetailedButton(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										controller: DetailedButtonController(enabled: true, forceEnabled: true),
										onPressed: ()
										{
											
										},
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												Image.asset("assets/resources/Beer.png", width: 32),
												Padding(padding: EdgeInsets.all(4)),
												RichText(
													text: TextSpan(
														text: "Buy us a beer",
														style: TextStyle(
															fontFamily: 'Angsana New',
															fontSize: 14.0,
															color: const Color(0xffFFE4AD),
															fontWeight: FontWeight.bold
														)
													),
												)
											],
										),
									),

									Padding(padding: EdgeInsets.all(5)),

									DetailedButton(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										controller: DetailedButtonController(enabled: true, forceEnabled: true),
										onPressed: ()
										{
											
										},
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												Image.asset("assets/resources/Canned_food.png", width: 32),
												Padding(padding: EdgeInsets.all(4)),
												RichText(
													text: TextSpan(
														text: "Buy us a meal",
														style: TextStyle(
															fontFamily: 'Angsana New',
															fontSize: 14.0,
															color: const Color(0xffFFE4AD),
															fontWeight: FontWeight.bold
														)
													),
												)
											],
										),
									),

									Padding(padding: EdgeInsets.all(12)),
								]
							)
						)
					]
				)
			)
		);
	}
}