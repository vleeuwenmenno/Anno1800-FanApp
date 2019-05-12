import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:anno1800_fanapp/widgets/detailedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class PopNeeds extends StatefulWidget 
{
	@override
	PopNeedsState createState() => PopNeedsState();
}

class PopNeedsState extends State<PopNeeds> 
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		return WillPopScope(
			onWillPop: () async => false,
			child: Scaffold(
				appBar: AppBar(
					title: Text('Anno 1800 FanApp'),
					actions: <Widget>
					[
						IconButton(
							onPressed: () 
							{ },
							icon: Icon(
								Icons.swap_vert, color: Color(0xffFFE4AD)
							)
						)
					],
				),
				drawer: SideMenu(activePageId: 1),
				body: Stack(
					children: <Widget>
					[
						Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget>
							[
								MenuEntryRow(
									mainText: "Needs calculator",
									subText: "Enter the amount of population your city has",
									type: MenuEntryRowType.Text
								),
							]
						),

						Container(
							alignment: FractionalOffset.bottomCenter,
							child: Column(
								mainAxisAlignment: MainAxisAlignment.end,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: <Widget>
								[
									DetailedButton(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										controller: DetailedButtonController(enabled: true, forceEnabled: true),
										onPressed: ()
										{
											
										},
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												RichText(
													text: TextSpan(
														text: "Calculate",
														style: TextStyle(
															fontFamily: 'Angsana New',
															fontSize: 14.0,
															color: const Color(0xffFFE4AD),
															fontWeight: FontWeight.bold
														)
													),
												)
											],
										),
									),

									Padding(padding: EdgeInsets.all(12)),
								]
							)
						)
					]
				)
			)
		);
	}
}