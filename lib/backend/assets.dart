
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AssetsManagement
{
	List<String> assets =
	[
		"assets/background.png",
		"assets/buildings/",
		"assets/calculator.svg",
		"assets/icons/",
		"assets/Letter.png",
		"assets/logo.png",
		"assets/resources/",
		"assets/ships/",
		"assets/swap.svg",
		"assets/tiers/",
		"assets/buildings/Church.png",
		"assets/buildings/Depot.png",
		"assets/buildings/Farm_module.png",
		"assets/buildings/Fire_station.png",
		"assets/buildings/Hospital.png",
		"assets/buildings/Marketplace.png",
		"assets/buildings/Police_Station.png",
		"assets/buildings/Pub.png",
		"assets/buildings/Residence.png",
		"assets/buildings/School.png",
		"assets/buildings/Town_Hall.png",
		"assets/buildings/Trade_Union.png",
		"assets/buildings/University.png",
		"assets/buildings/Variety_theatre.png",
		"assets/buildings/Warehouse.png",
		"assets/icons/other/",
		"assets/icons/Tile.png",
		"assets/icons/other/Attractiveness.png",
		"assets/icons/other/Balance.png",
		"assets/icons/other/Credits.png",
		"assets/icons/other/Influence.png",
		"assets/icons/other/Workforce_artisans.png",
		"assets/icons/other/Workforce_engineers.png",
		"assets/icons/other/Workforce_farmers.png",
		"assets/icons/other/Workforce_investors.png",
		"assets/icons/other/Workforce_jornaleros.png",
		"assets/icons/other/Workforce_obreros.png",
		"assets/icons/other/Workforce_workers.png",
		"assets/resources/Alpaca_wool.png",
		"assets/resources/Beef.png",
		"assets/resources/Beer.png",
		"assets/resources/Bowler_hats.png",
		"assets/resources/Bread.png",
		"assets/resources/Bricks.png",
		"assets/resources/Canned_food.png",
		"assets/resources/Champagne.png",
		"assets/resources/Chocolate.png",
		"assets/resources/Cigars.png",
		"assets/resources/Clay.png",
		"assets/resources/Coal.png",
		"assets/resources/Cocoa.png",
		"assets/resources/Coffee.png",
		"assets/resources/Coffee_beans.png",
		"assets/resources/Copper.png",
		"assets/resources/Corn.png",
		"assets/resources/Cotton.png",
		"assets/resources/Cotton_fabric.png",
		"assets/resources/Felt.png",
		"assets/resources/Fish.png",
		"assets/resources/Fish_Oil.png",
		"assets/resources/Flour.png",
		"assets/resources/Fried_plantains.png",
		"assets/resources/Fur_Coats.png",
		"assets/resources/Furs.png",
		"assets/resources/Glass.png",
		"assets/resources/Goulash.png",
		"assets/resources/Grain.png",
		"assets/resources/Hops.png",
		"assets/resources/Iron.png",
		"assets/resources/Malt.png",
		"assets/resources/Pigs.png",
		"assets/resources/Plantains.png",
		"assets/resources/Pocket_watch.png",
		"assets/resources/Poncho.png",
		"assets/resources/Potato.png",
		"assets/resources/Quartz_sand.png",
		"assets/resources/Red_peppers.png",
		"assets/resources/Reinforced_concrete.png",
		"assets/resources/Rum.png",
		"assets/resources/Sails.png",
		"assets/resources/Sausages.png",
		"assets/resources/Schnapps.png",
		"assets/resources/Sewing_machines.png",
		"assets/resources/Soap.png",
		"assets/resources/Steel.png",
		"assets/resources/Steel_beams.png",
		"assets/resources/Sugar.png",
		"assets/resources/Sugar_cane.png",
		"assets/resources/Tallow.png",
		"assets/resources/Timber.png",
		"assets/resources/Tobacco.png",
		"assets/resources/Tortilla.png",
		"assets/resources/Weapons.png",
		"assets/resources/Windows.png",
		"assets/resources/Wood.png",
		"assets/resources/Wood_veneers.png",
		"assets/resources/Wool.png",
		"assets/resources/Work_clothes.png",
		"assets/resources/Zinc.png",
		"assets/ships/Battle_cruiser.png",
		"assets/ships/Cargo_ship.png",
		"assets/ships/Clipper.png",
		"assets/ships/Flagship.png",
		"assets/ships/Frigatte.png",
		"assets/ships/Great_Eastern.png",
		"assets/ships/Gunboat.png",
		"assets/ships/Monitor.png",
		"assets/ships/Oil_tanker.png",
		"assets/ships/Pirate_frigate.png",
		"assets/ships/Pirate_gunboat.png",
		"assets/ships/Pirate_monitor.png",
		"assets/ships/Pirate_ship-of-the-line.png",
		"assets/ships/Pyrphorian_battlecruiser.png",
		"assets/ships/Pyrphorian_monitor.png",
		"assets/ships/Pyrphorian_Warship.png",
		"assets/ships/Royal_ship-of-the-line.png",
		"assets/ships/Schooner.png",
		"assets/ships/Ship-of-the-line.png",
		"assets/tiers/artisanBanner.jpg",
		"assets/tiers/artisian.png",
		"assets/tiers/engineer.png",
		"assets/tiers/engineerBanner.jpg",
		"assets/tiers/farmer.png",
		"assets/tiers/farmerBanner.jpg",
		"assets/tiers/investor.png",
		"assets/tiers/investorBanner.jpg",
		"assets/tiers/jornaleros.png",
		"assets/tiers/jornalerosBanner.jpg",
		"assets/tiers/obreros.png",
		"assets/tiers/obrerosBanner.jpg",
		"assets/tiers/worker.png",
		"assets/tiers/workerBanner.jpg",
	];
	
	List<String> imageAssets = [];
	int cachedImages = 0;

	void precacheImages(BuildContext context) async
	{
		imageAssets = [];
		cachedImages = 0;

		for (String s in assets)
		{
			if (s.endsWith(".png") || s.endsWith(".jpg"))
			{
				imageAssets.add(s);
			}
		}

		for (String s in imageAssets)
		{
			ImageProvider i = AssetImage(s);
			precacheImage(i, context);
			cachedImages++;
		}
	}
}