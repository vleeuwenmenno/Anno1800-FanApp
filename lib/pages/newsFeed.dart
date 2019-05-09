import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:anno1800_fanapp/pages/globals.dart' as globals;

class NewsFeed extends StatefulWidget 
{
  
  @override
  _NewsFeedState createState() => _NewsFeedState();

}

class _NewsFeedState extends State<NewsFeed> 
{
	Widget build(BuildContext context)
	{
		var client = new http.Client();
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		client.get("https://www.anno-union.com/en/category/devblog-en/feed").then((response) {
    	return response.body;
		}).then((bodyString) {
			var channel = new RssFeed.parse(bodyString);
			print(channel);
			return channel;
		});
		return Scaffold(
			appBar: AppBar(
				title: Text('Anno 1800 - News'),
				actions: <Widget>
				[
					IconButton(
						onPressed: () 
						{
							print('object');
						},
						icon: Icon(
							Icons.search, color: Color(0xffFFE4AD)
						)
					)
				],
			),
			// drawer: globals.sideMenu,
			drawer: SideMenu(activePageId: 0),
			// body: ListView.builder(),
			// body: Container(
			// 	child: Text('data'),
			// ),
		);
	}
}