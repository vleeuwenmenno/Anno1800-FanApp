import 'dart:async';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/widgets/detailedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashScreen extends StatefulWidget 
{
	Globals globals = new Globals();

	@override
	_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
{
	Timer progressChecker;

	double loadingProgress = 0.0;

	int operations = 0;
	int totalOperations = 0;

	bool once = true;

	@override
	void initState()
	{
		super.initState();
		
		widget.globals.am.imageAssets = [];
		widget.globals.lastReload = DateTime.now().millisecondsSinceEpoch;

		progressChecker = Timer.periodic(Duration(milliseconds: 200), (Timer t) 
		{ 
			if (once && widget.globals.nfd != null)
			{
				widget.globals.am.precacheImages(context);
				widget.globals.nfd.loadData(widget.globals);

				once = false;
			}

			setState(() { });

			if (loadingProgress == 1)
			{
				Navigator.pushReplacementNamed(context, "/drawer/news", arguments: { "globals": widget.globals });
				t.cancel();
			}
		});
	}

	@override
	void dispose()
	{
		if (progressChecker != null)
			progressChecker.cancel();

		super.dispose();
	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		if (widget.globals.nfd != null && widget.globals.am.imageAssets != null && widget.globals.am.imageAssets.length > 0)
			loadingProgress = (widget.globals.nfd.itemsLoaded + widget.globals.am.cachedImages) / (widget.globals.nfd.itemsExpected + widget.globals.am.imageAssets.length);

		if (widget.globals.nfd != null)
		{
			totalOperations = widget.globals.nfd.itemsExpected + widget.globals.am.imageAssets.length;
			operations = widget.globals.nfd.itemsLoaded + widget.globals.am.cachedImages;
		}

		return Scaffold
		(
			body: Container
			(
				decoration: BoxDecoration
				(
					image: DecorationImage
					(
						image: AssetImage("assets/background.png"),
						fit: BoxFit.cover
					)
				),
				child: Row
				(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>
					[
						Column
						(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>
							[
								Padding(
								  padding: const EdgeInsets.only(top: 64.0),
								  child: Column
									(
										children: <Widget>
										[
											Image
											(
												image: AssetImage("assets/logo.png"),
											),
										
											Text.rich
											(
												TextSpan
												(
													text: 'FAN APP', 
													style: TextStyle
													(
														fontSize: ScreenUtil(allowFontScaling: true).setSp(48),
														fontFamily: 'Angsana New',
													)
												)
											),
										],
									),
								),
								
								Row
								(
									mainAxisAlignment: MainAxisAlignment.end,
									children: <Widget>
									[
										Padding(
										  padding: const EdgeInsets.only(bottom: 32.0),
										  child: Column
										  (
										  	children: <Widget>
										  	[
										  		Padding(
													padding: const EdgeInsets.all(8.0),
													child: Text.rich
													(
														TextSpan
														(
															text: 'Loading Assets... ($operations/$totalOperations)',
															style: TextStyle
															(
																color: Color(0xffFFE4AD)
															)
														)
										  		  	),
										  		),

												Container
												(													
													width: ScreenUtil().setWidth(800),
													child: LinearProgressIndicator
													(
														backgroundColor: Color(0xffFFE4AD).withOpacity(0.2),
														valueColor: AlwaysStoppedAnimation<Color>(Color(0xff714F28)),
														value: loadingProgress,
													),
												),

												Padding(padding: EdgeInsets.all(4)),

												DetailedButton(
													height: 32,
													controller: DetailedButtonController(enabled: true),
													child: Text(
														"Skip loading news feed",
														style: TextStyle
														(
															color: Color(0xffFFE4AD)
														)
													),
													onPressed: ()
													{
														Navigator.pushReplacementNamed(context, "/drawer/news", arguments: { "globals": widget.globals });
														progressChecker.cancel();
													},
												)
										  	],
										  ),
										),
								  	],
								)
							],
						)
					],
				),
			),
		);
	}
}