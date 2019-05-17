import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/backend/populationCalculator.dart';
import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:anno1800_fanapp/widgets/resultIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class PopNCalcResults extends StatefulWidget 
{
	Globals globals;
	Map<String, int> tiers;
	bool newWorld;

	@override
	PopNCalcResultsState createState() => PopNCalcResultsState();
}

class PopNCalcResultsState extends State<PopNCalcResults> 
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];
		widget.tiers = (ModalRoute.of(context).settings.arguments as Map)["tiers"];
		widget.newWorld = (ModalRoute.of(context).settings.arguments as Map)["newWorld"];

		List<Widget> widgets = <Widget>
		[
			MenuEntryRow(
				mainText: "Result",
				subText: "Values in brackets is efficiency",
				type: MenuEntryRowType.Text
			),

			Padding(padding: EdgeInsets.all(8)),
		];

		widget.tiers.forEach((String key, int value)
		{
			Map t = PopulationCalculator().calculate(value, key);

			if (t != null && t.length > 0)
			{
				t.forEach((k, v)
				{
					if (k == "Residence")
					{
						widgets.add(
							ResultIndicator(
								width: (MediaQuery.of(context).size.width / 100) * 85,
								icon: AssetImage("assets/tiers/$key.png"),
								secondaryIcon: AssetImage("assets/buildings/Residence.png"),
								text: "Houses",
								count: v['buildings']
							)
						);

						widgets.add(Padding(padding: EdgeInsets.all(8)));
					}
					else
					{
						widgets.add(
							ResultIndicator(
								width: (MediaQuery.of(context).size.width / 100) * 85,
								icon: AssetImage("assets/resources/$k.png"),
								text: "${k.toString().replaceAll('_', ' ')} (${(v['efficiency']*100).toStringAsFixed(1)}%)",
								count: v['buildings'],
								percentage: v['efficiency'],
							)
						);

						widgets.add(Padding(padding: EdgeInsets.all(8)));
					}
				});
			}
		});

		return Scaffold(
			appBar: AppBar(
				title: Text('Anno 1800 FanApp'),
			),
			drawer: SideMenu(activePageId: 1),
			body: SingleChildScrollView(
				child: Column(
					children: widgets
				)
			)
		);
	}
}