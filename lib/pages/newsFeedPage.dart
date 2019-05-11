import 'dart:io';

import 'package:anno1800_fanapp/widgets/newsWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFeedPage extends StatefulWidget 
{
	News news;

	@override
	_NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> 
{
	launchURL(String url) async 
	{
		if (await canLaunch(url)) 
		{
			await launch(url);
		} 
		else 
		{
			throw 'Could not launch $url';
		}
	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.news = (ModalRoute.of(context).settings.arguments as Map)["newsItem"];

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
			body: SingleChildScrollView(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>
					[
						Padding(
							padding: EdgeInsets.all(12),
							child: RichText(
								text: TextSpan(
									style: TextStyle(
										color: Color(0xff714F28),
										fontSize: ScreenUtil(allowFontScaling: true).setSp(62)
									),
									text: widget.news.title
								),
							)
						),

						CachedNetworkImage(
							width: MediaQuery.of(context).size.width,
							imageUrl: widget.news.img,
							placeholder: (context, url) => CircularProgressIndicator(),
							errorWidget: (context, url, error) => Icon(Icons.error),
						),

						Padding(
							padding: EdgeInsets.all(12),
							child: Html(
								data: widget.news.content,
								//Optional parameters:
								padding: EdgeInsets.all(8.0),
								backgroundColor: Color(0xffFFE4AD),
								defaultTextStyle: TextStyle(
									fontFamily: 'Angsana New'
								),
								linkStyle: const TextStyle(
									color: Colors.redAccent,
								),
								onLinkTap: (url) 
								{
									launchURL(url);
								}
							)
						),
					]
				)
			)
		);
	}
}