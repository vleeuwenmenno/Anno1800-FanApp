import 'dart:async';

import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class NewsFeed extends StatefulWidget 
{
	@override
	_NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> 
{
	Timer progressChecker;
	
	@override
	void initState()
	{
		super.initState();

		progressChecker = Timer.periodic(Duration(milliseconds: 200), (Timer t) 
		{
			setState(() { });

			if (nfd.newsWidgets != null)
			{
				t.cancel();
			}
		});
	}

	@override
	void dispose()
	{
		if (progressChecker != null)
			progressChecker.cancel();

		super.dispose();
	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		return WillPopScope(
			onWillPop: () async => false,
			child: Scaffold(
				appBar: AppBar(
					title: Text('Anno Union - News feed'),
					actions: <Widget>
					[
						IconButton(
							onPressed: () 
							{ },
							icon: Icon(
								Icons.search, color: Color(0xffFFE4AD)
							)
						)
					],
				),
				drawer: SideMenu(activePageId: 0),
				body: ListView.builder(
					itemCount: nfd.newsWidgets != null ? nfd.newsWidgets.length : 0,
					itemBuilder: (BuildContext ctxt, int index) 
					{
						return nfd.newsWidgets.values.elementAt(index);
					}
				)
			)
		);
	}
}