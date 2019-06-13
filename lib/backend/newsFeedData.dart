
import 'dart:convert';

import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/widgets/newsWidget.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:webfeed/webfeed.dart';

class NewsFeedData
{
	Map<String, News> newsWidgets;

	bool finished;

	int itemsLoaded;
	int itemsExpected;

	NewsFeedData({
		this.finished = false,
		this.itemsExpected = 10,
		this.itemsLoaded = 0
	})
	{
		newsWidgets = new Map<String, News>();
	}

	void loadData(Globals globals)
	{
		finished = false;
		itemsLoaded = 0;
		itemsExpected = 10;

		/// Load data from RSS Feed
		Client().get("https://www.anno-union.com/en/feed").then((r)
		{
			RssFeed channel = RssFeed.parse(r.body);

			if (channel != null)
			{
				itemsExpected = channel.items.length;
				_processData(channel, globals);
				
				finished = true;
			}
			else
				finished = true;
		});
	}

	void _processData(RssFeed channel, Globals globals)
	{
		/// Loop all items and parse into News widgets
		for (var index = 0; index < channel.items.length; index++) 
		{
			RssItem i = channel.items[index];
			News n = News(
				title: i.title,
				desc: i.description,
				categories: i.categories,
				content: i.content.value,
				images: i.content.images,
				link: i.link,
				publishDateTime: DateFormat("E, dd MMM yyyy HH:mm:ss Z").parse(i.pubDate),
				globals: globals
			);

			var guid = new Uuid().v4();
			newsWidgets[guid] = n;

			Client().get("${i.link}").then((r)
			{
				RegExp exp = RegExp(r'<div class="featured-image">(.*)src\s*=\s*"(.+?)"(.*)<\/div>');
				Iterable<Match> matches = exp.allMatches(r.body);

				newsWidgets[guid].img = matches.elementAt(0).group(2);

				itemsLoaded++;
			});
		}
	}
}