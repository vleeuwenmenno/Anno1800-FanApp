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

		for (int i = 0; i < PopulationCalculator().goods[widget.selectedGoods].length; i++) 
		{
			String info = PopulationCalculator().goods[widget.selectedGoods].keys.elementAt(i);

			if (info == "costs")
			{
				PopulationCalculator().goods[widget.selectedGoods][info].forEach((key, value)
				{
					String path = "resources";
					costs.add(createChip(key == "credits" ? "icons" : path, key, value, context));
				});
			}
			else if (info == "workforce")
			{
				PopulationCalculator().goods[widget.selectedGoods][info].forEach((key, value)
				{
					costs.add(createChip("icons/other", "Workforce_${key}s", value, context));
				});
			}
			else if (info == "upkeep")
			{
				costs.add(createChip("icons/other", "Balance", PopulationCalculator().goods[widget.selectedGoods][info], context));
			}
		}

		return Scaffold(
				appBar: AppBar(
					title: Text('${PopulationCalculator().goods[widget.selectedGoods]["building"]["name"]}'),
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
										Text('Required resources for acquiring the goods',  style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5), height: 1.4)),
									],
								),

								Divider(color: Color(0xff714F28)),

								Wrap(
									children: costs,
								),

								Row(
									children: <Widget>
									[
										Text('Additional information',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
									],
								),

								Divider(color: Color(0xff714F28)),
							],
						),
					),
				)

		);
	}	

	Widget createChip(String path, String key, dynamic val, BuildContext context) 
	{
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
						image: AssetImage("assets/$path/$key.png"),
						width: 20,
					),
				)
			),
			onTap: ()
			{
				Navigator.pushNamed(context, "/goods", arguments: { "item": key });
			},
		);
	}

}