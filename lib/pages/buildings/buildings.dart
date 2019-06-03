import 'package:anno1800_fanapp/backend/populationCalculator.dart';
import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class Buildings extends StatefulWidget 
{
  Globals globals;
  
  @override
  _BuildingsState createState() => _BuildingsState();

}

class _BuildingsState extends State<Buildings> with SingleTickerProviderStateMixin
{
	Map oldWorldGoods = {};
	Map newWorldGoods = {};

	void initState() 
	{
		super.initState();
  	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];

		PopulationCalculator().buildings.forEach((key, value)
		{
			if (value.containsKey("newWorld"))
				newWorldGoods[key] = value;
			else
				oldWorldGoods[key] = value;
		});

		return WillPopScope(
			onWillPop: () async => false,
			child: Scaffold(
				appBar: AppBar(
					title: Text(widget.globals.oldWorld ? 'Old world buildings' : 'New world buildings'),
					elevation: 0,
					actions: <Widget>
					[
						// Swap button
						IconButton(
							onPressed: () 
							{
								setState(() {
									widget.globals.oldWorld = !widget.globals.oldWorld; 
								});
							},
							icon: Icon(Icons.swap_vert),
						),

						// Search button
						IconButton(
							onPressed: ()
							{
								print('Search button pressed || missing search function');
							},
							icon: Icon(Icons.search),
						)
					],
				),
				drawer: SideMenu(activePageId: 3),

				body: Container(
					padding: EdgeInsets.all(4),
					child: OrientationBuilder(
  						builder: (context, orientation) 
						{
							return GridView.builder(
								gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: orientation == Orientation.landscape ? 8 : 4),
								itemCount: widget.globals.oldWorld ? oldWorldGoods.keys.length : newWorldGoods.keys.length,
								itemBuilder: (BuildContext context, int index)
								{
									String key = widget.globals.oldWorld ? oldWorldGoods.keys.elementAt(index) : newWorldGoods.keys.elementAt(index);
									if (key.contains("Residence"))
										key = "Residence";

									return GestureDetector(
										child: Card(
											color: Color(0xff714F28).withOpacity(0.5),
											shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
											elevation: 0.0,
											child: Column(
												mainAxisAlignment: MainAxisAlignment.center,
												children: <Widget>
												[
													Image.asset('assets/buildings/$key.png', height: 42),
													Text('${widget.globals.oldWorld ? oldWorldGoods.keys.elementAt(index).toString().replaceAll("_", " ") : newWorldGoods.keys.elementAt(index).toString().replaceAll("_", " ")}', style: TextStyle(color: Color(0XFFFFE4AD).withOpacity(0.87)), textAlign: TextAlign.center),
												],
											),
										),
										onTap: ()
										{	
											Navigator.pushNamed(context, '/buildings/buildingInfo', arguments: { "globals": widget.globals, "selectedBuilding": "${widget.globals.oldWorld ? oldWorldGoods.keys.elementAt(index).toString() : newWorldGoods.keys.elementAt(index).toString()}"});
										},
									);
								},
							);
						}
					),
				),
			)
		);
	}	
}