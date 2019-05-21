import 'package:flutter/material.dart';
import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:anno1800_fanapp/backend/populationCalculator.dart';

class PopulationNeeds extends StatefulWidget 
{
  Globals globals;

  
  @override
  _PopulationNeedsState createState() => _PopulationNeedsState();

}

class _PopulationNeedsState extends State<PopulationNeeds> with SingleTickerProviderStateMixin
{
	bool oldWorld;
	TabController _tabController;

	void initState() 
	{
		super.initState();
		oldWorld = true;
		_tabController  = TabController(vsync: this, length: oldWorld ? 5:2);
  	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		List<Tab> tabs = oldWorld ? 
		[	
			Tab(icon: Image.asset('assets/tiers/farmer.png', height: 42,), text: 'Farmers'),
			Tab(icon: Image.asset('assets/tiers/worker.png', height: 42,), text: 'Workers'),
			Tab(icon: Image.asset('assets/tiers/artisan.png', height: 42,), text: 'Artisans'),
			Tab(icon: Image.asset('assets/tiers/engineer.png', height: 42,), text: 'Engineers'),
			Tab(icon: Image.asset('assets/tiers/investor.png', height: 42,), text: 'Investors'),
		] :
		[
			Tab(icon: Image.asset('assets/tiers/jornaleros.png', height: 42,), text: 'Jornaleros'),
			Tab(icon: Image.asset('assets/tiers/obreros.png', height: 42,), text: 'Obreros'),
		];
		List<Widget> tabViews = List<Widget>();

		Map needs =  oldWorld ? PopulationCalculator().needs :  PopulationCalculator().needs;

		needs.forEach((k, v)
		{
			List<Widget> basicChips = List<Widget>();
			List<Widget> luxuryChips = List<Widget>();
			
			v.forEach((key, value)
			{
				if (value is Map)
				{
					value.forEach((luxKey, luxValue)
					{
						String path = "resources";
						if (luxKey == "Marketplace" || luxKey == "Pub" || luxKey == "Church" || luxKey == "Residence" || luxKey == "Variety_theatre")
							path = "buildings";

						luxuryChips.add(createChip(path, luxKey, context));
					});
				}
				else
				{
					String path = "resources";
					if (key == "Marketplace" || key == "Pub" || key == "Church" || key == "Residence" || key == "Variety_theatre")
						path = "buildings";

					basicChips.add(createChip(path, key, context));
				}
			});

			tabViews.add(
				Padding(
					padding: const EdgeInsets.all(16.0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>
						[
							Row(
								children: <Widget>
								[
									Text('Basic needs',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
								],
							),
							Divider(color: Color(0xff714F28)),

							Wrap(
								children: basicChips,
							),
							
							Row(
								children: <Widget>
								[
									Text('Luxury needs',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
								],
							),
							Divider(color: Color(0xff714F28)),

							Wrap(
								children: luxuryChips
							),
						],
					),
				)
			);
		});

		return WillPopScope(
			onWillPop: () async => false,
			child: Scaffold(
				appBar: AppBar(
					title: Text(oldWorld ? 'Old world needs' : 'New world needs'),
					elevation: 0,
					actions: <Widget>
					[
						// Calculator button
						IconButton(
							onPressed: () 
							{
								Navigator.pushReplacementNamed(context, '/drawer/population needs/calc', arguments: { "globals": widget.globals, "newWorld": oldWorld ? false:true});
							},
							icon: Image.asset(
								'assets/icons/other/calculator.png',
								height: 24,
							),
						),

						// Swap button
						IconButton(
							onPressed: () 
							{
								setState(() {
									oldWorld = !oldWorld; 
								});
							},
							icon: Icon(Icons.swap_vert),
						)
					],
				),
				drawer: SideMenu(activePageId: 1),
				body: NestedScrollView(
					headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
					{
						return <Widget>
						[
							SliverAppBar(
								automaticallyImplyLeading: false,
								expandedHeight: 200.0,
								floating: false,
								pinned: false,
								flexibleSpace: FlexibleSpaceBar(
									centerTitle: false,
									background: Image.asset(
										oldWorld ?
											_tabController.index == 0 ? 'assets/tiers/farmerBanner.jpg' :
											_tabController.index == 1 ? 'assets/tiers/workerBanner.jpg' :
											_tabController.index == 2 ? 'assets/tiers/artisanBanner.jpg' :
											_tabController.index == 3 ? 'assets/tiers/engineerBanner.jpg' :
											'assets/tiers/investorBanner.jpg'
										:
											_tabController.index == 0 ? 'assets/tiers/jornalerosBanner.jpg' :
											'assets/tiers/obrerosBanner.jpg',
									fit: BoxFit.cover,
									)
								), 
							),
							SliverPersistentHeader(
								delegate: _SliverAppBarDelegate(
									TabBar(
										controller: _tabController,
										isScrollable: true,
										indicatorColor: Color(0xffFFE4AD),
										labelColor: Color(0xffFFE4AD),
										labelPadding: EdgeInsets.only(
											left:((MediaQuery.of(context).size.width /3) -42)/2,
											right: ((MediaQuery.of(context).size.width /3) -42)/2
										),
										labelStyle: TextStyle(fontWeight: FontWeight.w500),
										tabs: tabs
									),
								),
								pinned: true,
							),
						];
					},
					body: TabBarView(
						controller: _tabController,
						children: tabViews
					)
				),
			),
		);
	}
}

Widget createChip(String path, String key, BuildContext context) 
{
	String path = "resources";
	if (key == "Marketplace" || key == "Pub" || key == "Church" || key == "Residence" || key == "Variety_theatre")
		path = "buildings";

	return GestureDetector(
		child: Padding(
			padding: EdgeInsets.only(right: 8),
			child: Chip(
				backgroundColor: Color(0x80714F28),
				label: RichText(
					text: TextSpan(
						text: "${key.toString().replaceAll('_', ' ')}",
						style: TextStyle(
							color: Color(0xDEFFE4AD)
						)
					),
				),
				avatar: Image(
					image: AssetImage("assets/$path/$key.png"),
					width: 20,
				),
			)
		),
		onTap: ()
		{
			Navigator.pushNamed(context, "/goods", arguments: { "item": key });
		},
	);
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate 
{
	_SliverAppBarDelegate(this._tabBar);

	final TabBar _tabBar;

	@override
	double get minExtent => _tabBar.preferredSize.height;

	@override
	double get maxExtent => _tabBar.preferredSize.height;

	@override
	Widget build(BuildContext context, double shrinkOffset, bool overlapsContent)
	{
		return new Container(
			color: Color(0xff714F28),
			child: _tabBar,
		);
	}

	@override
	bool shouldRebuild(_SliverAppBarDelegate oldDelegate) 
	{
		return false;
	}
}