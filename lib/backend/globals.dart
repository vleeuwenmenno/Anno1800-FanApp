import 'package:anno1800_fanapp/backend/populationCalculator.dart';
import 'package:flutter/material.dart';

import 'package:anno1800_fanapp/backend/assets.dart';
import 'package:anno1800_fanapp/backend/newsFeedData.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class Globals
{
	SideMenu sideMenu;
	NewsFeedData nfd;

	int selectedPage;
	int lastReload;
	bool oldWorld;

	Globals(
	{
		this.oldWorld = true,
		this.lastReload = 0,
		this.selectedPage = 0,
	})
	{
		this.sideMenu = new SideMenu();
		this.nfd = new NewsFeedData();
	}

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

		return Tooltip(
			padding: EdgeInsets.all(12),
			preferBelow: false,
			message: key.replaceAll("_", " "),
			child: GestureDetector(
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
			),
		);
	}
}