import 'dart:async';

import 'package:anno1800_fanapp/backend/newsFeedData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class NewsFeed extends StatefulWidget 
{
	NewsFeedData nfd;

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

			if (widget.nfd.newsWidgets != null)
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
		widget.nfd = (ModalRoute.of(context).settings.arguments as Map)["newsFeedData"];

		return Scaffold(
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
				itemCount: widget.nfd.newsWidgets != null ? widget.nfd.newsWidgets.length : 0,
				itemBuilder: (BuildContext ctxt, int index) 
				{
					return widget.nfd.newsWidgets.values.elementAt(index);
				}
			)
		);
	}
}