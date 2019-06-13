
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:pimp_my_button/pimp_my_button.dart';

/// A simple animation simulating fireworks over your entire device screen.
class Fireworks extends StatelessWidget 
{
	Fireworks({this.numberOfExplosions: 2, this.delay: 3});

	/// The number of fireworks that are going on at any given time.
	final int numberOfExplosions;

	/// The longest length of time between one explosion and the next
	/// of a particular firework. A new firework will explode on screen between 
	/// 0 and `delay` seconds after the previous one finishes.
	final int delay;

	@override
	Widget build(BuildContext context) 
	{
		return Stack(
			children: List.generate(numberOfExplosions, (i) => OneFirework(delay))
		);
	}
}

class OneFirework extends StatefulWidget 
{
	OneFirework(this.delay);
	final int delay;
	
	@override
	OneFireworkState createState() => OneFireworkState();
}

class OneFireworkState extends State<OneFirework> 
{
	double _x, _y;
	Random random = Random();

	_makeFirework(AnimationController controller) 
	{
		var d = random.nextInt(widget.delay);
		Future.delayed(
			Duration(seconds: d), () => controller.forward(from: 0).then((_) async 
			{
				final mediaQueryData = MediaQuery.of(context);

				setState(() {
					_x = random
						.nextInt(mediaQueryData.size.shortestSide.toInt())
						.toDouble();
					_y = random
						.nextInt(mediaQueryData.size.longestSide.toInt())
						.toDouble();
				});
			})
		);
  	}

	@override
	Widget build(BuildContext context) 
	{
		return Positioned(
			child: PimpedButton(
				particle: DemoParticle(),
				pimpedWidgetBuilder: (context, controller) 
				{
					_makeFirework(controller);
				},
			),
			left: _x,
			top: _y,
		);
	}
}