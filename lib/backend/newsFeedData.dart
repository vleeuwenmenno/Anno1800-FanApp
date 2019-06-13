
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

	void loadData(Globals globals) async
	{
		finished = false;
		itemsLoaded = 0;
		itemsExpected = 10;

		/// Load data from RSS Feed
		Client client = new Client();
		Response response = await client.get("https://www.anno-union.com/en/feed");

		RssFeed channel;
		
		try
		{
			channel = new RssFeed.parse(response.body);

			itemsExpected = channel.items.length;
			
			/// Make sure its clean before we add new data
			newsWidgets = Map<String, News>();
			await _processData(channel, globals);
		}
		catch (e) 
		{
			print(e); 
		}
	
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

				try
				{
					newsWidgets[guid].img = matches.elementAt(0).group(2);
				}
				catch (e)
				{ }

				itemsLoaded++;
			});

			futures.add(thread);
		}

		await Future.wait(futures);
	}
}