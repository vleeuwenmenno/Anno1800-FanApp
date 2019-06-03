import 'package:anno1800_fanapp/widgets/resultIndicator.dart';
import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:anno1800_fanapp/backend/populationCalculator.dart';

class BuildingInfo extends StatefulWidget 
{
  	Globals globals;
	String selectedBuilding;
  
  @override
  _BuildingInfoState createState() => _BuildingInfoState();

}

class _BuildingInfoState extends State<BuildingInfo> with SingleTickerProviderStateMixin
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];
		widget.selectedBuilding = (ModalRoute.of(context).settings.arguments as Map)["selectedBuilding"];

		List<Widget> costs = List<Widget>();
		List<Widget> additional = List<Widget>();

		for (int i = 0; i < PopulationCalculator().buildings[widget.selectedBuilding].length; i++) 
		{
			String info = PopulationCalculator().buildings[widget.selectedBuilding].keys.elementAt(i);

			if (info == "costs")
			{
				PopulationCalculator().buildings[widget.selectedBuilding][info].forEach((key, value)
				{
					String path = "resources";
					costs.add(widget.globals.createChipWithValue(key == "credits" ? "icons" : path, key, value, context, widget.globals));
				});
			}
			else if (info == "upkeep")
			{
				costs.add(widget.globals.createChipWithValue("icons/other", "Balance", PopulationCalculator().buildings[widget.selectedBuilding][info], context, widget.globals));
			}
		}
		
		additional.add(Padding(padding: EdgeInsets.all(8)));
		for (int i = 0; i < PopulationCalculator().buildings[widget.selectedBuilding].length; i++) 
		{
			String k = PopulationCalculator().buildings[widget.selectedBuilding].keys.elementAt(i);
			dynamic v = PopulationCalculator().buildings[widget.selectedBuilding].values.elementAt(i);

			if (k == "size")
			{
				additional.add(
					ResultIndicator(
						style: ResultIndicatorStyle.WithoutCount,
						width: (MediaQuery.of(context).size.width / 100) * 85,
						count: 23,
						text: "Size",
						icon: "${v.width.toStringAsFixed(0)}x${v.height.toStringAsFixed(0)}",
						secondaryIcon: AssetImage("assets/icons/Tile.png"),
					)
				);
				additional.add(Padding(padding: EdgeInsets.all(8)));
			}
			else if (k == "requirement")
			{
				RegExp exp = new RegExp(r"\i\m\a\g\e\:\[(.*)\].*");
				Iterable<Match> matches = exp.allMatches(v);
				String icon = "";

				if (matches.length > 0)
				{
					icon =  matches.first.group(1);
				}

				additional.add(
					ResultIndicator(
						style: ResultIndicatorStyle.WithoutCount,
						width: (MediaQuery.of(context).size.width / 100) * 85,
						count: 23,
						text: "Requires",
						icon: "${v.replaceAll("image:[" + icon + "]", "")}",
						secondaryIcon: icon != "" ? AssetImage(icon) : null,
					)
				);
				additional.add(Padding(padding: EdgeInsets.all(8)));
			}
			else if (k == "range")
			{
				additional.add(
					ResultIndicator(
						style: ResultIndicatorStyle.WithoutCount,
						width: (MediaQuery.of(context).size.width / 100) * 85,
						count: 23,
						text: "Range",
						icon: "$v",
					)
				);
				additional.add(Padding(padding: EdgeInsets.all(8)));
			}
			else if (k == "influence")
			{
				additional.add(
					ResultIndicator(
						style: ResultIndicatorStyle.WithoutCount,
						width: (MediaQuery.of(context).size.width / 100) * 85,
						count: 23,
						text: "Influence",
						icon: "$v",
						secondaryIcon: AssetImage("assets/icons/other/Influence.png"),
					)
				);
				additional.add(Padding(padding: EdgeInsets.all(8)));
			}
			else if (k == "attractiveness")
			{
				additional.add(
					ResultIndicator(
						style: ResultIndicatorStyle.WithoutCount,
						width: (MediaQuery.of(context).size.width / 100) * 85,
						count: 23,
						text: "Attractiveness",
						icon: "$v",
						secondaryIcon: AssetImage("assets/icons/other/Attractiveness.png"),
					)
				);
				additional.add(Padding(padding: EdgeInsets.all(8)));
			}
			else if (k == "workforce")
			{
				v.forEach((key, value)
				{
					additional.add(
						ResultIndicator(
							style: ResultIndicatorStyle.WithoutCount,
							width: (MediaQuery.of(context).size.width / 100) * 85,
							text: "Active workforce",
							secondaryIcon: AssetImage("assets/tiers/$key.png"),
							icon: "$value",
							onPressed: ()
							{	
								Navigator.pushNamed(context, '/goods/goodsInfo', arguments: { "globals": widget.globals, "selectedGoods": "$k"});	
							},
						)
					);
					additional.add(Padding(padding: EdgeInsets.all(8)));
				});
			}
			else if (k == "unlockCondition")
			{
				additional.add(
					ResultIndicator(
						style: ResultIndicatorStyle.WithoutCount,
						width: (MediaQuery.of(context).size.width / 100) * 85,
						count: 23,
						text: "Unlock condition",
						icon: "${v['desc']}",
						secondaryIcon: AssetImage("assets/${v['img']}.png"),
					)
				);
				additional.add(Padding(padding: EdgeInsets.all(8)));
			}
			else if (k == "module")
			{
				v.forEach((kk, vv)
				{
					if (kk == "count")
					{
						additional.add(
							ResultIndicator(
								style: ResultIndicatorStyle.WithoutCount,
								width: (MediaQuery.of(context).size.width / 100) * 85,
								count: 23,
								text: "Modules",
								icon: "$vv (${v['size'].width.toStringAsFixed(0)}x${v['size'].height.toStringAsFixed(0)})",
								secondaryIcon: AssetImage("assets/icons/Tile.png")
							)
						);
						additional.add(Padding(padding: EdgeInsets.all(8)));
					}
					else if (kk == "cost")
					{
						additional.add(
							ResultIndicator(
								style: ResultIndicatorStyle.WithoutCount,
								width: (MediaQuery.of(context).size.width / 100) * 85,
								count: 23,
								text: "Cost per module",
								icon: "$vv",
								secondaryIcon: AssetImage("assets/icons/credits.png"),
							)
						);
						additional.add(Padding(padding: EdgeInsets.all(8)));
					}
				});
			}
		}

		String imgKey = widget.selectedBuilding;
		if (imgKey.contains("Residence"))
			imgKey = "Residence";

		return Scaffold(
				appBar: AppBar(
					title: Text('${PopulationCalculator().buildings[widget.selectedBuilding]["name"]}'),
					elevation: 0,
					actions: <Widget>
					[
						// Production chain button
						IconButton(
							onPressed: ()
							{
								// Route to Production chain
							},
							icon: Image.asset('assets/buildings/Trade_Union.png', height: 24.0,),
						)
					],
				),
				drawer: SideMenu(activePageId: 2),
				body: SingleChildScrollView(
					child: Padding(
						padding: const EdgeInsets.all(16.0),
						child: Column(
							children: <Widget>[
								Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>
									[
										Row(
											children: <Widget>
											[
												Text('Building information',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
											],
										),

										Divider(color: Color(0xff714F28)),

										Row(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>
											[
												Image(
													height: 128,
													width: 128,
													image: AssetImage("assets/buildings/$imgKey.png"),
												),

												Flexible(
													child: Padding(
														padding: const EdgeInsets.all(8.0),
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: <Widget>
															[
																RichText(
																	textAlign: TextAlign.left,
																	text: TextSpan(
																		text: '${PopulationCalculator().buildings[widget.selectedBuilding]["desc"]}',
																		style: TextStyle(
																			fontFamily: 'Angsana New',
																			fontSize: 14.0,
																			color: Colors.black.withOpacity(0.6),
																			fontWeight: FontWeight.bold
																		)
																	),
																)
															],
														),
													),
												),
											],
										),
										
										Padding(padding: EdgeInsets.all(16)),

										Row(
											children: <Widget>
											[
												Text('Costs',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
											],
										),

										Row(
											children: <Widget>
											[
												Text('Required resources for acquiring the building',  style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5), height: 1.4)),
											],
										),

										Divider(color: Color(0xff714F28)),

										Wrap(
											children: costs,
										),

										Padding(padding: EdgeInsets.all(16)),

										Row(
											children: <Widget>
											[
												Text('Additional information',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
											],
										),

										Divider(color: Color(0xff714F28)),
									],
								),

								Column(
									mainAxisAlignment: MainAxisAlignment.center,
									crossAxisAlignment: CrossAxisAlignment.center,
									children: additional
								)
							],
						),
					),
				)

		);
	}	
}