import 'dart:io';

import 'package:anno1800_fanapp/widgets/newsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:anno1800_fanapp/pages/globals.dart' as globals;
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class NewsFeed extends StatefulWidget 
{
  
  @override
  _NewsFeedState createState() => _NewsFeedState();

}

class _NewsFeedState extends State<NewsFeed> 
{
	Map<String, News> newsWidgets;

	void extractImage(String link, String guid)
	{
		Client().get("$link").then((response)
		{
			RegExp exp = RegExp(r'<div class="featured-image">(.*)src\s*=\s*"(.+?)"(.*)<\/div>');
			Iterable<Match> matches = exp.allMatches(response.body);

			newsWidgets[guid].img = matches.elementAt(0).group(2);
		});
		setState(() { });
	}

	void loadData() async
	{
		/// Load data from RSS Feed
		Client client = new Client();
		Response response = await client.get("https://www.anno-union.com/en/category/devblog-en/feed");
		RssFeed channel = new RssFeed.parse(response.body);
		
		/// Empty the list and init it
		newsWidgets = Map<String, News>();

		/// Loop all items and parse into News widgets
		for (RssItem i in channel.items)
		{
			News n = News(
				title: i.title,
				desc: i.description,
				categories: i.categories,
				content: i.content.value,
				images: i.content.images,
				link: i.link,
				publishDateTime: DateFormat("E, dd MMM yyyy HH:mm:ss Z").parse(i.pubDate)
			);

			var guid = new Uuid().v4();
			newsWidgets[guid] = n;
			extractImage(i.link, guid);
		}

		setState(() {});
	}

	@override
	void initState()
	{
		super.initState();
		loadData();
	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

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
			body: newsWidgets != null ?
			ListView.builder
			(
				itemCount: newsWidgets.length,
				itemBuilder: (BuildContext ctxt, int index) 
				{
					return newsWidgets.values.elementAt(index);
				}
			)
			:
			Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>
				[
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>
						[
							CircularProgressIndicator(),
							Padding(padding: EdgeInsets.all(8)),
							RichText(
								text: TextSpan(
									style: TextStyle(
										color: Color(0xff714F28)
									),
									text: "Loading RSS feed..."
								)
							)
						]
					)
				]
			)
		);
	}
}