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
		"Test release 2": 
		{
			"versionNo": "v0.0.3+4",
			"timeDate": DateTime(2019, 6, 13, 15, 38).millisecondsSinceEpoch,
			"desc": 
			"""
			- Fixed release build issues
			- News feed is currently broken on release builds :(
			"""
		},

		"Test release 1": 
		{
			"versionNo": "v0.0.2+3",
			"timeDate": DateTime(2019, 6, 13, 13, 49).millisecondsSinceEpoch,
			"desc": 
			"""
			- First beta version
			- Most old world goods & buildings & chains are in
			- New world is work-in-progress
			"""
		},

		"Minor update": 
		{
			"versionNo": "v0.0.1+2",
			"timeDate": DateTime(2019, 5, 12, 1, 44).millisecondsSinceEpoch,
			"desc": 
			"""
			- Added changelog data
			- Rolled the code
			- Baked noodles 
			"""
		},

		"Initial version": 
		{
			"versionNo": "v0.0.1+0",
			"timeDate": DateTime(2019, 5, 12, 0, 32).millisecondsSinceEpoch,
			"desc": 
			"""
			- Initial version!
			"""
		}
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