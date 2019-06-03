
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/widgets/newsWidget.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:webfeed/webfeed.dart';

class NewsFeedData
{
	Map<String, News> newsWidgets;

	bool finished = false;

	int itemsLoaded = 0;
	int itemsExpected = 20;

	void loadData(Globals globals) async
	{
		finished = false;
		itemsLoaded = 0;
		itemsExpected = 20;

		/// Load data from RSS Feed
		Client client = new Client();
		Response response = await client.get("https://www.anno-union.com/en/category/annnouncement/feed");
		Response responseDev = await client.get("https://www.anno-union.com/en/category/devblog-en/feed");

		RssFeed channelDev = new RssFeed.parse(responseDev.body);
		RssFeed channel = new RssFeed.parse(response.body);

		itemsExpected = channel.items.length + channelDev.items.length;

		/// make sure its clean before we add new data
		newsWidgets = Map<String, News>();

		await _processData(channel, globals);
		await _processData(channelDev, globals);
	
		finished = true;
	}

	Future<void> _processData(RssFeed channel, Globals globals) async
	{
		/// Loop all items and parse into News widgets
		var futures = <Future>[];
		for (var index = 0; index < channel.items.length; index++) 
		{
			RssItem i = channel.items[index];
			var thread = new Future(() async 
			{
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

				Response r =  await Client().get("${i.link}");
				RegExp exp = RegExp(r'<div class="featured-image">(.*)src\s*=\s*"(.+?)"(.*)<\/div>');
				Iterable<Match> matches = exp.allMatches(r.body);

				newsWidgets[guid].img = matches.elementAt(0).group(2);

				itemsLoaded++;
			});

			futures.add(thread);
		}

		await Future.wait(futures);
	}
}