import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum MenuEntryRowType
{
	Switch,
	Arrow,
	TextArrow,
	Text,
	Radio,
	DateTime,
	None
}

class MenuEntryRow extends StatefulWidget
{	
	/// Main text above subtext
	final String mainText;
	final double mainTextFontSize;

	/// Text next to main text with month and day
	final String monthText;
	final String dayOfMonth;

	/// Subtext underneath main text
	final String subText;
	final double subTextFontSize;

	final dynamic radioGroupValue;
	final int radioValue;

	/// Text that replaces the arrow/switch at the right side of the button
	final String textRight;
	final double textRightFontSize;

	/// The type, should it show an arrow, or something else? like a radio button
	final MenuEntryRowType type;

	/// Page routing
	final VoidCallback onTap;

	/// Make the row dark
	final bool dark;

	/// Draw a separator underneath the MenuEntryRow
	final bool separator;

	/// Event fires when switch changed values
	final ValueSetter<bool> onSwitchChanged;

	/// Event fires when radio button changed values
	final ValueSetter<dynamic> onRadioChanged;

	/// Forces to hide the icon
	final bool forceHideIcon;

	/// Initial value of the switch (on/off)
	bool switchValue;

	/// This will indicate if the widget is interactive makes it grey out when == false
	final bool enabled;

	/// Constructor, set all values
	MenuEntryRow({
		this.mainText,
		this.mainTextFontSize = 48,

		this.monthText,
		this.dayOfMonth,

		this.subText,
		this.subTextFontSize = 32,

		this.radioGroupValue,
		this.radioValue,

		this.textRight,
		this.textRightFontSize = 32,

		this.type = MenuEntryRowType.None,

		this.onTap,
		this.dark = false,
		this.separator = true,
		this.forceHideIcon = false,
		this.switchValue = false,
		this.onSwitchChanged,
		this.onRadioChanged,
		this.enabled = true
	});

	@override
   	MenuEntryRowState createState() => MenuEntryRowState();
}

class MenuEntryRowState extends State<MenuEntryRow>
{
	@override
	Widget build(BuildContext context) 
	{
		return GestureDetector(
			onTap: widget.enabled ? widget.onTap : null,
			child: Container(
				height: 84,
				decoration: BoxDecoration(
					color: (widget.dark ? const Color(0xff714F28) : const Color(0xffFFE4AD))
				),
				child: Stack(
					children: <Widget> 
                    [
						Row(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget>
							[
								(widget.type == MenuEntryRowType.DateTime ?
									Padding(
										padding: EdgeInsets.only(left: 25),
										child: Column(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>
											[
												RichText(
                                                    overflow: TextOverflow.ellipsis,
													textAlign: TextAlign.center,
													text: TextSpan(
														children: <TextSpan>
														[
															TextSpan(
																text: "${widget.monthText}\n",
																style: TextStyle(
																	fontFamily: 'Angsana New',
																	fontWeight: FontWeight.w500,
																	color: widget.enabled ? Color(0xff714F28) : Color(0xff714F28).withOpacity(0.3),
																	fontSize: ScreenUtil(allowFontScaling: true).setSp(24)
																)
															),

															TextSpan(
																text: widget.dayOfMonth,
																style: TextStyle(
																	fontFamily: 'Angsana New',
																	fontWeight: FontWeight.w400,
																	color: widget.enabled ? Color(0xff714F28).withOpacity(0.4) : Color(0xff714F28).withOpacity(0.2),
																	fontSize: ScreenUtil(allowFontScaling: true).setSp(40)
																)
															)
														]
													)
												)
											]
										)
									)
								: Offstage()),

								Expanded(
									child: Padding(
										padding: EdgeInsets.only(left: 25),
										child: Column(
											mainAxisAlignment: MainAxisAlignment.center,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>
											[
												RichText(
                                                    overflow: TextOverflow.ellipsis,
													text: TextSpan(
														text: widget.mainText,
														style: TextStyle(
															fontFamily: 'Angsana New',
															fontWeight: widget.type == MenuEntryRowType.DateTime ? FontWeight.w500 : FontWeight.w400,
															color: widget.enabled ? Color(0xff714F28) : Color(0xff714F28).withOpacity(0.3),
															fontSize: ScreenUtil(allowFontScaling: true).setSp(widget.mainTextFontSize)
														)
													)
												),

												(widget.subText != "" && widget.subText != null ? 
													RichText(
														overflow: TextOverflow.ellipsis,
														text: TextSpan(
															text: widget.subText,
															style: TextStyle(
																fontFamily: 'Angsana New',
																fontWeight: FontWeight.w500,
																color: Color(0xff714F28).withOpacity(0.4),
																fontSize: ScreenUtil(allowFontScaling: true).setSp(widget.subTextFontSize)
															)
														)
													) : Offstage()
												)
											]
										)
									)
								),

                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>
                                        [
                                            AnimatedOpacity(
                                                duration: Duration(milliseconds: 200),
                                                opacity: widget.enabled ? 1 : 0.4,
                                                child: AbsorbPointer(
                                                    absorbing: !widget.enabled,
                                                    child: Padding(
                                                        padding: EdgeInsets.only(right: 25),
                                                        child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>
                                                            [
                                                                (widget.type == MenuEntryRowType.Switch ?
																	Switch(
																		activeColor: Color(0xffFFE4AD),
																		value: widget.switchValue,
																		onChanged: (widget.onSwitchChanged != null ? widget.onSwitchChanged : (b) { print("No handler set for MenuButton switch (Value $b)"); }),
																	)
                                                                    : Offstage()
																),

                                                                (widget.type == MenuEntryRowType.Radio ?
																	Radio(
																		value: widget.radioValue,
																		groupValue: widget.radioGroupValue,
																		onChanged: (widget.onRadioChanged != null ? widget.onRadioChanged : (b) { print("No handler set for MenuButton radio button (Value $b)"); })
																	)
                                                                    : Offstage()
																),

                                                                (widget.type == MenuEntryRowType.Text && widget.textRight != "" ?
																	RichText(
																		textAlign: TextAlign.right,
																		text: TextSpan(
																			text: widget.textRight,
																			style: TextStyle(
																				fontFamily: 'Angsana New',
																				fontWeight: FontWeight.w500,
																				color: Color(0xff714F28).withOpacity(0.4),
																				fontSize: ScreenUtil(allowFontScaling: true).setSp(widget.textRightFontSize)
																			)
																		)
																	)
																	: Offstage()
																),

																(widget.type == MenuEntryRowType.TextArrow && widget.textRight != "" || widget.type == MenuEntryRowType.DateTime && widget.textRight != "" ?
																	Row(
																		mainAxisAlignment: MainAxisAlignment.end,
																		children: <Widget>
																		[
																			Padding(
																				padding: const EdgeInsets.only(left: 25.0),
																				child: RichText(
																					text: TextSpan(
																						text: widget.textRight,
																						style: TextStyle(
																							fontFamily: 'Angsana New',
																							fontWeight: FontWeight.w500,
																							color: Color(0xff714F28).withOpacity(0.4),
																							fontSize: ScreenUtil(allowFontScaling: true).setSp(12)
																						)
																					)
																				)
																			),
																			(widget.type != MenuEntryRowType.DateTime ?
																				IconButton(
																					icon: Icon(
																						Icons.arrow_forward_ios,
																						size: ScreenUtil(allowFontScaling: true).setWidth(64),
																						color: Color(0xff714F28).withOpacity(0.3)
																					),
																					onPressed: widget.onTap
																				)
																			: Offstage())
																		]
																	)
																	: Offstage()
																),

																(widget.type == MenuEntryRowType.Arrow ?
																	IconButton(
																		icon: Icon(
																			Icons.arrow_forward_ios,
																			size: ScreenUtil(allowFontScaling: true).setWidth(20),
																			color: Color(0xff714F28).withOpacity(0.3)
																		),
																		onPressed: widget.onTap
																	)
                                                                    : Offstage()
																)
                                                            ]
                                                        )
                                                    )
                                                )
                                            )
                                        ]
                                    )
                                )
							]
						),

						(widget.separator ? 
							Column(
								mainAxisAlignment: MainAxisAlignment.end,
								children: <Widget>
								[
									Container(
										width: MediaQuery.of(context).size.width,
										height: 1,
										decoration: BoxDecoration(
											color: (widget.dark ? Color(0xffEAEAEA) : const Color(0x33714F28))
										)
									)
								]
							) 
							: Offstage()
						)
					]
				)
			)
		);
	}
}
