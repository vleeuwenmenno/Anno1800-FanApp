import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeago/timeago.dart';


class Messages implements LookupMessages 
{
	final BuildContext context;
	Messages(this.context);

	String prefixAgo() => '${Localize.of(context).trans("timeago.prefixAgo")}';
	String prefixFromNow() => '${Localize.of(context).trans("timeago.prefixFromNow")}';
	String suffixAgo() => '${Localize.of(context).trans("timeago.suffixAgo")}';
	String suffixFromNow() => '${Localize.of(context).trans("timeago.suffixFromNow")}';
	String lessThanOneMinute(int seconds) => '${Localize.of(context).trans("timeago.lessThanOneMinute")}';
	String aboutAMinute(int minutes) => '${Localize.of(context).trans("timeago.aboutAMinute")}';
	String minutes(int minutes) => '$minutes ${Localize.of(context).trans("timeago.minutes")}';
	String aboutAnHour(int minutes) => '${Localize.of(context).trans("timeago.aboutAnHour")}';
	String hours(int hours) => '$hours ${Localize.of(context).trans("timeago.hours")}';
	String aDay(int hours) => '${Localize.of(context).trans("timeago.aDay")}';
	String days(int days) => '$days ${Localize.of(context).trans("timeago.days")}';
	String aboutAMonth(int days) => '${Localize.of(context).trans("timeago.aboutAMonth")}';
	String months(int months) => '$months ${Localize.of(context).trans("timeago.months")}';
	String aboutAYear(int year) => '${Localize.of(context).trans("timeago.aboutAYear")}';
	String years(int years) => '$years ${Localize.of(context).trans("timeago.years")}';
	String wordSeparator() => '${Localize.of(context).trans("timeago.wordSeparator")}';
}

class Localize
{
	Localize(this.locale, this.fallbackLang);

	Locale locale;	
	final Locale fallbackLang;

	static Localize of(BuildContext context)
	{
		if (context != null)
			return Localizations.of<Localize>(context, Localize);
		else
			throw Exception("Cannot use localize without giving proper context. (Localize.of was called with [context] == null)");
	}

	Map<String, String> _sentences;
	Map<String, String> _fallBackSentences;

	Future<bool> load([Locale newLocale = null]) async
	{
		Locale currentLocale = (newLocale != null ? newLocale : this.locale);
		String data = await rootBundle.loadString('i18n/${currentLocale.languageCode}-${currentLocale.countryCode}.json');
		Map<String, dynamic> _result = json.decode(data);

		this._sentences = Map();
		_result.forEach((String key, dynamic value) {
			this._sentences[key] = value.toString();
		});

		String dataFallback = await rootBundle.loadString('i18n/${currentLocale.languageCode}-${currentLocale.countryCode}.json');
		Map<String, dynamic> _resultFallback = json.decode(dataFallback);

		this._fallBackSentences = Map();
		_resultFallback.forEach((String key, dynamic value) {
			this._fallBackSentences[key] = value.toString();
		});

		locale = newLocale;

		return true;
	}

	String trans(String key)
	{
		if (key != null)
			return (this._sentences[key] != null ? (this._sentences[key].isNotEmpty ? this._sentences[key] : this._fallBackSentences[key]) : "");
		else
			return "";
	}
}

class LocalizeDelegate extends LocalizationsDelegate<Localize>
{
	const LocalizeDelegate(this.supportedLangs);
	final List<Locale> supportedLangs;

	@override
	bool isSupported(Locale locale) => supportedLangs.contains(locale);

	@override
	Future<Localize> load(Locale locale) async
	{
		if(isSupported(locale))
		{
			Localize localizations = Localize(locale, Locale("en", "US"));
			await localizations.load();

			print("BOBBY Load ${locale.languageCode}");

			return localizations;
		}
		else
		{
			Localize localizations = Localize(Locale("en", "US"), Locale("en", "US"));
			await localizations.load();

			print("BOBBY Language ${locale.languageCode} not supported using default en-US");

			return localizations;
		}
	}

	@override
	bool shouldReload(LocalizeDelegate old) => false;
}
