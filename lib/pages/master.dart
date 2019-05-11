import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/pages/newsFeed.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class Master extends StatefulWidget 
{
	@override
	_MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> 
{
	@override
	Widget build(BuildContext context) 
	{
		return Scaffold(
			appBar: AppBar(
				title: Text('title')
			),
			body: NewsFeed(),
			drawer: SideMenu()
		);
	}
}