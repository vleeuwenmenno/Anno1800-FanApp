import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

	Widget build(BuildContext context){

		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

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
														fontFamily: 'Angsana New', //TODO: change font
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
															text: 'Loading Assets...',
															style: TextStyle
															(
																color: Color(0xffFFE4AD)
															)
														)
										  		  	),
										  		),

												Container
												(													
													width: 300,
													child: LinearProgressIndicator
													(
														backgroundColor: Color(0xffFFE4AD).withOpacity(0.2),
														valueColor: AlwaysStoppedAnimation<Color>(Color(0xff714F28),),
														value: 0.3,
													),
												),
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