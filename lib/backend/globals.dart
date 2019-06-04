import 'package:anno1800_fanapp/backend/populationCalculator.dart';
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
				if (PopulationCalculator().goods.containsKey(key))
					Navigator.pushNamed(context, '/goods/goodsInfo', arguments: { "globals": globals, "selectedGoods": "$key"});
				else if (PopulationCalculator().buildings.containsKey(key))
					Navigator.pushNamed(context, '/buildings/buildingInfo', arguments: { "globals": globals, "selectedBuilding": "$key"});				
			},
		);
	}

	Widget createChipWithValue(String path, String key, dynamic val, BuildContext context, Globals globals) 
	{
		String icon = key;
		if (icon.endsWith("_"))
			icon = icon.substring(0, icon.length-1);

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
						image: AssetImage("assets/$path/$icon.png"),
						width: 20,
					),
				)
			),
			onTap: ()
			{
				if (PopulationCalculator().goods.containsKey(key))
					Navigator.pushNamed(context, '/goods/goodsInfo', arguments: { "globals": globals, "selectedGoods": "$key"});
				else if (PopulationCalculator().buildings.containsKey(key))
					Navigator.pushNamed(context, '/buildings/buildingInfo', arguments: { "globals": globals, "selectedBuilding": "$key"});
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