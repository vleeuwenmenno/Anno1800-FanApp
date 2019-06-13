import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/widgets/detailedButton.dart';
import 'package:anno1800_fanapp/widgets/fireworks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Thnx extends StatefulWidget 
{	
	Globals globals;

	@override
	ThnxState createState() => ThnxState();
}

class ThnxState extends State<Thnx> 
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];

		return Scaffold(
			appBar: AppBar(
				title: Text('Thank you!'),
			),
			drawer: SideMenu(activePageId: 5),
			body: Stack(
				children: <Widget>
				[
					Padding(
						padding: EdgeInsets.all(32),
						child: RichText(
							text: TextSpan(
								style: TextStyle(
									color: Color(0xff714F28),
									fontWeight: FontWeight.w600,
									fontSize: ScreenUtil(allowFontScaling: true).setSp(48)
								),
								text: """
Thank you so much for donating, creating and maintaining this app can be a tedious process.

""",
								children: 
								[
									TextSpan(
										style: TextStyle(
											color: Color(0xff714F28),
											fontWeight: FontWeight.w400,
											fontSize: ScreenUtil(allowFontScaling: true).setSp(48)
										),
										text: """
With your support we can stay motivated to create more awesome updates and maybe even more apps!

If you have suggestions or requests, feel free to contact us on Discord using the button below."""
									)
								]
							),
						),
					),
					

					Column(
						mainAxisAlignment: MainAxisAlignment.end,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>
						[
							Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>
								[
									Padding(
										padding: EdgeInsets.all(32),
										child: DetailedButton(
											controller: DetailedButtonController(enabled: true),
											child: "Open Discord",
											onPressed: ()
											{
												launchURL("https://discord.gg/ZfRVXQ");
											}
										),
									)
								],
							)
						],
					),
					
					OneFirework(2),
					OneFirework(3),
					OneFirework(2),
				]
			)
		);
	}

	launchURL(String url) async 
	{
		if (await canLaunch(url)) 
		{
			await launch(url);
		} 
		else 
		{
			throw 'Could not launch $url';
		}
	}
}