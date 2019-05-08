import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget
{
	@override
	SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> with SingleTickerProviderStateMixin
{
	Widget build(BuildContext context)
	{
		return Drawer(
			child: ListView(
			// Important: Remove any padding from the ListView.
				padding: EdgeInsets.zero,
				children: <Widget>
				[
					DrawerHeader(
						child: Text('Anno 1800 Fan App'),
						decoration: BoxDecoration(
							color: Colors.blue,
						),
					),

					ListTile(
						title: Text('News'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
						title: Text('Population needs'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
						title: Text('Goods'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
						title: Text('Inter-dependencies'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
						title: Text('Production-layouts'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
						title: Text('City-layouts'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
						title: Text('Donate'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
						title: Text('About'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),
				],
			),
      	);
	}
}