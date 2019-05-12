import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:anno1800_fanapp/widgets/resultIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class PopNeedsResult extends StatefulWidget 
{
	@override
	PopNeedsResultState createState() => PopNeedsResultState();
}

class PopNeedsResultState extends State<PopNeedsResult> 
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		return Scaffold(
			appBar: AppBar(
				title: Text('Anno 1800 FanApp'),
			),
			drawer: SideMenu(activePageId: 1),
			body: SingleChildScrollView(
				child: Column(
					children: <Widget>
					[
						MenuEntryRow(
							mainText: "Result",
							subText: "Values in brackets is efficiency",
							type: MenuEntryRowType.Text
						),

						Padding(padding: EdgeInsets.all(8)),

						ResultIndicator(
							width: (MediaQuery.of(context).size.width / 100) * 85,
							icon: AssetImage("assets/tiers/farmer.png"),
							secondaryIcon: AssetImage("assets/buildings/Residence.png"),
							text: "Houses",
							count: 10
						),

						Padding(padding: EdgeInsets.all(8)),

						ResultIndicator(
							width: (MediaQuery.of(context).size.width / 100) * 85,
							icon: AssetImage("assets/resources/Fish.png"),
							text: "Fishery",
							count: 2,
							percentage: 50,
						)
					]
				)
			)
		);
	}
}