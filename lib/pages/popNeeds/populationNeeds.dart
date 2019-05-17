import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:anno1800_fanapp/backend/populationCalculator.dart';

class PopulationNeeds extends StatefulWidget 
{
  
  @override
  _PopulationNeedsState createState() => _PopulationNeedsState();

}

class _PopulationNeedsState extends State<PopulationNeeds> 
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

		List<Widget> tabViews = new List<Widget>();
		List<Chip> basicChips = new List<Chip>();

		for(int i = 0; i < 5 ; i++)
		{
			
		}

    		for(int i = 0; i < 5; i++)
			{
       			tabViews.add(
					Padding(
					  padding: const EdgeInsets.all(16.0),
					  child: Column(
					  	children: <Widget>[
					  		Row(
					  		  	children: <Widget>
					  			[
					  		    	Text('Basic needs',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
					  		  	],
					  		),
					  		Divider(color: Color(0xff714F28)),

							Wrap(
								children: basicChips
							),
					  		Row(
					  		  	children: <Widget>
					  			[
					  		    	Text('Luxury needs',  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff714F28))),
					  			],
					  		),
					  		Divider(color: Color(0xff714F28)),
					  	],
					  ),
					)
				);
    		}

		return Scaffold(
			appBar: AppBar(
				title: Text(oldWorld ? 'Old world needs' : 'New world needs'),
				elevation: 0,
				actions: <Widget>
				[
					IconButton(
						onPressed: () 
						{
							setState(() {
								oldWorld = !oldWorld; 
							});
						},
						icon: Icon(
							Icons.swap_vert, color: Color(0xffFFE4AD)
						)
					)
				],
			),
			drawer: SideMenu(activePageId: 1),
			body: DefaultTabController(
				length: 5,
				child: NestedScrollView(
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
									title: Align(
										alignment: Alignment(0.2, 1),
										child: Container(
											height: 32,
											width: 32,
											child: GestureDetector(
												child: Image.asset('assets/icons/other/calculator.png'),
												onTap: ()
												{
													print('object');
												},
											)
										),
									),
									background: Image.asset(
									'assets/tiers/farmerBanner.jpg',
									fit: BoxFit.cover,
									)
								), 
							),
							SliverPersistentHeader(
								delegate: _SliverAppBarDelegate(
									TabBar(
										isScrollable: true,
										indicatorColor: Color(0xffFFE4AD),
										labelColor: Color(0xffFFE4AD),
										labelPadding: EdgeInsets.only(
											left:((MediaQuery.of(context).size.width /3) -42)/2,
											right: ((MediaQuery.of(context).size.width /3) -42)/2
										),
										labelStyle: TextStyle(fontWeight: FontWeight.w500),
										tabs: [
											Tab(icon: Image.asset('assets/tiers/farmer.png', height: 42,), text: 'Farmers'),
											Tab(icon: Image.asset('assets/tiers/worker.png', height: 42,), text: 'Workers'),
											Tab(icon: Image.asset('assets/tiers/artisan.png', height: 42,), text: 'Artisans'),
											Tab(icon: Image.asset('assets/tiers/engineer.png', height: 42,), text: 'Engineers'),
											Tab(icon: Image.asset('assets/tiers/investor.png', height: 42,), text: 'Investors'),
										],
									),
								),
								pinned: true,
							),
						];
					},
					body: TabBarView(
						children: tabViews
					)
				),
			),
		);
	}
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
		color: Color(0xff714F28),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}