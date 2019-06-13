import 'dart:async';
import 'dart:convert';

import 'package:anno1800_fanapp/backend/assets.dart';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/backend/newsFeedData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:webfeed/domain/media/media.dart';

class NewsFeed extends StatefulWidget 
{
	Globals globals;

	@override
	_NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> 
{
	Timer progressChecker;
	RefreshController _refreshController;	
	double loadingProgress = 0.0;
	bool once = true;

	@override
	void dispose()
	{
		if (progressChecker != null)
			progressChecker.cancel();

		_refreshController.dispose();
		super.dispose();
	}

	@override
	void initState()
	{
		super.initState();

    	_refreshController = RefreshController();
		progressChecker = Timer.periodic(Duration(milliseconds: 200), (Timer t) 
		{
			setState(() { });

			if (widget.globals.nfd != null && widget.globals.nfd.newsWidgets != null)
			{
				t.cancel();
			}
		});
	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];

		if (widget.globals.nfd != null && widget.globals.nfd.newsWidgets != null)
			loadingProgress = (widget.globals.nfd.itemsLoaded + AssetsManagement.cachedImages) / (widget.globals.nfd.itemsExpected + AssetsManagement.imageAssets.length);

		return WillPopScope(
			onWillPop: () async => false,
			child: Scaffold(
				appBar: AppBar(
					title: Text('Anno Union - News feed'),
					actions: <Widget>
					[ ],
				),
				drawer: SideMenu(activePageId: 0),
				body: 
				widget.globals.nfd == null || widget.globals.nfd.newsWidgets == null || widget.globals.nfd.newsWidgets.length < 1 ? 
				SmartRefresher(
					enablePullDown: true,
					header: ClassicHeader(),
					controller: _refreshController,
					onRefresh: _onRefresh,
					child: ListView.builder(
						itemCount: 1,
						itemBuilder: (BuildContext ctxt, int index) 
						{
							return Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>
								[
									Padding(
										padding: EdgeInsets.all(8),
										child: Text("No news feed data loaded!")
									)
								],
							);
						}
					)
				)
				: SmartRefresher(
					enablePullDown: true,
					header: ClassicHeader(),
					controller: _refreshController,
					onRefresh: _onRefresh,
					child: ListView.builder(
						itemCount: widget.globals.nfd != null && widget.globals.nfd.newsWidgets != null ? widget.globals.nfd.newsWidgets.length : 0,
						itemBuilder: (BuildContext ctxt, int index) 
						{
							return widget.globals.nfd.newsWidgets.values.elementAt(index);
						}
					),
				)
			)
		);
	}

	void _onRefresh()
	{
		if (DateTime.now().millisecondsSinceEpoch - widget.globals.lastReload > ((1000 * 60) * 5)) /// 5 minutes delay for refreshing again
		{
			once = true;
			loadingProgress = 0;
			widget.globals.lastReload = DateTime.now().millisecondsSinceEpoch;
			widget.globals.nfd = NewsFeedData();
			progressChecker = Timer.periodic(Duration(milliseconds: 500), (Timer t)
			{
				if (once && widget.globals.nfd != null)
				{
					AssetsManagement.precacheImages(context);
					widget.globals.nfd.loadData(widget.globals);

					once = false;
				}

				setState(() { });

				if (loadingProgress == 1)
				{
					_refreshController.refreshCompleted();
					t.cancel();
				}
			});
		}
		else
			_refreshController.refreshCompleted();
	}
}