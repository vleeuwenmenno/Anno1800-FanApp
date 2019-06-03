import 'package:flutter/material.dart';

import 'package:anno1800_fanapp/backend/assets.dart';
import 'package:anno1800_fanapp/backend/newsFeedData.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class Globals
{
	AssetsManagement am;
	SideMenu sideMenu = SideMenu();
	NewsFeedData nfd = NewsFeedData();

	int selectedPage = 0;
	int lastReload = 0;
	
	bool oldWorld = true;

	
	Widget createChip(String path, String key, BuildContext context, Globals globals) 
	{
		return GestureDetector(
			behavior: HitTestBehavior.opaque,
			child: Padding(
				padding: EdgeInsets.only(right: 8),
				child: Chip(
					backgroundColor: Color(0x80714F28),
					label: RichText(
						text: TextSpan(
							text: "${key.toString().replaceAll('_', ' ')}",
							style: TextStyle(
								color: Color(0xDEFFE4AD)
							)
						),
					),
					avatar: Image(
						image: AssetImage("assets/$path/$key.png"),
						width: 20,
					),
				)
			),
			onTap: ()
			{
				Navigator.pushNamed(context, '/goods/goodsInfo', arguments: { "globals": globals, "selectedGoods": "$key"});						
			},
		);
	}

	Widget createChipWithValue(String path, String key, dynamic val, BuildContext context, Globals globals) 
	{
		return GestureDetector(
			child: Padding(
				padding: EdgeInsets.only(right: 8),
				child: Chip(
					backgroundColor: Color(0x80714F28),
					label: RichText(
						text: TextSpan(
							text: "${val.toString().replaceAll('_', ' ')}",
							style: TextStyle(
								color: Color(0xDEFFE4AD)
							)
						),
					),
					avatar: Image(
						image: AssetImage("assets/$path/$key.png"),
						width: 20,
					),
				)
			),
			onTap: ()
			{
				Navigator.pushNamed(context, '/goods/goodsInfo', arguments: { "globals": globals, "selectedGoods": "$key"});		
			},
		);
	}

	void messageBox(BuildContext context, String message, String title, [VoidCallback onClosed]) 
	{
		// flutter defined function
		showDialog(
			context: context,
			builder: (BuildContext context) 
			{
				// return object of type Dialog
				return AlertDialog(
					title: Text(title),
					content: Text(message),
					actions: <Widget>
					[
						// usually buttons at the bottom of the dialog
						FlatButton(
							child: Text("Close"),
							onPressed: () 
							{
								if (onClosed != null)
									onClosed();

								Navigator.of(context).pop();
							},
						),
					],
				);
			},
		);
	}
}

class AssetManagement {
}