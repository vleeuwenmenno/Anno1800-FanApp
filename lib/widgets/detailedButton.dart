import 'package:flutter/material.dart';

class DetailedButtonController
{
	bool visible;
	bool enabled;
	bool showSpinner;

	/// WARNING: Prevent to use this as it may confuse users
	bool forceEnabled;

	DetailedButtonController({ 
		this.visible = true,
		this.enabled = false,
		this.showSpinner = false,
		this.forceEnabled = false
	})
	{
		if (this.forceEnabled)
			this.enabled = this.forceEnabled;
	}
}

class DetailedButton extends StatefulWidget
{
	final dynamic child;
	final List<Widget> children;

	final Color spinnerColor;
	final Color color;
	final Color disabledColor;

	final TextStyle labelStyle;

	final VoidCallback onPressed;

	DetailedButtonController controller;

	BorderRadius borderRadius;

	final double height;
	final double width;
	final double spinnerSize;
	final double spinnerStrokeSize;

	final Duration animationDuration;

	DetailedButton({
		this.child,
		this.children,

		this.spinnerColor = const Color(0xffFFE4AD),
		this.color = const Color(0xff714F28),
		this.disabledColor = const Color(0x80714F28),

		this.labelStyle = const TextStyle(
			fontFamily: 'Angsana New',
			fontSize: 14.0,
			color: const Color(0xff000000),
			fontWeight: FontWeight.bold
		),

		this.onPressed,

		this.controller,

		this.borderRadius,

		this.width = 256,
		this.height = 60.0,
		this.spinnerSize = 16,
		this.spinnerStrokeSize = 2.5,

		this.animationDuration = const Duration(milliseconds: 200)
	});	

	@override
	DetailedButtonState createState() => DetailedButtonState();
}

class DetailedButtonState extends State<DetailedButton> with SingleTickerProviderStateMixin
{
	@override
	Widget build(BuildContext context) 
	{
		if (widget.controller == null)
			widget.controller = DetailedButtonController();

		if (widget.borderRadius == null)
			widget.borderRadius = BorderRadius.circular(6.0);

		if (widget.controller.visible)
			return AnimatedContainer(
					duration: widget.animationDuration,
					width: widget.width,
					height: widget.height,
					decoration: BoxDecoration(
						color: (widget.controller.enabled ? (widget.onPressed == null ? (widget.controller.forceEnabled ? widget.color : widget.disabledColor) : widget.color) : widget.disabledColor),
						borderRadius: widget.borderRadius,
					),
					child: (!widget.controller.showSpinner ? FlatButton(
						shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
						child: (widget.child is String ?
						RichText(
							text: TextSpan(
								style: TextStyle(
									fontFamily: widget.labelStyle.fontFamily,
									fontSize: widget.labelStyle.fontSize,
									color: (widget.controller.enabled ?  widget.labelStyle.color : new Color(0xffFFE4AD).withOpacity(0.5)),
									fontWeight: widget.labelStyle.fontWeight,
									fontFamilyFallback: widget.labelStyle.fontFamilyFallback,
									height: widget.labelStyle.height,
									letterSpacing: widget.labelStyle.letterSpacing,
									locale: widget.labelStyle.locale,
									shadows: widget.labelStyle.shadows,
									wordSpacing: widget.labelStyle.wordSpacing,
									textBaseline: widget.labelStyle.textBaseline
								),
								text: widget.child,
							)
						) : (widget.child == null ? (widget.children != null ? Column(mainAxisAlignment: MainAxisAlignment.center, children: widget.children) : Offstage()) : widget.child)),
						onPressed: (!widget.controller.showSpinner && widget.controller.enabled ? widget.onPressed : null)
					):
						Center(
							child: AnimatedContainer(
								width: widget.spinnerSize,
								height: widget.spinnerSize,
								duration: widget.animationDuration,
								child: CircularProgressIndicator(
									valueColor: new AlwaysStoppedAnimation<Color>(widget.spinnerColor),
									strokeWidth: widget.spinnerStrokeSize,
								)
							)
						)
					)
				);
		else
			return Offstage();
	}
}