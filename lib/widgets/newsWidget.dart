import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webfeed/domain/rss_category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class News extends StatefulWidget
{	
	final String title;
	final String desc;
	final String link;

	final Globals globals;

	String get img => _img;

	set img(String i)
	{
		_img = i;

		if (onImageUpdated != null)
			onImageUpdated();
	}

	String _img;

	final String content;
	final List<String> images;

	VoidCallback onImageUpdated;

	String get commentRssFeed
	{ 
		return "${link}feed";
	}

	final DateTime publishDateTime;
	final List<RssCategory> categories;

	News(
		{
			this.title,
			this.desc,
			this.link,

			@required
			this.globals,

			this.content,
			this.images,
			
			this.publishDateTime,
			this.categories
		}
	);

	@override
	NewsState createState() => NewsState();
}

class NewsState extends State<News>
{
	@override
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		return GestureDetector(
			onTap: ()
			{
				Navigator.pushNamed(context, "/drawer/news/details", arguments: { "globals": widget.globals, "newsItem": widget });
			},
			child: Padding(
				padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
				child: ListTile(

					title: Text(
						widget.title,
						maxLines: 2,
						overflow: TextOverflow.ellipsis,
					),

					subtitle: Column(
						mainAxisAlignment: MainAxisAlignment.start,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>
						[
							Text(
								"${widget.desc}",
								maxLines: 2,
								overflow: TextOverflow.ellipsis,
							),

							Text(
								"Published ${timeago.format(widget.publishDateTime)}",
								maxLines: 1,
								overflow: TextOverflow.ellipsis,
							)
						],
					),

					isThreeLine: true,

					trailing: 
					/* if */ widget.img != null && widget.img.isNotEmpty ? //then
						CachedNetworkImage(
							width: ScreenUtil().setWidth(320),
							imageUrl: widget.img,
							placeholder: (context, url) => CircularProgressIndicator(),
							errorWidget: (context, url, error) => Icon(Icons.error),
						)
					: //else
						Container(
							child: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>
								[
									CircularProgressIndicator()
								]
							),
							width: ScreenUtil().setWidth(320)
						)
					//endif
				),
			),
		);
	}
}