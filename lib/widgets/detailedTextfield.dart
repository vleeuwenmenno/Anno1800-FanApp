import 'package:flutter/material.dart';

class DetailedTextfieldController
{
	/// Indicates if the textfield is visible
	bool visible;

	/// Indicates if the textfield is enabled
	bool enabled;

	/// WARNING: Prevent to use this as it may confuse users
	bool forceEnabled;

	/// Mirrors the value from the internal text editing controller
	String value = "";

	/// This event gets fired when the value changes
	ValueSetter<String> onValueChanged;

	TextEditingController _textEditingController;

	DetailedTextfieldController({ 
		this.visible = true,
		this.enabled = false,
		this.forceEnabled = false
	})
	{
		if (this.forceEnabled)
			this.enabled = this.forceEnabled;

		if (this._textEditingController == null)
			_textEditingController = new TextEditingController();

		_textEditingController.addListener(valueChanged);
	}

	void valueChanged()
	{
		this.value = _textEditingController.text;

		if (onValueChanged != null)
			onValueChanged(this.value);
	}
}

class DetailedTextfield extends StatefulWidget
{
	final String hintText;
	final ImageProvider icon;

	final Color color;
	final Color disabledColor;

	final TextInputType inputType;

	final TextStyle labelStyle;

	final VoidCallback onPressed;

	DetailedTextfieldController controller;

	BorderRadius borderRadius;

	final double height;
	final double width;
	final double spinnerSize;
	final double spinnerStrokeSize;

	final Duration animationDuration;

	DetailedTextfield({
		this.hintText,
		this.icon,

		this.inputType = TextInputType.number,

		this.color = const Color(0x12000000),
		this.disabledColor = const Color(0x0A000000),

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

class DetailedButtonState extends State<DetailedTextfield> with SingleTickerProviderStateMixin
{
	@override
	Widget build(BuildContext context) 
	{
		if (widget.controller == null)
			widget.controller = DetailedTextfieldController();

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
					child: ListTile(
						title: TextField(
							keyboardType: widget.inputType,
							controller: widget.controller._textEditingController,
							enabled: widget.controller.enabled,
							decoration: InputDecoration.collapsed(
								hintText: widget.hintText,
								hintStyle: TextStyle(
									color: Color(0x80000000)
								),
							),
						),
						trailing: Opacity(child: Image(image: widget.icon, width: 32), opacity: widget.controller.enabled ? 0.5 : 0.2),
					),
				);
		else
			return Offstage();
	}
}