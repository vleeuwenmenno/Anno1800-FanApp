import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class Licenses extends StatefulWidget 
{
	@override
	LicensesState createState() => LicensesState();
}

class LicensesState extends State<Licenses> 
{
	/*
	  cached_network_image: ^0.8.0
	 */


	Map licenses = 
	{
		"flutter_html": 
		{
			"versionNo": "v0.9.6",
			"author": "Matthew Whitaker",
			"license": "MIT"
		},
		"webfeed": 
		{
			"versionNo": "v0.4.2",
			"author": "Wito Chandra",
			"license": "MIT"
		},
		"flutter_screenutil": 
		{
			"versionNo": "v0.5.2",
			"author": "LiZhuoyuan",
			"license": "Apache 2.0"
		},
		"cached_network_image": 
		{
			"versionNo": "v0.8.0",
			"author": "Rene Floor",
			"license": "MIT"
		},
		"url_launcher": 
		{
			"versionNo": "v5.0.2",
			"author": "Flutter Team",
			"license": "BSD"
		},
		"http": 
		{
			"versionNo": "v0.12.0+2",
			"author": "Dart Team",
			"license": "BSD"
		},
		"uuid": 
		{
			"versionNo": "v2.0.1",
			"author": "Yulian Kuncheff",
			"license": "MIT"
		},
		"timeago": 
		{
			"versionNo": "v2.0.14",
			"author": "Andres Araujo",
			"license": "MIT"
		},
	};

	List<Widget> licenseWidgets = [];
	
	launchURL(String url) async 
	{
		if (await canLaunch(url)) 
		{
			await launch(url);
		} 
		else 
		{
			throw 'Could not launch $url';
		}
	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		licenseWidgets = [];
		licenses.forEach((k, v)
		{
			licenseWidgets.add(Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>
				[
					MenuEntryRow(
						mainText: "$k",
						subText: "${v['versionNo']} (by ${v['author']})",
						textRight: "${v['license']}",
						type: MenuEntryRowType.Text,
						onTap: ()
						{
							launchURL("https://pub.dev/packages/$k");
						},
					),
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
						children: licenseWidgets
					)
				]
			)
		);
	}
}