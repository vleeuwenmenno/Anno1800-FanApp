import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:timeago/timeago.dart' as timeago;

class Changelog extends StatefulWidget 
{	
	Globals globals;

	@override
	ChangelogState createState() => ChangelogState();
}

class ChangelogState extends State<Changelog> 
{
	Map versionHistory = 
	{
		"Beta release": 
		{
			"versionNo": "v0.0.7+60",
			"timeDate": DateTime(2019, 6, 13, 22, 08).millisecondsSinceEpoch,
			"desc": 
			"""
			- Bugfixes
			- Added in-app-purchases for donations (WIP)
			"""
		},

		"Beta release": 
		{
			"versionNo": "v0.0.5+57",
			"timeDate": DateTime(2019, 6, 13, 19, 47).millisecondsSinceEpoch,
			"desc": 
			"""
			- First beta version
			- Removed old mockup widgets
			- Fixed asset cache management
			- Fixed news feed no data label
			- Added new app icon
			- Added tooltips to chips in goods and buildings
			- Disabled unfinished tabs in the drawer (More is coming ;])
			"""
		},
	};

	List<Widget> versionWidgets = [];

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];

		versionWidgets = [];
		versionHistory.forEach((k, v)
		{
			versionWidgets.add(Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>
				[
					MenuEntryRow(
						mainText: "$k",
						subText: "${v['versionNo']} (${timeago.format(DateTime.fromMillisecondsSinceEpoch(v['timeDate']))})",
						type: MenuEntryRowType.Text,
					),

					Padding(padding: EdgeInsets.only(top: 12)),

					RichText(
						textAlign: TextAlign.start,
						text: TextSpan(
							style: TextStyle(
								fontFamily: 'Angsana New',
								fontWeight: FontWeight.w400,
								color:  Color(0xff714F28).withOpacity(0.4),
								fontSize: ScreenUtil(allowFontScaling: true).setSp(40)
							),
							text: "${v['desc']}"
						),
					)
				],
			));
		});

		return Scaffold(
			appBar: AppBar(
				title: Text('Changelog'),
			),
			drawer: SideMenu(activePageId: 7),
			body: SingleChildScrollView(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: versionWidgets
				)
			)
		);
	}
}