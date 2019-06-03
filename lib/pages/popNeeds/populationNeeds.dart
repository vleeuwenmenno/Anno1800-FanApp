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
	TabController _tabController;

	bool once = true;

	void onIndexChanged()
	{
		setState(() { });
	}

	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

		widget.globals = (ModalRoute.of(context).settings.arguments as Map)["globals"];

		if (once)
		{
			once = false;

			_tabController  = TabController(vsync: this, length: widget.globals.oldWorld ? 5:2);
			_tabController.addListener(onIndexChanged);
		}
		
		List<Tab> tabs = widget.globals.oldWorld ? 
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

		Map needs =  widget.globals.oldWorld ? PopulationCalculator().needs : PopulationCalculator().newWorldNeeds;

		needs.forEach((k, v)
		{
			List<Widget> basicChips = List<Widget>();
			List<Widget> luxuryChips = List<Widget>();
			
			v.forEach(
				(key, value)
				{
					if (value is Map)
					{
						value.forEach((luxKey, luxValue)
						{
							String path = "resources";
							String k = luxKey;
							if (k == "Marketplace" || 
									k == "Pub" || 
									k == "Church" || 
									k == "Residence" || 
									k == "Variety_theatre" || 
									k == "University" || 
									k == "Bank" ||
									k == "Oil_Power_Plant" ||
									k == "Members_club")

							path = "buildings";

							luxuryChips.add(widget.globals.createChip(path, luxKey, context, widget.globals));
						});
					}
					else
					{
						String path = "resources";
						String k = key;
						if (k == "Marketplace" || 
							k == "Pub" || 
							k == "Church" || 
							k == "Residence" || 
							k == "Variety_theatre" || 
							k == "University" || 
							k == "Bank" ||
							k == "Oil_Power_Plant" ||
							k == "Members_club")

							path = "buildings";

						basicChips.add(widget.globals.createChip(path, key, context, widget.globals));
					}
				}
			);

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
					title: Text(widget.globals.oldWorld ? 'Old world needs' : 'New world needs'),
					elevation: 0,
					actions: <Widget>
					[
						// Calculator button
						IconButton(
							onPressed: () 
							{
								Navigator.pushReplacementNamed(context, '/drawer/population needs/calc', arguments: { "globals": widget.globals, "newWorld": widget.globals.oldWorld ? false:true});
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
								setState(() 
								{
									widget.globals.oldWorld = !widget.globals.oldWorld;
									Navigator.pushReplacementNamed(context, "/drawer/population needs", arguments: { "globals": widget.globals });
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
										widget.globals.oldWorld ?
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
										indicatorColor: Color(0xfcFFE4AD),
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