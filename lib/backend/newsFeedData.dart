
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
	int itemsExpected = 1;

	void loadData() async
	{
		finished = false;
		itemsLoaded = 0;
		itemsExpected = 1;

		/// Load data from RSS Feed
		Client client = new Client();
		Response response = await client.get("https://www.anno-union.com/en/category/devblog-en/feed");
		RssFeed channel = new RssFeed.parse(response.body);
		
		itemsExpected = channel.items.length;
		
		/// Empty the list and init it
		newsWidgets = Map<String, News>();

		/// Loop all items and parse into News widgets
		var futures = <Future>[];
		for (var index = 0; index < channel.items.length; index++) 
		{
			RssItem i = channel.items[index];
			var name = new String.fromCharCode(65 + index);
			var thread = new Future(() async 
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

				Response r =  await Client().get("${i.link}");
				RegExp exp = RegExp(r'<div class="featured-image">(.*)src\s*=\s*"(.+?)"(.*)<\/div>');
				Iterable<Match> matches = exp.allMatches(r.body);

				newsWidgets[guid].img = matches.elementAt(0).group(2);

				itemsLoaded++;
			});

			futures.add(thread);
		}

		await Future.wait(futures);
		finished = true;
	}
}