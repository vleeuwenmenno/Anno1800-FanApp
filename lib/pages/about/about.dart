import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:anno1800_fanapp/widgets/detailedButton.dart';
import 'package:anno1800_fanapp/widgets/fireworks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';

class About extends StatefulWidget 
{	
	Globals globals;

	@override
	AboutState createState() => AboutState();
}

class AboutState extends State<About> 
{
	List<IAPItem> _iaps = [];

	/// start connection for android
	@override
	void initState() 
	{
		super.initState();
		asyncInitState(); // async is not allowed on initState() directly
	}

	void asyncInitState() async 
	{
		await FlutterInappPurchase.initConnection;
	}

	/// start connection for android
	@override
	void dispose() async
	{
		super.dispose();
		await FlutterInappPurchase.endConnection;
	}

	void donate(int i) async
	{
		if (i == 0)
		{
			try
			{
				PurchasedItem result = await FlutterInappPurchase.buyProduct("cred");
				String s = await FlutterInappPurchase.consumePurchase(result.purchaseToken);

				Navigator.pushNamed(context, "/thnx", arguments: {"globals": widget.globals});
			}
			catch (e)
			{ }
		}
		else if (i == 1)
		{
			try
			{
				PurchasedItem result = await FlutterInappPurchase.buyProduct("beer");
				String s = await FlutterInappPurchase.consumePurchase(result.purchaseToken);

				Navigator.pushNamed(context, "/thnx", arguments: {"globals": widget.globals});
			}
			catch (ex)
			{ }
		}
		else if (i == 2)
		{
			try
			{
				PurchasedItem result = await FlutterInappPurchase.buyProduct("buam");
				String s = await FlutterInappPurchase.consumePurchase(result.purchaseToken);

				Navigator.pushNamed(context, "/thnx", arguments: {"globals": widget.globals});
			}
			catch (e)
			{

			}
		}
	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];

		return WillPopScope(
			onWillPop: () async => false,
			child: Scaffold(
				appBar: AppBar(
					title: Text('About'),
				),
				drawer: SideMenu(activePageId: 5),
				body: Stack(
					children: <Widget>
					[
						Column(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget>
							[
								MenuEntryRow(
									mainText: "Changelog",
									type: MenuEntryRowType.None,
									onTap: ()
									{
										Navigator.pushNamed(context, "/drawer/about/changelog", arguments: { "globals": widget.globals });
									},
								),

								MenuEntryRow(
									mainText: "Licenses",
									type: MenuEntryRowType.None,
									onTap: ()
									{
										Navigator.pushNamed(context, "/drawer/about/licenses", arguments: { "globals": widget.globals });
									},
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
											donate(0);
										},
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												Image.asset("assets/icons/other/Balance.png", width: 32),
												Padding(padding: EdgeInsets.all(4)),
												RichText(
													text: TextSpan(
														text: "Every credit counts...",
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

									Padding(padding: EdgeInsets.all(5)),
									
									DetailedButton(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										controller: DetailedButtonController(enabled: true, forceEnabled: true),
										onPressed: ()
										{
											donate(1);
										},
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												Image.asset("assets/resources/Beer.png", width: 32),
												Padding(padding: EdgeInsets.all(4)),
												RichText(
													text: TextSpan(
														text: "Buy us a beer",
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

									Padding(padding: EdgeInsets.all(5)),

									DetailedButton(
										width: (MediaQuery.of(context).size.width / 100) * 85,
										controller: DetailedButtonController(enabled: true, forceEnabled: true),
										onPressed: ()
										{
											donate(2);
										},
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												Image.asset("assets/resources/Canned_food.png", width: 32),
												Padding(padding: EdgeInsets.all(4)),
												RichText(
													text: TextSpan(
														text: "Buy us a meal",
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