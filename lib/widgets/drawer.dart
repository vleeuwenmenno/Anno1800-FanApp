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
	Widget build(BuildContext context)
	{
		return Drawer(
			child: ListView(
			// Important: Remove any padding from the ListView.
				padding: EdgeInsets.zero,
				children: <Widget>
				[
					DrawerHeader(
						child: Text('Anno 1800 Fan App',
            				style: TextStyle(
								fontSize: 20, 
								color: Color(0xffFFE4AD)
							),
						),
						decoration: BoxDecoration(
							color: Color(0xff714F28),
						),
					),

					Container(
						color: widget.activePageId == 0 ? Color(0xff714F28).withOpacity(0.1) : Colors.transparent,
						child: ListTile(
							leading: Image.asset('assets/icons/Letter.png'),
							title: Text('News'),
							onTap: () 
							{
								Navigator.pop(context);
							},
						),
					),

					Container(
						color: widget.activePageId == 1 ? Color(0xff714F28).withOpacity(0.1) : Colors.transparent,
						child: ListTile(
							leading: Image.asset('assets/icons/investor.png'),
							title: Text('Population needs'),
							onTap: () 
							{	
								Navigator.pop(context);
							},
						),
					),

					ListTile(
            			leading: Image.asset('assets/icons/Warehouse.png'),
						title: Text('Goods'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
            			leading: Image.asset('assets/icons/Depot.png'),
						title: Text('Inter-dependencies'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
           				leading: Image.asset('assets/icons/Tile.png'),
						title: Text('Production-layouts'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
           				leading: Image.asset('assets/icons/Residence.png'),
						title: Text('City-layouts'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
            			leading: Image.asset('assets/icons/Beer.png'),
						title: Text('Donate'),
						onTap: () 
						{
							Navigator.pop(context);
						},
					),

					ListTile(
            			leading: Image.asset('assets/icons/Warehouse.png'),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}