import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class GoodsInfo extends StatefulWidget 
{
  Globals globals;
  
  @override
  _GoodsInfoState createState() => _GoodsInfoState();

}

class _GoodsInfoState extends State<GoodsInfo> with SingleTickerProviderStateMixin
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		
		return Scaffold(
				appBar: AppBar(
					title: Text('insert selected goods name'),
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
				drawer: SideMenu(activePageId: 3,),

				body: SingleChildScrollView(
					child: Padding(
						padding: const EdgeInsets.all(16.0),
						child: Column(
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

								Wrap(),

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
}