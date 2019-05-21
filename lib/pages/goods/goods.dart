import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';

class Goods extends StatefulWidget 
{
  Globals globals;
  
  @override
  _GoodsState createState() => _GoodsState();

}

class _GoodsState extends State<Goods> with SingleTickerProviderStateMixin
{
	bool oldWorld;

	void initState() 
	{
		super.initState();
		oldWorld = true;
  	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		return Scaffold(
				appBar: AppBar(
					title: Text(oldWorld ? 'Old world goods' : 'New world goods'),
					elevation: 0,
					actions: <Widget>
					[
						// Swap button
						IconButton(
							onPressed: () 
							{
								setState(() {
									oldWorld = !oldWorld; 
								});
							},
							icon: Icon(Icons.swap_vert),
						),

						// Search button
						IconButton(
							onPressed: ()
							{
								print('Search button pressed || missing search function');
							},
							icon: Icon(Icons.search),
						)
					],
				),
				drawer: SideMenu(activePageId: 3,),

				body: GridView.builder(
					gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
					itemCount: 30,
					itemBuilder: (BuildContext context, int index)
					{
						return GestureDetector(
							child: Card(
								color: Color(0xff714F28).withOpacity(0.5),
								shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
								elevation: 0.0,
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>
									[
										Image.asset('assets/resources/Wood.png', height: 42),
										Text('Wood', style: TextStyle(color: Color(0XFFFFE4AD).withOpacity(0.87)),)
									],
								),
							),
							onTap: ()
							{
								Navigator.pushNamed(context, '/goods/goodsInfo', arguments: { "globals": widget.globals});
							},
						);
					},
				),

		);
	}	
}