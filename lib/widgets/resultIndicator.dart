import 'package:flutter/material.dart';

enum ResultIndicatorStyle
{
	Count,
	WithoutCount
}

class ResultIndicator extends StatefulWidget
{
	final String text;
	final int count;

	final ResultIndicatorStyle style;

	final dynamic icon;
	final ImageProvider secondaryIcon;

	final Color color;

	final TextStyle labelStyle;

	final VoidCallback onPressed;

	BorderRadius borderRadius;

	final double height;
	final double width;
	final double percentage;

	final Duration animationDuration;

	ResultIndicator({
		this.text,
		this.count,

		this.style = ResultIndicatorStyle.Count,

		this.icon,
		this.secondaryIcon,

		this.color = const Color(0x12000000),

		this.labelStyle = const TextStyle(
			fontFamily: 'Angsana New',
			fontSize: 14.0,
			color: const Color(0xff000000),
			fontWeight: FontWeight.bold
		),

		this.onPressed,

		this.borderRadius,

		this.width = 256,
		this.height = 60.0,
		this.percentage = 0.0,

		this.animationDuration = const Duration(milliseconds: 200)
	});	

	@override
	ResultIndicatorState createState() => ResultIndicatorState();
}

class ResultIndicatorState extends State<ResultIndicator> with SingleTickerProviderStateMixin
{
	@override
	Widget build(BuildContext context) 
	{
		if (widget.borderRadius == null)
			widget.borderRadius = BorderRadius.circular(6.0);
			
		return GestureDetector(
			behavior: HitTestBehavior.opaque,
			onTap: widget.onPressed != null ? widget.onPressed : () { },
		  	child: AnimatedContainer(
				duration: widget.animationDuration,
				width: widget.width,
				height: widget.height,
				child: Stack(
					children: <Widget>
					[
						AnimatedContainer(
							duration: widget.animationDuration,
							width: (widget.width / 100) * (widget.percentage * 100),
							height: widget.height,
							decoration: BoxDecoration(
								color: widget.color,
								borderRadius: widget.borderRadius,
							),
						),

						AnimatedContainer(
							duration: widget.animationDuration,
							width: widget.width,
							height: widget.height,
							decoration: BoxDecoration(
								color: widget.color,
								borderRadius: widget.borderRadius,
							),
							child: ListTile(
								title: Row(
									children: <Widget>
									[
										widget.style == ResultIndicatorStyle.Count ?
										AnimatedContainer(
											duration: widget.animationDuration,
											width: 48,
											height: widget.height / 2,
											decoration: BoxDecoration(
												color: Color(0x80714F28),
												borderRadius: BorderRadius.circular(30),
											),
											child: AnimatedContainer(
												duration: widget.animationDuration,
												alignment: FractionalOffset.center, 
												child: RichText(
													text: TextSpan(
														text: "${widget.count}",
														style: TextStyle(
															color: Color(0xffFFE4AD)
														)
													)
												)
											)
										): Offstage(),

										Padding(padding: EdgeInsets.only(left: 8)),

										RichText(
											text: TextSpan(
												text: widget.text,
												style: TextStyle(
													color: Color(0x80000000)
												)
											)
										)
									]
								),
								trailing: Container(
									child: Wrap(
										children: <Widget>
										[
											widget.icon != null ?
											widget.icon is ImageProvider ?
											Opacity(
												child: Image(
													image: widget.icon, 
													width: 24
												), 
												opacity: 0.5
											)
											:
											widget.icon is String ?
											Container(
												padding: EdgeInsets.all(4),
												child: RichText(
													text: TextSpan(
														text: "${widget.icon}",
														style: TextStyle(
															color: Color(0x80000000)
														)
													)
												),
											)
											:
											widget.icon
											: Offstage(),

											widget.secondaryIcon != null ?
											Column(
												mainAxisAlignment: MainAxisAlignment.center,
												children: <Widget>
												[
													Opacity(
														opacity: 0.5,
														child: Image(
															image: widget.secondaryIcon, 
															width: 24
														)
													)
												],
											)
											: Offstage()
										],
									),
								)
							),
						)
					],
				)
		 	),
		);
	}
}