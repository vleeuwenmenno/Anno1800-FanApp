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