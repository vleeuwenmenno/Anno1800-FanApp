import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:anno1800_fanapp/widgets/detailedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:timeago/timeago.dart' as timeago;

class Changelog extends StatefulWidget 
{
	@override
	ChangelogState createState() => ChangelogState();
}

class ChangelogState extends State<Changelog> 
{
	Map versionHistory = 
	{
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
			body: Stack(
				children: <Widget>
				[
					Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: versionWidgets
					)
				]
			)
		);
	}
}