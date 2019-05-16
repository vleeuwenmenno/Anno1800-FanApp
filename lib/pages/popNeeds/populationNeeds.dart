import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:anno1800_fanapp/widgets/drawer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PopulationNeeds extends StatefulWidget 
{
  
  @override
  _PopulationNeedsState createState() => _PopulationNeedsState();

}

class _PopulationNeedsState extends State<PopulationNeeds> 
{
	Widget build(BuildContext context)
	{
		ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
		// return Scaffold(
		
		// 	// drawer: globals.sideMenu,
		// 	drawer: SideMenu(activePageId: 1),
		// 	// body: ListView.builder(),
		// 	// body: Container(
		// 	// 	child: Text('data'),
		// 	// ),
		// );
		
		return Scaffold(
			appBar: AppBar(
				title: Text('Old world needs'),
				elevation: 0,
				actions: <Widget>
				[
					IconButton(
						onPressed: () 
						{
							print('object');
						},
						icon: Icon(
							Icons.swap_vert, color: Color(0xffFFE4AD)
						)
					)
				],
			),
			body: DefaultTabController(
				length: 2,
				child: NestedScrollView(
					headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
					{
						return <Widget>
						[
							SliverAppBar(
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
												onTap: (){print('object');},
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
										indicatorColor: Color(0xffFFE4AD),
										labelColor: Color(0xffFFE4AD),
										tabs: [
										Tab(icon: Icon(Icons.info), text: "Tab 1"),
										Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
										],
									),
								),
								pinned: true,
							),
						];
					},
					body: Center(
						child: Text("Sample text"),
					),
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