import 'package:anno1800_fanapp/backend/populationCalculator.dart';
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
	Map oldWorldGoods = {};
	Map newWorldGoods = {};

	void initState() 
	{
		super.initState();
  	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];

		PopulationCalculator().goods.forEach((key, value)
		{
			if (value.containsKey("newWorld"))
				newWorldGoods[key] = value;
			else
				oldWorldGoods[key] = value;
		});

		return Scaffold(
				appBar: AppBar(
					title: Text(widget.globals.oldWorld ? 'Old world goods' : 'New world goods'),
					elevation: 0,
					actions: <Widget>
					[
						// Swap button
						IconButton(
							onPressed: () 
							{
								setState(() {
									widget.globals.oldWorld = !widget.globals.oldWorld; 
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
				drawer: SideMenu(activePageId: 2,),

				body: Container(
					padding: EdgeInsets.all(4),
					child: GridView.builder(
						gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
						itemCount: widget.globals.oldWorld ? oldWorldGoods.keys.length : newWorldGoods.keys.length,
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
											Image.asset('assets/resources/${widget.globals.oldWorld ? oldWorldGoods.keys.elementAt(index) : newWorldGoods.keys.elementAt(index)}.png', height: 42),
											Text('${widget.globals.oldWorld ? oldWorldGoods.keys.elementAt(index).toString().replaceAll("_", " ") : newWorldGoods.keys.elementAt(index).toString().replaceAll("_", " ")}', style: TextStyle(color: Color(0XFFFFE4AD).withOpacity(0.87)), textAlign: TextAlign.center),
										],
									),
								),
								onTap: ()
								{
									Navigator.pushNamed(context, '/goods/goodsInfo', arguments: { "globals": widget.globals, "selectedGoods": "${widget.globals.oldWorld ? oldWorldGoods.keys.elementAt(index).toString() : newWorldGoods.keys.elementAt(index).toString()}"});
								},
							);
						},
					),
				),

		);
	}	
}