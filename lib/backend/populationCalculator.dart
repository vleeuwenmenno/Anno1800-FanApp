
import 'dart:io';

import 'package:flutter/material.dart';

class PopulationCalculator
{
	Map needs = 
	{
		"farmer": 
		{
			"Marketplace":  0.0,
			"Residence":    0.1,
			"Fish":         0.0025,
			"Work_clothes":	0.00307692,
			"luxury": 
			{
				"Schnapps":  0.00333334,
				"Pub":       0.0
			}
		},
		
		"worker":
		{
			"Marketplace":  0.0,
			"Residence":    0.05,
			"Fish":         0.0025,
			"Work_clothes":	0.00307692,
			"Schnapps":     0.00333334,
			"Sausages":     0.001000002,
			"Bread":        0.00090909,
			"Soap":         0.000416667,
			"luxury": 
			{
				"Schnapps":  0.00333334,
				"Beer":      0.00076923,
				"Pub":       0.0,
				"Church":    0.0,
			}
		},

		"artisan":
		{
			"Residence":       	0.0333333333,
			"Sausages":        	0.001333334,
			"Bread":           	0.001212122,
			"Soap":           	0.000555556,
			"Canned_food":    	0.00034188,
			"Sewing_machines":	0.00095238,
			"Fur_Coats":      	0.000888888,
			"luxury": 
			{
				"Church":         	0.0,
				"Beer":				0.001025642,
				"Variety_theatre":	0.0,
				"Rum":				0.001904762,
			}
		},

		"engineer":
		{
			"Residence":		0.025,
			"Canned_food":		0.00051282,
			"Sewing_machines":	0.0014285715,
			"Fur_Coats":		0.0013333335,
			"University":		0.0,
			"Glasses":			0.000222222,
			"Coffee":			0.0011764710000000001,
			"Oil_Power_Plant":	0.0,
			"Light_bulb":		0.0003124995,
			"luxury": 
			{
				"Variety_theatre":		0.0,
				"Rum":					0.002857143,
				"High_wheeler":		    0.0006250005000000001,
				"Pocket_watch":	    	0.0001960785,
				"Bank":					0.0,
			}
		},

		"investor":
		{
			"Residence":		0.02,
			"Glasses":			0.0003555552,
			"Coffee":			0.0018823524,
			"Pocket_watch":	    0.0003137256,
			"Oil_Power_Plant":	0.0,
			"Light_bulb":		0.0005000004,
			"Bank":				0.0,
			"Champagne":		0.0004704,
			"Cigars":			0.000444444,
			"Chocolate":		0.0010666668,
			"Steam_carriages":	0.00013333319999999998,
			"luxury": 
			{
				"High_wheeler":	0.0006250005000000001,
				"Pocket_watch":	    0.0001960785,
				"Bank":				0.0,
				"Jewelry":			0.00042105239999999997,
				"Gramophone":		0.00010524,
				"Members_club":		0.0,
			}
		}
	};

	Map newWorldNeeds = 
	{
		"jornaleros": 
		{
			"Residence":    0.1,
			"luxury": 
			{

			}
		},
		
		"obreros":
		{
			"Residence":    0.05,
			"luxury": 
			{

			}
		}
	};

	Map residences = 
	{
		/// Residences
		"farmer_Residence": 10,
		"worker_Residence": 20,
		"artisan_Residence": 30,
		"engineer_Residence": 40,
		"investor_Residence": 50,

		"jornalero_Residence": 10,
		"obrero_Residence": 20,
		/// Residences ^^^^
	};


	Map goods = 
	{
		"Wood":
		{
			"costs": 
			{
				"credits": 100
			},
			"workforce":
			{
				"farmer": -5
			},
			"depends":
			{ },
			"upkeep": -10,
			"output": 4,
			"building":
			{
				"requirement": "Trees in it's influence radius",
				"name": "Lumberjack's Hut",
				"size": Size(4, 4),
				"range": 7,
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Timber":
		{
			"costs": 
			{
				"credits": 100
			},
			"workforce":
			{
				"farmer": -10
			},
			"depends":
			{
				"Wood": 4
			},
			"upkeep": -10,
			"output": 4,
			"building":
			{
				"name": "Sawmill",
				"size": Size(3, 4),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Fish": 
		{
			"costs": 
			{
				"credits": 100,
				"Timber": 2
			},
			"workforce":
			{
				"farmer": -25
			},
			"depends":
			{ },
			"upkeep": -40,
			"output": 2.0,
			"building":
			{
				"requirement": "Free coastline",
				"name": "Fishery",
				"size": Size(5, 6),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Wool":
		{
			"costs": 
			{
				"credits": 100,
				"Timber": 2
			},
			"workforce":
			{
				"farmer": -10
			},
			"depends":
			{ },
			"upkeep": -20,
			"output": 2.0,
			"building":
			{
				"name": "Sheep Farm",
				"size": Size(3, 3),
				"module":
				{
					"count": 3,
					"size": Size(3, 3),
					"cost": 15
				}
			}
		},

		"Work_clothes":
		{
			"costs": 
			{
				"credits": 400,
				"Timber": 2
			},
			"workforce":
			{
				"farmer": -50
			},
			"depends":
			{
				"Wool": 2
			},
			"upkeep": -50,			
			"output": 2.0,
			"building":
			{
				"name": "Framework Knitters",
				"size": Size(4, 4),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Sails":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 8,
				"Bricks": 10
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{
				"Wool": 2
			},
			"upkeep": -75,			
			"output": 2.0,
			"building":
			{
				"name": "Sailmakers",
				"size": Size(5, 5),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Potato":
		{
			"costs": 
			{
				"credits": 100,
				"Timber": 2
			},
			"workforce":
			{
				"farmer": -20
			},
			"depends":
			{ },
			"upkeep": -20,
			"output": 2.0,
			"building":
			{
				"requirement": "Potato fertility",
				"name": "Potato Farm",
				"size": Size(3, 3),
				"module":
				{
					"count": 72,
					"size": Size(1, 1),
					"cost": 1 ///TODO: Double check
				}
			}
		},

		"Schnapps":
		{
			"costs": 
			{
				"credits": 100,
				"Timber": 2
			},
			"workforce":
			{
				"farmer": -50
			},
			"depends":
			{ 
				"Potato": 2
			},
			"upkeep": -40,
			"output": 2.0,
			"building":
			{

				"name": "Schnapps Distillery",
				"size": Size(3, 4),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Clay":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{ },
			"upkeep": -10,
			"output": 2.0,
			"building":
			{
				"requirement": "Clay Deposit",
				"name": "Clay Pit",
				"size": Size(5, 5),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Bricks":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{ 
				"Clay": 1
			},
			"upkeep": -10,
			"output": 2.0,
			"building":
			{

				"name": "Brick Factory",
				"size": Size(5, 5),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Pigs":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4
			},
			"workforce":
			{
				"farmer": -30
			},
			"depends":
			{ },
			"attractiveness": -3,
			"upkeep": -40,
			"output": 1.0,
			"building":
			{
				"name": "Pig Farm",
				"size": Size(3, 4),
				"module":
				{
					"count": 5,
					"size": Size(2, 3),
					"cost": 25
				}
			}
		},

		"Sausages":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4,
				"Bricks": 5
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{
				"Pigs": 1
			},
			"attractiveness": -5,
			"upkeep": -80,
			"output": 1.0,
			"building":
			{
				"name": "Slaughterhouse",
				"size": Size(3, 4),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Grain":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4
			},
			"workforce":
			{
				"farmer": -20
			},
			"depends":
			{ },
			"upkeep": -20,
			"output": 1.0,
			"building":
			{
				"requirement": "Grain fertility",
				"name": "Grain Farm",
				"size": Size(3, 4),
				"module":
				{
					"count": 144,
					"size": Size(1, 1),
					"cost": 5
				}
			}
		},

		"Flour":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4,
				"Bricks": 5
			},
			"workforce":
			{
				"farmer": -10
			},
			"depends":
			{
				"Grain": 2
			},
			"upkeep": -50,
			"output": 2.0,
			"building":
			{
				"name": "Flour Mill",
				"size": Size(3, 4),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Bread":
		{
			"costs": 
			{
				"credits": 1000,
				"Timber": 4,
				"Bricks": 5
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{
				"Flour": 1
			},
			"upkeep": -60,
			"output": 1.0,
			"building":
			{
				"name": "Bakery",
				"size": Size(3, 4),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Malt":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4,
				"Bricks": 5,
				"Steel_beams": 4
			},
			"workforce":
			{
				"worker": -25
			},
			"depends":
			{
				"Grain": 2.0
			},
			"upkeep": -150,
			"output": 2.0,
			"building":
			{
				"name": "Malthouse",
				"size": Size(4, 5),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Hops":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4
			},
			"workforce":
			{
				"farmer": -20
			},
			"depends":
			{ },
			"upkeep": -20,
			"output": 0.667,
			"building":
			{
				"requirement": "Hops fertility",
				"name": "Hop Farm",
				"size": Size(3, 4),
				"module":
				{
					"count": 96,
					"size": Size(1, 1),
					"cost": 5
				}
			}
		},

		"Beer":
		{
			"costs": 
			{
				"credits": 1600,
				"Timber": 4,
				"Bricks": 5,
				"Steel_beams": 4
			},
			"workforce":
			{
				"worker": -75
			},
			"depends":
			{ 
				"Malt": 1.0,
				"Hops": 1.0
			},
			"upkeep": -200,
			"output": 1.0,
			"building":
			{
				"name": "Brewery",
				"size": Size(4, 5),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Iron":
		{
			"costs": 
			{
				"credits": 800,
				"Timber": 4,
				"Bricks": 5
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{ },
			"upkeep": -50,
			"output": 4,
			"building":
			{
				"requirement": "Iron Deposit",
				"name": "Iron Mine",
				"size": Size(3, 3),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},


		"Coal_Kiln":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4,
				"Bricks": 5
			},
			"workforce":
			{
				"worker": -10
			},
			"depends":
			{ },
			"attractiveness": -5,
			"upkeep": -20,
			"output": 2.0,
			"building":
			{
				"requirement": "Trees in influence radius",
				"name": "Charcoal Kiln",
				"range": 9,
				"size": Size(5, 5),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},
		"Coal_Mine":
		{
			"costs": 
			{
				"credits": 600,
				"Timber": 4,
				"Bricks": 5
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{ },
			"upkeep": -50,
			"output": 4,
			"building":
			{
				"requirement": "Coal Deposit",
				"name": "Coal Mine",
				"size": Size(3, 3),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},
		

		"Steel":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4,
				"Bricks": 5
			},
			"workforce":
			{
				"worker": -100
			},
			"depends":
			{ 
				"Iron": 2,
				"Coal": 2
			},
			"attractiveness": -5,
			"upkeep": -100,
			"output": 2.0,
			"building":
			{
				"name": "Furnace",
				"size": Size(4, 7),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Steel_beams":
		{
			"costs": 
			{
				"credits": 1000,
				"Timber": 8,
				"Bricks": 10
			},
			"workforce":
			{
				"worker": -200
			},
			"depends":
			{ 
				"Steel": 1.333
			},
			"attractiveness": -10,
			"upkeep": -200,
			"output": 1.333,
			"building":
			{
				"name": "Steelworks",
				"size": Size(5, 10),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},
		
		"Weapons":
		{
			"costs": 
			{
				"credits": 700,
				"Timber": 8,
				"Bricks": 10,
				"Steel_beams": 8
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{ 
				"Steel": 0.667
			},
			"attractiveness": -5,
			"upkeep": -150,
			"output": 0.667,
			"building":
			{
				"name": "Weapons Factory",
				"size": Size(5, 7),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Tallow":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4,
				"Bricks": 5,
				"Steel_beams": 4
			},
			"workforce":
			{
				"worker": -40
			},
			"depends":
			{ 
				"Pigs": 1.0
			},
			"attractiveness": -5,
			"upkeep": -40,
			"output": 1.0,
			"building":
			{
				"name": "Rendering Works",
				"size": Size(3, 3),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},
		
		"Soap":
		{
			"costs": 
			{
				"credits": 500,
				"Timber": 4,
				"Bricks": 5,
				"Steel_beams": 4
			},
			"workforce":
			{
				"worker": -50
			},
			"depends":
			{ 
				"Tallow": 2.0
			},
			"attractiveness": -5,
			"upkeep": -50,
			"output": 2.0,
			"building":
			{
				"name": "Soap Factory",
				"size": Size(4, 4),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Quartz_sand":
		{
			"costs": 
			{
				"credits": 2000,
				"Timber": 6,
				"Bricks": 5
			},
			"workforce":
			{
				"worker": -25
			},
			"depends":
			{ },
			"upkeep": -120,
			"output": 2.0,
			"building":
			{
				"requirement": "Free coastline",
				"name": "Sand Mine",
				"size": Size(6, 7),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Glass":
		{
			"costs": 
			{
				"credits": 5400,
				"Timber": 6,
				"Bricks": 10,
				"Steel_beams": 8
			},
			"workforce":
			{
				"artisan": -100
			},
			"depends":
			{ 
				"Quartz_sand": 2
			},
			"upkeep": -100,
			"output": 2.0,
			"building":
			{
				"name": "Glassmakers",
				"size": Size(4, 6),
				"module":
				{
					"count": 0,
					"size": Size(0, 0),
					"cost": 0
				}
			}
		},

		"Windows":
		{
			"costs": 
			{
				"credits": 6500,
				"Timber": 12,
				"Bricks": 20,
				"Steel_beams": 16
			},
			"workforce":
			{
				"artisan": -100
			},
			"depends":
			{ 
				"Glass": 1,
				"Wood": 1
			},
			"upkeep": -200,
			"output": 1,
			"building":
			{
				"name": "Window Makers",
				"size": Size(5, 5)
			}
		},

		"Beef":
		{
			"costs": 
			{
				"credits": 2000,
				"Timber": 6
			},
			"workforce":
			{
				"farmer": -20
			},
			"depends":
			{ },
			"upkeep": -50,
			"output": 0.5,
			"building":
			{
				"name": "Cattle Farm",
				"size": Size(4, 5),
				"module":
				{
					"count": 4,
					"size": Size(3, 4),
					"cost": 50
				}
			}
		},

		"Red_peppers":
		{
			"costs": 
			{
				"credits": 2000,
				"Timber": 6
			},
			"workforce":
			{
				"farmer": -10
			},
			"depends":
			{ },
			"upkeep": -100,
			"output": 0.5,
			"building":
			{
				"requirement": "Red peppers fertility",
				"name": "Red Pepper Farm",
				"size": Size(3, 3),
				"module":
				{
					"count": 108,
					"size": Size(1, 1),
					"cost": 10
				}
			}
		},

		"Goulash":
		{
			"costs": 
			{
				"credits": 7000,
				"Timber": 6,
				"Bricks": 10,
				"Steel_beams": 8,
				"Windows": 8
			},
			"workforce":
			{
				"artisan": -75
			},
			"depends":
			{ 
				"Beef": 0.5,
				"Red_peppers": 0.5
			},
			"upkeep": -100,
			"output": 0.5,
			"building":
			{
				"name": "Artisanal Kitchen",
				"size": Size(5, 5),
			}
		},

		"Canned_food":
		{
			"costs": 
			{
				"credits": 15000, 
				"Timber": 6, ///TODO: Check this data
				"Bricks": 10, 
				"Steel_beams": 8,
				"Windows": 8
			},
			"workforce":
			{
				"artisan": -75
			},
			"depends":
			{ 
				"Goulash": 0.667,
				"Iron": 0.667
			},
			"upkeep": -100,
			"output": 0.667,
			"building":
			{
				"name": "Cannery",
				"size": Size(6, 7),
			}
		},

		"Sewing_machines":
		{
			"costs": 
			{
				"credits": 12000, 
				"Timber": 6, ///TODO: Check this data
				"Bricks": 10, 
				"Steel_beams": 8,
				"Windows": 8
			},
			"workforce":
			{
				"artisan": -150
			},
			"depends":
			{ 
				"Steel": 2.0,
				"Wood": 2.0
			},
			"upkeep": -500,
			"output": 2.0,
			"building":
			{
				"name": "Sewing Machine Factory",
				"size": Size(6, 9),
			}
		},

		"Furs":
		{
			"costs": 
			{
				"credits": 2000, 
				"Timber": 6
			},
			"workforce":
			{
				"farmer": -10
			},
			"depends":
			{ },
			"upkeep": -50,
			"output": 1.0,
			"building":
			{
				"requirement": "Fur abundance, trees in it's influance radius.",
				"name": "Hunging Cabin",
				"size": Size(5, 5),
				"range": 9
			}
		},

		"Fur_Coats":
		{
			"costs": 
			{
				"credits": 2000, 
				"Timber": 6,
				"Bricks": 10,
				"Steel_beams": 8,
				"Windows": 5
			},
			"workforce":
			{
				"artisan": -200
			},
			"depends":
			{ 
				"Furs": 2,
				"Cotton_fabric": 2
			},
			"upkeep": -500,
			"output": 2.0,
			"building":
			{
				"name": "Fur Dealer",
				"size": Size(4, 6)
			}
		},
	};

	Map calculate(int population, String tier)
	{
		Map returnData = {};

		if (population == null || population == 0)
			return {};
		
		try
		{
			for (int i = 0; i < needs[tier].length; i++)
			{
				String key = needs[tier].keys.elementAt(i);
				dynamic value = needs[tier].values.elementAt(i);

				if (value == 0.0)
					continue;

				if (key == "Residence" && value is double)
				{
					double residency = value * population; /// Total needs
					int houses = 1;
					
					returnData["Residence"] = 
					{
						"buildings": residency.ceil(),
						"efficiency": residency / (residences['${tier}_Residence'] * houses),
					};
				}
				else if (key == "luxury" && value is Map)
				{
					for (int i = 0; i < value.length; i++)
					{
						String luxKey = value.keys.elementAt(i);
						double luxValue = value.values.elementAt(i);
						
						if (luxValue == 0.0)
							continue;

						double tons = luxValue * population; /// Total needs (tons = consumption * population)
						returnData[luxKey] = 
						{
							"tonsNeeded": tons,
							"efficiency": tons / ((tons / goods[luxKey]["output"]).ceil() * goods[luxKey]["output"]),
							"buildings": (tons / goods[luxKey]["output"]).ceil()
						};
					}
				}
				else
				{
					double tons = value * population; /// Total needs (tons = consumption * population)
					returnData[key] = 
					{
						"tonsNeeded": tons,
						"efficiency": tons / ((tons / goods[key]["output"]).ceil() * goods[key]["output"]),
						"buildings": (tons / goods[key]["output"]).ceil()
					};
				}
			}
		}
		catch (e)
		{ }

		return returnData;
	}
}