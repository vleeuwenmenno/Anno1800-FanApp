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
		Map combined = PopulationCalculator().goods[widget.selectedGoods];

		combined.remove("depends");
		combined.remove("output");
		combined.remove("building");

		///We need to write a method that resolves the costs for each dependency but also for the dependencies of the dependencies until none are left.

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

									
								],
							),
						],
					),
				),
			)
		);
	}	
}