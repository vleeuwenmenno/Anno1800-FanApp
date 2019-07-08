import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/localize.dart';
import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:anno1800_fanapp/widgets/detailedButton.dart';
import 'package:anno1800_fanapp/widgets/detailedTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class PopulationNeedsCalc extends StatefulWidget 
{	
	Globals globals;

	@override
	PopulationNeedsCalcState createState() => PopulationNeedsCalcState();
}

class PopulationNeedsCalcState extends State<PopulationNeedsCalc> 
{
	DetailedTextfieldController farmersCtrl;
	DetailedTextfieldController workerCtrl;
	DetailedTextfieldController artisanCtrl;
	DetailedTextfieldController engineerCtrl;
	DetailedTextfieldController investorCtrl;

	DetailedTextfieldController jornalerosCtrl;
	DetailedTextfieldController obrerosCtrl;

	@override
	void initState()
	{
		super.initState();

		farmersCtrl = new DetailedTextfieldController(enabled: true);
		workerCtrl = new DetailedTextfieldController(enabled: true);
		artisanCtrl = new DetailedTextfieldController(enabled: true);
		engineerCtrl = new DetailedTextfieldController(enabled: true);
		investorCtrl = new DetailedTextfieldController(enabled: true);

		jornalerosCtrl = new DetailedTextfieldController(enabled: true);
		obrerosCtrl = new DetailedTextfieldController(enabled: true);
	}

	bool once = true;

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];

		if (once)
		{
			widget.globals.oldWorld = (ModalRoute.of(context).settings.arguments as Map)["newWorld"];
			once = false;
		}

		return WillPopScope(
			onWillPop: () async => false,
			child: Scaffold(
				appBar: AppBar(
					title: Text('Anno 1800 FanApp'),
					actions: <Widget>
					[
						IconButton(
							onPressed: () 
							{ 
								widget.globals.oldWorld = !widget.globals.oldWorld;
								setState(() { });
							},
							icon: Icon(
								Icons.swap_vert, color: Color(0xffFFE4AD)
							)
						)
					],
				),
				drawer: SideMenu(activePageId: 1),
				body: SingleChildScrollView(
					child: Column(
						children: <Widget>
						[
							!widget.globals.oldWorld ?
							Column(
								mainAxisAlignment: MainAxisAlignment.start,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: <Widget>
								[
									MenuEntryRow(
										mainText: Localize.of(context).trans("popneedscalc.title"),
										subText: Localize.of(context).trans("popneedscalc.desc"),
										type: MenuEntryRowType.Text
									),

									Padding(padding: EdgeInsets.all(8)),

									DetailedTextfield(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										hintText: Localize.of(context).trans("farmers"),
										icon: AssetImage("assets/tiers/farmer.png"),
										controller: farmersCtrl,
									),

									Padding(padding: EdgeInsets.all(8)),

									DetailedTextfield(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										hintText:  Localize.of(context).trans("workers"),
										icon: AssetImage("assets/tiers/worker.png"),
										controller: workerCtrl
									),

									Padding(padding: EdgeInsets.all(8)),

									DetailedTextfield(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										hintText: Localize.of(context).trans("artisans"),
										icon: AssetImage("assets/tiers/artisan.png"),
										controller: artisanCtrl,
									),

									Padding(padding: EdgeInsets.all(8)),
									
									DetailedTextfield(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										hintText:  Localize.of(context).trans("engineers"),
										icon: AssetImage("assets/tiers/engineer.png"),
										controller: engineerCtrl,
									),

									Padding(padding: EdgeInsets.all(8)),

									DetailedTextfield(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										hintText: Localize.of(context).trans("investors"),
										icon: AssetImage("assets/tiers/investor.png"),
										controller: investorCtrl,
									)
								]
							)
							: 
							Column(
								mainAxisAlignment: MainAxisAlignment.start,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: <Widget>
								[
									MenuEntryRow(
										mainText: Localize.of(context).trans("popneedscalc.title"),
										subText: Localize.of(context).trans("popneedscalc.desc"),
										type: MenuEntryRowType.Text
									),

									Padding(padding: EdgeInsets.all(8)),

									DetailedTextfield(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										hintText: Localize.of(context).trans("jornaleros"),
										icon: AssetImage("assets/tiers/jornaleros.png"),
										controller: jornalerosCtrl,
									),

									Padding(padding: EdgeInsets.all(8)),

									DetailedTextfield(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										hintText: Localize.of(context).trans("obreros"),
										icon: AssetImage("assets/tiers/obreros.png"),
										controller: obrerosCtrl
									),
								]
							),

							Padding(padding: EdgeInsets.all(8)),

							Column(
								mainAxisAlignment: MainAxisAlignment.start,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: <Widget>
								[
									DetailedButton(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										controller: DetailedButtonController(enabled: true, forceEnabled: true),
										onPressed: ()
										{
											Navigator.pushNamed(context, "/drawer/population needs/calc/result", arguments: { "globals": widget.globals, "tiers": 
											{
												"farmer": int.tryParse(farmersCtrl.value),
												"worker": int.tryParse(workerCtrl.value),
												"artisan": int.tryParse(artisanCtrl.value),
												"engineer": int.tryParse(engineerCtrl.value),
												"investor": int.tryParse(investorCtrl.value),

												"jornalero": int.tryParse(jornalerosCtrl.value),
												"obrero": int.tryParse(obrerosCtrl.value)
											}, "newWorld": widget.globals.oldWorld });
										},
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												RichText(
													text: TextSpan(
														text: Localize.of(context).trans("popneedscalc.calcBtn"),
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
							),
						]
					)
				)
			)
		);
	}
}