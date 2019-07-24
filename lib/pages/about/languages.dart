import 'package:anno1800_fanapp/backend/globals.dart';
import 'package:anno1800_fanapp/localize.dart';
import 'package:anno1800_fanapp/widgets/MenuEntryRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Languages extends StatefulWidget
{
	Globals globals;
	@override
	LanguageState createState() => LanguageState();
}

class LanguageState extends State<Languages>
{
	List<Widget> langWidgets = [];

	@override
	Widget build(BuildContext context)
	{
		langWidgets.clear();

		Globals.supportedLangsNames.forEach((lang, locale)
		{
			langWidgets.add(
				MenuEntryRow(
					mainText: lang == "English" || lang == "Nederlands" ? lang : "$lang (WIP)",
					onTap: () async
					{
						await FlutterSecureStorage().write(key: "lang", value: Globals.langNameFromCode("${locale.languageCode}_${locale.countryCode}"));
						bool reload = await Localize.of(context).load(locale);

						if (reload)
						{
							Navigator.pop(context);
						}
						else
							throw Exception("Something went wrong trying to reload the language files.");
					},
				)
			);
		});

		return Scaffold(
			appBar: AppBar(
				title: Text(Localize.of(context).trans("settings.lang")),
			),
			body: Column(
				children: langWidgets,
			),
		);
	}
}