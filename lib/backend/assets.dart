import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AssetsManagement
{
	static const List<String> assets =
	[
		/*
		Use this command to list all the files in assets/ (run inside root of project)
		Then copy that output and paste it below here
		
		ls -R assets | awk '
		/:$/&&f{s=$0;f=0}
		/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
		NF&&f{ print "\""s"/"$0"\"," }'

		*/
		"assets/appIcon",
		"assets/background.png",
		"assets/buildings",
		"assets/calculator.svg",
		"assets/icons",
		"assets/Letter.png",
		"assets/logo.png",
		"assets/resources",
		"assets/ships",
		"assets/swap.svg",
		"assets/tiers",
		"assets/appIcon/University.png",
		"assets/buildings/Bank.png",
		"assets/buildings/Big_Betty.png",
		"assets/buildings/Cannon_Tower.png",
		"assets/buildings/Church.png",
		"assets/buildings/Commuter_pier.png",
		"assets/buildings/Depot.png",
		"assets/buildings/Dirt_road.png",
		"assets/buildings/Farm_module.png",
		"assets/buildings/Fire_station.png",
		"assets/buildings/Harbourmasters_Office.png",
		"assets/buildings/Hospital.png",
		"assets/buildings/Marketplace.png",
		"assets/buildings/Members_club.png",
		"assets/buildings/Mounted_guns.png",
		"assets/buildings/Museum.png",
		"assets/buildings/Oil_Harbour.png",
		"assets/buildings/Oil_Power_Plant.png",
		"assets/buildings/Oil_Storage.png",
		"assets/buildings/Paved_street.png",
		"assets/buildings/Pier.png",
		"assets/buildings/Police_Station.png",
		"assets/buildings/Pub.png",
		"assets/buildings/Public_mooring.png",
		"assets/buildings/Quay.png",
		"assets/buildings/Railway.png",
		"assets/buildings/Repair_crane.png",
		"assets/buildings/Residence.png",
		"assets/buildings/Sailing_shipyard.png",
		"assets/buildings/School.png",
		"assets/buildings/Steam_shipyard.png",
		"assets/buildings/Town_Hall.png",
		"assets/buildings/Trade_Union.png",
		"assets/buildings/University.png",
		"assets/buildings/Variety_theatre.png",
		"assets/buildings/Warehouse.png",
		"assets/buildings/Worlds_fair.png",
		"assets/buildings/Zoo.png",
		"assets/icons/credits.png",
		"assets/icons/Electricity.png",
		"assets/icons/other",
		"assets/icons/Tile.png",
		"assets/icons/other/Attractiveness.png",
		"assets/icons/other/Balance.png",
		"assets/icons/other/calculator.png",
		"assets/icons/other/Influence.png",
		"assets/icons/other/Workforce_artisans.png",
		"assets/icons/other/Workforce_engineers.png",
		"assets/icons/other/Workforce_farmers.png",
		"assets/icons/other/Workforce_investors.png",
		"assets/icons/other/Workforce_jornaleros.png",
		"assets/icons/other/Workforce_obreros.png",
		"assets/icons/other/Workforce_workers.png",
		"assets/resources/Advanced_weapons.png",
		"assets/resources/Alpaca_wool.png",
		"assets/resources/Beef.png",
		"assets/resources/Beer.png",
		"assets/resources/Bowler_hats.png",
		"assets/resources/Brass.png",
		"assets/resources/Bread.png",
		"assets/resources/Bricks.png",
		"assets/resources/Canned_food.png",
		"assets/resources/Caoutchouc.png",
		"assets/resources/Carbon_filament.png",
		"assets/resources/Cement.png",
		"assets/resources/Champagne.png",
		"assets/resources/Chassis.png",
		"assets/resources/Chocolate.png",
		"assets/resources/Cigars.png",
		"assets/resources/Clay.png",
		"assets/resources/Coal.png",
		"assets/resources/Coal_Kiln.png",
		"assets/resources/Coal_Mine.png",
		"assets/resources/Cocoa.png",
		"assets/resources/Coffee.png",
		"assets/resources/Coffee_beans.png",
		"assets/resources/Copper.png",
		"assets/resources/Corn.png",
		"assets/resources/Cotton.png",
		"assets/resources/Cotton_fabric.png",
		"assets/resources/Dynamite.png",
		"assets/resources/Felt.png",
		"assets/resources/Fish.png",
		"assets/resources/Fish_Oil.png",
		"assets/resources/Flour.png",
		"assets/resources/Fried_plantains.png",
		"assets/resources/Fur_Coats.png",
		"assets/resources/Furs.png",
		"assets/resources/Glass.png",
		"assets/resources/Glasses.png",
		"assets/resources/Gold.png",
		"assets/resources/Gold_Ore.png",
		"assets/resources/Goulash.png",
		"assets/resources/Grain.png",
		"assets/resources/Gramophone.png",
		"assets/resources/Grapes.png",
		"assets/resources/High_wheeler.png",
		"assets/resources/Hops.png",
		"assets/resources/Iron.png",
		"assets/resources/Jewelry.png",
		"assets/resources/Light_bulb.png",
		"assets/resources/Malt.png",
		"assets/resources/Pearls.png",
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
		"assets/resources/Saltpeter.png",
		"assets/resources/Sausages.png",
		"assets/resources/Schnapps.png",
		"assets/resources/Sewing_machines.png",
		"assets/resources/Soap.png",
		"assets/resources/Steam_carriages.png",
		"assets/resources/Steam_motors.png",
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
		"assets/tiers/artisan.png",
		"assets/tiers/artisanBanner.jpg",
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
	
	List<String> imageAssets;
	int cachedImages;

	AssetsManagement({
		this.cachedImages = 0,
		this.imageAssets = const []
	});

	void precacheImages(BuildContext context)
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

		var futures = <Future>[];
		for (var index = 0; index < imageAssets.length; index++) 
		{
			String s = imageAssets[index];
			var thread = new Future(() async 
			{
				precacheImage(AssetImage(s), context);
				cachedImages++;
			});

			futures.add(thread);
		}
	}
}