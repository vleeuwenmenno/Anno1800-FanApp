import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget
{
	final int activePageId;
	SideMenu({
		this.activePageId
	});

	@override
	SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> with AutomaticKeepAliveClientMixin
{
	Map<String, String> items;
	List<Widget> itemWidgets;

	Widget build(BuildContext context)
	{
		items = Map<String, String>();
		itemWidgets = [];
		
		items = 
		{
			"News": "assets/Letter.png",
			"Population needs": "assets/tiers/investor.png",
			"Goods": "assets/buildings/Warehouse.png",
			"Inter-dependencies": "assets/buildings/Depot.png",
			"Production-layouts": "assets/icons/Tile.png",
			"City-layouts": "assets/buildings/Residence.png",
			"Donate": "assets/resources/Beer.png",
			"About": "assets/buildings/Warehouse.png"
		};

		itemWidgets.add(DrawerHeader(
			child: Text('Anno 1800 Fan App',
				style: TextStyle(
					fontSize: 20, 
					color: Color(0xffFFE4AD)
				),
			),
			decoration: BoxDecoration(
				color: Color(0xff714F28),
			),
		));

		int i = 0;
		items.forEach((String key, String value)
		{
			Widget item =
				Container(
					color: widget.activePageId == i ? Color(0xff714F28).withOpacity(0.1) : Colors.transparent,
					child:Opacity(
						opacity: widget.activePageId == i ? 1.0 : 0.5,
						child:  ListTile(
							leading: Image.asset(value, width: 32),
							title: Text(key),
							onTap: () 
							{
								print("Going to /drawer/${key.trim().toLowerCase()}");
								Navigator.pushNamed(context, "/drawer/${key.trim().toLowerCase()}");
							},
						),
					)
				);

			i++;
			itemWidgets.add(item);
		});

		return Drawer(
			child: ListView(
			// Important: Remove any padding from the ListView.
				padding: EdgeInsets.zero,
				children: itemWidgets,
			),
      	);
	}

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}