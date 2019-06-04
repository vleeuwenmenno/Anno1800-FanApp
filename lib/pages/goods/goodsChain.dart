import 'package:anno1800_fanapp/widgets/resultIndicator.dart';
import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:anno1800_fanapp/backend/populationCalculator.dart';

class GoodsChain extends StatefulWidget 
{
  	Globals globals;
	String selectedGoods;
  
  @override
  _GoodsChainState createState() => _GoodsChainState();

}

class _GoodsChainState extends State<GoodsChain> with SingleTickerProviderStateMixin
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];
		widget.selectedGoods = (ModalRoute.of(context).settings.arguments as Map)["selectedGoods"];

		List<Widget> costs = List<Widget>();
		List<Widget> chain = List<Widget>();

		List deps = [];
		Map combined = PopulationCalculator().goods[widget.selectedGoods];

		deps.add([]);
		deps.add([]);
		deps.add([]);
		deps.add([]);
		deps.add([]);

		combined['name'] = widget.selectedGoods;

		/// Add initial item
		deps[0].add(combined);
		
		if (combined.containsKey("depends"))
			combined["depends"].forEach((k, v)
			{
				if (k == "Coal")
					k = "Coal_Kiln";

				Map good = PopulationCalculator().goods[k];
				good['name'] = k;

				if (good.containsKey("depends"))
					good["depends"].forEach((kk, vv)
					{
						if (kk == "Coal")
							kk = "Coal_Kiln";

						Map good2 = PopulationCalculator().goods[kk];
						good2['name'] = kk;

						if (good2.containsKey("depends"))
							good2["depends"].forEach((kkk, vvv)
							{
								if (kkk == "Coal")
									kkk = "Coal_Kiln";

								Map good3 = PopulationCalculator().goods[kkk];
								good3['name'] = kkk;

								if (good3.containsKey("depends"))
									good3["depends"].forEach((kkkk, vvvv)
									{
										if (kkkk == "Coal")
											kkkk = "Coal_Kiln";

										Map good4 = PopulationCalculator().goods[kkkk];
										good4['name'] = kkkk;

										deps[4].add(good4);
									});

								deps[3].add(good3);
							});

						deps[2].add(good2);
					});

				deps[1].add(good);
			});

		

		deps = deps.reversed.toList();

		///We need to write a method that resolves the costs for each dependency but also for the dependencies of the dependencies until none are left.
		for (var v in deps)
		{
			List<Widget> images = [];
			for (Map m in v)
			{
				if (m['building'].containsKey("requirement") && m['building']['requirement'].startsWith("Electricity"))
				{
					images.add(
						Stack(
							children: <Widget>
							[
								Padding(
									padding: EdgeInsets.all(8),
									child: Image(
										width: 64,
										height: 64,
										image: AssetImage("assets/resources/${m['name']}.png"),
									)
								),

								Text(
									"${m['output']}"
								),
								Padding(
									padding: EdgeInsets.only(left: 6),
									child: Image(
										width: 16,
										height: 16,
										image: AssetImage("assets/icons/Electricity.png"),
									)
								),
							],
						)
					);
				}
				else
					images.add(
						Stack(
							children: <Widget>
							[
								Padding(
									padding: EdgeInsets.all(8),
									child: Image(
										width: 64,
										height: 64,
										image: AssetImage("assets/resources/${m['name']}.png"),
									)
								),

								Text(
									"${m['output']}"
								),
								Padding(
									padding: EdgeInsets.only(left: 6),
									child: Offstage()
								),
							],
						)
					);
			}

			chain.add(
				Column(
					mainAxisAlignment: MainAxisAlignment.spaceEvenly,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: images
				)
			);
		}

		for (int i = 0; i < combined.length; i++) 
		{
			String info = combined.keys.elementAt(i);

			if (info == "costs")
			{
				combined[info].forEach((key, value)
				{
					String path = "resources";
					costs.add(widget.globals.createChipWithValue(key == "credits" ? "icons" : path, key, value, context, widget.globals));
				});
			}
			else if (info == "workforce")
			{
				combined[info].forEach((key, value)
				{
					costs.add(widget.globals.createChipWithValue("icons/other", "Workforce_${key}s", value, context, widget.globals));
				});
			}
			else if (info == "upkeep")
			{
				costs.add(widget.globals.createChipWithValue("icons/other", "Balance", combined[info], context, widget.globals));
			}
		}

		return Scaffold(
			appBar: AppBar(
				title: Text('${widget.selectedGoods.replaceAll("_", " ")} chain'),
				elevation: 0,
				actions: <Widget>
				[ ],
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
											Text('Costs',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
										],
									),

									Row(
										children: <Widget>
										[
											Text('Required resources for acquiring the full chain for ${widget.selectedGoods.replaceAll("_", " ").toLowerCase()}',  style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5), height: 1.4)),
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
											Text('Production chain',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
										],
									),

									Row(
										children: <Widget>
										[
											Text('The full production chain to produce ${widget.selectedGoods.replaceAll("_", " ").toLowerCase()}',  style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5), height: 1.4)),
										],
									),

									Divider(color: Color(0xff714F28)),
								],
							),
					
							Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: chain,
							),
						],
					),
				),
			)
		);
	}	
}