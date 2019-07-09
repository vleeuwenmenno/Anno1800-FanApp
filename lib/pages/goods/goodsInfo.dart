import 'package:anno1800_fanapp/localize.dart';
import 'package:anno1800_fanapp/widgets/resultIndicator.dart';
import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:anno1800_fanapp/backend/populationCalculator.dart';

class GoodsInfo extends StatefulWidget 
{
  	Globals globals;
	String selectedGoods;
  
  @override
  _GoodsInfoState createState() => _GoodsInfoState();

}

class _GoodsInfoState extends State<GoodsInfo> with SingleTickerProviderStateMixin
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];
		widget.selectedGoods = (ModalRoute.of(context).settings.arguments as Map)["selectedGoods"];

		List<Widget> costs = List<Widget>();
		List<Widget> additional = List<Widget>();

		for (int i = 0; i < PopulationCalculator().goods[widget.selectedGoods].length; i++) 
		{
			String info = PopulationCalculator().goods[widget.selectedGoods].keys.elementAt(i);

			if (info == "costs")
			{
				PopulationCalculator().goods[widget.selectedGoods][info].forEach((key, value)
				{
					String path = "resources";
					costs.add(widget.globals.createChipWithValue(key == "credits" ? "icons" : path, key, value, context, widget.globals));
				});
			}
			else if (info == "workforce")
			{
				PopulationCalculator().goods[widget.selectedGoods][info].forEach((key, value)
				{
					costs.add(widget.globals.createChipWithValue("icons/other", "Workforce_${key}s", value, context, widget.globals));
				});
			}
			else if (info == "upkeep")
			{
				costs.add(widget.globals.createChipWithValue("icons/other", "Balance", PopulationCalculator().goods[widget.selectedGoods][info], context, widget.globals));
			}
		}

		for (int i = 0; i < PopulationCalculator().goods[widget.selectedGoods].length; i++) 
		{
			String key = PopulationCalculator().goods[widget.selectedGoods].keys.elementAt(i);
			dynamic value = PopulationCalculator().goods[widget.selectedGoods].values.elementAt(i);

			if (key != "costs" && key != "upkeep" && key != "workforce" && key != "newWorld")
			{
				if (key == "depends")
				{
					value.forEach((k, v)
					{
						if (k == "Coal")
							k = "Coal_Kiln";
							
						String icon = k;

						if (icon.endsWith("_"))
							icon = icon.substring(0, icon.length-1);
				
						additional.add(
							ResultIndicator(
								style: ResultIndicatorStyle.WithoutCount,
								width: (MediaQuery.of(context).size.width / 100) * 85,
								text: "Input",
								secondaryIcon: AssetImage("assets/resources/$icon.png"),
								icon: "${v}x",
								onPressed: ()
								{	
									Navigator.pushNamed(context, '/goods/goodsInfo', arguments: { "globals": widget.globals, "selectedGoods": "$k"});	
								},
							)
						);
						additional.add(Padding(padding: EdgeInsets.all(8)));
					});
				}
				else if (key == "output")
				{
					String icon = widget.selectedGoods;

					if (icon.endsWith("_"))
						icon = icon.substring(0, icon.length-1);
				
					additional.add(
						ResultIndicator(
							style: ResultIndicatorStyle.WithoutCount,
							width: (MediaQuery.of(context).size.width / 100) * 85,
							text: "Produces",
							icon: "${value}x",
							secondaryIcon: AssetImage("assets/resources/$icon.png"),
						)
					);
					additional.add(Padding(padding: EdgeInsets.all(8)));
				}
				else if (key == "building")
				{
					value.forEach((k, v)
					{
						if (k == "requirement")
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
						else if (k == "size")
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
					});
				}
				else if (key == "attractiveness")
				{
					additional.add(
						ResultIndicator(
							style: ResultIndicatorStyle.WithoutCount,
							width: (MediaQuery.of(context).size.width / 100) * 85,
							text: "${key.substring(0, 1).toUpperCase()}${key.substring(1)}",
							icon: "$value",
							secondaryIcon: AssetImage("assets/icons/other/Attractiveness.png"),
						)
					);
					additional.add(Padding(padding: EdgeInsets.all(8)));
				}
				else
				{
					additional.add(
						ResultIndicator(
							style: ResultIndicatorStyle.WithoutCount,
							width: (MediaQuery.of(context).size.width / 100) * 85,
							text: "${key.substring(0, 1).toUpperCase()}${key.substring(1)}",
							icon: "${value}x",
							secondaryIcon: AssetImage("assets/resources/${widget.selectedGoods}.png"),
						)
					);
					additional.add(Padding(padding: EdgeInsets.all(8)));
				}
			}
		}

		bool showSwap = false;

		if (widget.selectedGoods.endsWith("_") && PopulationCalculator().goods.keys.contains(widget.selectedGoods.substring(0, widget.selectedGoods.length-1)))
			showSwap = true;
		else if (PopulationCalculator().goods.keys.contains("${widget.selectedGoods}_"))
			showSwap = true;

		return Scaffold(
				appBar: AppBar(
					title: Text('${PopulationCalculator().goods[widget.selectedGoods]["building"]["name"]} ${widget.selectedGoods.endsWith("_") ? "(New world)" : ""}'),
					elevation: 0,
					actions: <Widget>
					[
						// Swap button
						showSwap ?
						IconButton(
							onPressed: () 
							{
								if (widget.selectedGoods.endsWith("_"))
								{
									setState(() {
										widget.globals.oldWorld = true; 
									});
									widget.selectedGoods = widget.selectedGoods.substring(0, widget.selectedGoods.length-1);
									Navigator.pushReplacementNamed(context, '/goods/goodsInfo', arguments: { "globals": widget.globals, "selectedGoods": widget.selectedGoods});		
								}
								else
								{
									setState(() {
										widget.globals.oldWorld = false; 
									});
									widget.selectedGoods = "${widget.selectedGoods}_";
									Navigator.pushReplacementNamed(context, '/goods/goodsInfo', arguments: { "globals": widget.globals, "selectedGoods": widget.selectedGoods});
								}
							},
							icon: Icon(Icons.swap_vert),
						) : Offstage(),

						// Production chain button
						IconButton(
							onPressed: ()
							{
								Navigator.pushNamed(context, '/goods/goodsChain', arguments: { "globals": widget.globals, "selectedGoods": widget.selectedGoods});
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
							children: <Widget>
							[
								Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>
									[
										Row(
											children: <Widget>
											[
												Text(Localize.of(context).trans("goodsInfo.title"),  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
											],
										),

										Row(
											children: <Widget>
											[
												Text(Localize.of(context).trans("goodsInfo.desc"),  style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5), height: 1.4)),
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
												Text(Localize.of(context).trans("goodsInfo.additional"),  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
											],
										),

										Divider(color: Color(0xff714F28)),
										Padding(padding: EdgeInsets.all(4)),
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