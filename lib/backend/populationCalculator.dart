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
		///OLD WORLD >>>>
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
				"size": Size(3, 4)
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
				"unlockCondition":
				{
					"desc": "50",
					"img": "tiers/farmer"
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
				},
				"unlockCondition":
				{
					"desc": "150",
					"img": "tiers/farmer"
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
				"unlockCondition":
				{
					"desc": "150",
					"img": "tiers/farmer"
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
				"unlockCondition":
				{
					"desc": "150",
					"img": "tiers/worker"
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
				"requirement": "Potato fertility image:[assets/resources/Potato.png]",
				"name": "Potato Farm",
				"size": Size(3, 3),
				"module":
				{
					"count": 72,
					"size": Size(1, 1),
					"cost": 1
				},
				"unlockCondition":
				{
					"desc": "100",
					"img": "tiers/farmer"
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
				"unlockCondition":
				{
					"desc": "100",
					"img": "tiers/farmer"
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
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/worker"
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
				},
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/worker"
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
				},
				"unlockCondition":
				{
					"desc": "150",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "150",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "150",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "500",
					"img": "tiers/worker"
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
				},
				"unlockCondition":
				{
					"desc": "500",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "500",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "300",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "300",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "250",
					"img": "tiers/artisan"
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
				"unlockCondition":
				{
					"desc": "300",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "300",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "300",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "300",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "300",
					"img": "tiers/worker"
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
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/artisan"
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
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/artisan"
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
				"size": Size(5, 5),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/artisan"
				}
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
				},
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/artisan"
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
				},
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/artisan"
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
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/artisan"
				}
			}
		},

		"Canned_food":
		{
			"costs": 
			{
				"credits": 15000, 
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
				"Goulash": 0.667,
				"Iron": 0.667
			},
			"upkeep": -100,
			"output": 0.667,
			"building":
			{
				"name": "Cannery",
				"size": Size(6, 7),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/artisan"
				}
			}
		},

		"Sewing_machines":
		{
			"costs": 
			{
				"credits": 12000, 
				"Timber": 6,
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
				"unlockCondition":
				{
					"desc": "250",
					"img": "tiers/artisan"
				}
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
				"range": 9,
				"unlockCondition":
				{
					"desc": "900",
					"img": "tiers/artisan"
				}
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
				"size": Size(4, 6),
				"unlockCondition":
				{
					"desc": "900",
					"img": "tiers/artisan"
				}
			}
		},

		"Cement":
		{
			"costs": 
			{
				"credits": 6000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10
			},
			"workforce":
			{
				"worker": -25
			},
			"depends":
			{ },
			"upkeep": -250,
			"output": 2.0,
			"building":
			{
				"requirement": "Limestone deposit",
				"name": "Limestone Quarry",
				"size": Size(3, 3),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/engineer"
				}
			}
		},

		"Reinforced_concrete":
		{
			"costs": 
			{
				"credits": 15000, 
				"Timber": 20,
				"Bricks": 30,
				"Steel_beams": 24,
				"Windows": 25
			},
			"workforce":
			{
				"engineer": -75
			},
			"depends":
			{ 
				"Cement": 1,
				"Steel": 1
			},
			"upkeep": -400,
			"output": 1.0,
			"building":
			{
				"name": "Concrete Factory",
				"size": Size(5, 6),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/engineer"
				}
			}
		},

		"Copper":
		{
			"costs": 
			{
				"credits": 5000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"workforce":
			{
				"worker": -25
			},
			"depends":
			{ },
			"upkeep": -250,
			"output": 2.0,
			"building":
			{
				"requirement": "Copper deposit",
				"name": "Copper Mine",
				"size": Size(3, 3),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/engineer"
				}
			}
		},

		"Zinc":
		{
			"costs": 
			{
				"credits": 5000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"workforce":
			{
				"worker": -25
			},
			"depends":
			{ },
			"upkeep": -250,
			"output": 2.0,
			"building":
			{
				"requirement": "Zinc deposit",
				"name": "Zinc Mine",
				"size": Size(3, 3),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/engineer"
				}
			}
		},

		"Brass":
		{
			"costs": 
			{
				"credits": 17000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"workforce":
			{
				"worker": -25
			},
			"depends":
			{
				"Copper": 1,
				"Zinc": 1
			},
			"attractiveness": -10,
			"upkeep": -250,
			"output": 1.0,
			"building":
			{
				"name": "Brass Smeltery",
				"size": Size(5, 5),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/engineer"
				}
			}
		},

		"Glasses":
		{
			"costs": 
			{
				"credits": 17000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"workforce":
			{
				"engineer": -100
			},
			"depends":
			{
				"Brass": 0.667,
				"Glass": 0.667
			},
			"upkeep": -1000,
			"output": 0.667,
			"building":
			{
				"name": "Spectacle Factory",
				"size": Size(4, 6),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/engineer"
				}
			}
		},

		"Saltpeter":
		{
			"costs": 
			{
				"credits": 12500, 
				"Timber": 10,
				"Bricks": 20,
				"Steel_beams": 16,
			},
			"workforce":
			{
				"worker": -25
			},
			"depends":
			{ },
			"upkeep": -500,
			"output": 0.5,
			"building":
			{
				"requirement": "Nitre deposits, Free coastline",
				"name": "Saltpeter Works",
				"size": Size(4, 6),
				"unlockCondition":
				{
					"desc": "500",
					"img": "tiers/engineer"
				}
			}
		},

		"Dynamite":
		{
			"costs": 
			{
				"credits": 54000, 
				"Timber": 10,
				"Bricks": 20,
				"Steel_beams": 16,
				"Windows": 15,
				"Reinforced_concrete": 15
			},
			"workforce":
			{
				"engineer": -250
			},
			"depends":
			{
				"Tallow": 1,
				"Saltpeter": 1,
			},
			"upkeep": -1000,
			"output": 1.0,
			"building":
			{
				"name": "Dynamite Factory",
				"size": Size(5, 6),
				"unlockCondition":
				{
					"desc": "500",
					"img": "tiers/engineer"
				}
			}
		},

		"Advanced_weapons":
		{
			"costs": 
			{
				"credits": 85000, 
				"Timber": 20,
				"Bricks": 40,
				"Steel_beams": 32,
				"Windows": 30,
				"Reinforced_concrete": 30
			},
			"workforce":
			{
				"engineer": -250
			},
			"depends":
			{
				"Steel": 0.5,
				"Dynamite": 0.5,
			},
			"attractiveness": -15,
			"upkeep": -2200,
			"output": 0.5,
			"building":
			{
				"requirement":"Electricity",
				"name": "Heavy Weapons Factory",
				"size": Size(9, 10),
				"unlockCondition":
				{
					"desc": "500",
					"img": "tiers/engineer"
				}
			}
		},

		"Caoutchouc":
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 2500, 
				"Timber": 8
			},
			"workforce":
			{
				"jornalero": -10
			},
			"depends":
			{ },
			"upkeep": -25,
			"output": 1.0,
			"building":
			{
				"name": "Caoutchouc",
				"size": Size(3, 3),
				"module":
				{
					"count": 144,
					"size": Size(1, 1),
					"cost": 50
				},
				"unlockCondition":
				{
					"desc": "?",///TODO CONFIRM DATA
					"img": "tiers/jornaleros"
				}
			}
		},

		"High_wheeler":
		{
			"costs":
			{
				"credits": 42000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"workforce":
			{
				"engineer": -10
			},
			"depends":
			{ 
				"Steel": 2.0,
				"Caoutchouc": 2.0,
			},
			"upkeep": -1200,
			"output": 2.0,
			"building":
			{
				"requirement": "Electricity image:[assets/icons/Electricity.png]",
				"name": "Bicycle Factory",
				"size": Size(6, 6),
				"unlockCondition":
				{
					"desc": "500",
					"img": "tiers/engineer"
				}
			}
		},

		"Steam_motors":
		{
			"costs":
			{
				"credits": 42000, 
				"Timber": 16,
				"Bricks": 30,
				"Steel_beams": 24,
				"Windows": 20,
				"Reinforced_concrete": 20
			},
			"workforce":
			{
				"engineer": -250
			},
			"depends":
			{ 
				"Brass": 0.667,
				"Steel": 0.667,
			},
			"upkeep": -1800,
			"output": 0.667,
			"building":
			{
				"requirement": "Electricity image:[assets/icons/Electricity.png]",
				"name": "Motor Assembly Line",
				"size": Size(6, 9),
				"unlockCondition":
				{
					"desc": "500",
					"img": "tiers/engineer"
				}
			}
		},

		"Gold_Ore":
		{
			"newWorld": true,
			"costs":
			{
				"credits": 2500, 
				"Timber": 8,
				"Bricks": 15
			},
			"workforce":
			{
				"obrero": -100
			},
			"depends":
			{ },
			"upkeep": -250,
			"output": 0.4,
			"building":
			{
				"requirement": "Gold deposit",
				"name": "Gold Mine",
				"size": Size(3, 3),
				"unlockCondition":
				{
					"desc": "600",
					"img": "tiers/obreros"
				}
			}
		},

		"Gold":
		{
			"costs":
			{
				"credits": 2500, 
				"Timber": 8,
				"Bricks": 15
			},
			"workforce":
			{
				"engineer": -125
			},
			"depends":
			{ 
				"Gold_Ore": 1.0,
				"Coal": 1.0
			},
			"upkeep": -750,
			"output": 1,
			"building":
			{
				"name": "Goldsmiths",
				"size": Size(4, 5),
				"unlockCondition":
				{
					"desc": "1000",
					"img": "tiers/engineer"
				}
			}
		},

		"Pocket_watch":
		{
			"costs":
			{
				"credits": 48000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"workforce":
			{
				"engineer": -150
			},
			"depends":
			{ 
				"Gold": 0667,
				"Glass": 0.667
			},
			"upkeep": -1400,
			"output": 0.667,
			"building":
			{
				"name": "Clockmakers",
				"size": Size(5, 7),
				"unlockCondition":
				{
					"desc": "1000",
					"img": "tiers/engineer"
				}
			}
		},

		"Carbon_filament":
		{
			"costs":
			{
				"credits": 30000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"workforce":
			{
				"engineer": -150
			},
			"depends":
			{ 
				"Coal": 1
			},
			"upkeep": -725,
			"output": 1.0,
			"building":
			{
				"name": "Filament Factory",
				"size": Size(6, 7),
				"unlockCondition":
				{
					"desc": "1750",
					"img": "tiers/engineer"
				}
			}
		},

		"Light_bulb":
		{
			"costs":
			{
				"credits": 45000, 
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"workforce":
			{
				"engineer": -150
			},
			"depends":
			{ 
				"Carbon_filament": 1,
				"Glass": 1
			},
			"upkeep": -1000,
			"output": 1.0,
			"building":
			{
				"name": "Light Bulb Factory",
				"size": Size(6, 7),
				"unlockCondition":
				{
					"desc": "1750",
					"img": "tiers/engineer"
				}
			}
		},

		"Grapes":
		{
			"costs":
			{
				"credits": 8000, 
				"Timber": 10
			},
			"workforce":
			{
				"farmer": -10
			},
			"depends":
			{ },
			"upkeep": -200,
			"output": 0.5,
			"building":
			{
				"requirement": "Grape fertility",
				"name": "Vineyard",
				"size": Size(3, 4),
				"module":
				{
					"count": 128,
					"size": Size(1, 1),
					"cost": 15
				},
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/investor"
				}
			}
		},

		"Champagne":
		{
			"costs":
			{
				"credits": 35000, 
				"Timber": 10,
				"Bricks": 20,
				"Steel_beams": 16,
				"Windows": 15,
				"Reinforced_concrete": 15
			},
			"workforce":
			{
				"artisan": -150
			},
			"depends":
			{ 
				"Glass": 2,
				"Grapes": 2
			},
			"upkeep": -200,
			"output": 2.0,
			"building":
			{
				"name": "Champagne Cellar",
				"size": Size(5, 6),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/investor"
				}
			}
		},

		"Pearls":
		{
			"costs":
			{
				"credits": 8500, 
				"Timber": 10
			},
			"workforce":
			{
				"jornalero": -50
			},
			"depends":
			{ },
			"upkeep": -25,
			"output": 0.667,
			"building":
			{
				"requirement": "Pearl abundance, Free coastline",
				"name": "Pearl Farm",
				"size": Size(6, 14),
				"unlockCondition":
				{
					"desc": "300",
					"img": "tiers/jornaleros"
				}
			}
		},

		"Jewelry":
		{
			"costs":
			{
				"credits": 33000, 
				"Timber": 10,
				"Bricks": 20,
				"Steel_beams": 16,
				"Windows": 15,
				"Reinforced_concrete": 15
			},
			"workforce":
			{
				"artisan": -150
			},
			"depends":
			{ 
				"Pearls": 2.0,
				"Gold": 2.0
			},
			"upkeep": -2500,
			"output": 2.0,
			"building":
			{
				"name": "Jewellers",
				"size": Size(5, 5),
				"unlockCondition":
				{
					"desc": "1750",
					"img": "tiers/investor"
				}
			}
		},

		"Wood_veneers":
		{
			"costs":///TODO CONFIRM DATA
			{
				"credits": 22000, 
				"Timber": 10,
				"Bricks": 20,
				"Steel_beams": 16,
				"Windows": 15,
				"Reinforced_concrete": 15
			},
			"workforce":
			{
				"engineer": -150
			},
			"depends":
			{ 
				"Wood": 1.0
			},
			"upkeep": -750,
			"output": 1.0,
			"building":
			{
				"name": "Marquetry Workshop",
				"size": Size(5, 5),
				"unlockCondition":
				{
					"desc": "750",
					"img": "tiers/investor"
				}
			}
		},

		"Gramophone":
		{
			"costs":///TODO CONFIRM DATA
			{
				"credits": 60000, 
				"Timber": 10,
				"Bricks": 20,
				"Steel_beams": 16,
				"Windows": 15,
				"Reinforced_concrete": 15
			},
			"workforce":
			{
				"engineer": -150
			},
			"depends":
			{ 
				"Wood_veneers": 0.5,
				"Brass": 0.5
			},
			"upkeep": -1600,
			"output": 0.5,
			"building":
			{
				"requirement": "Electricity image:[assets/icons/Electricity.png]",
				"name": "Gramophone Factory",
				"size": Size(7, 7),
				"unlockCondition":
				{
					"desc": "3000",
					"img": "tiers/investor"
				}
			}
		},

		"Chassis":
		{
			"costs":///TODO CONFIRM DATA
			{
				"credits": 56000, 
				"Timber": 10,
				"Bricks": 20,
				"Steel_beams": 16,
				"Windows": 15,
				"Reinforced_concrete": 15
			},
			"workforce":
			{
				"engineer": -150
			},
			"depends":
			{ 
				"Wood": 0.5,
				"Caoutchouc": 0.5
			},
			"upkeep": -1200,
			"output": 0.5,
			"building":
			{
				"name": "Coachmakers",
				"size": Size(6, 9),
				"unlockCondition":
				{
					"desc": "5000",
					"img": "tiers/investor"
				}
			}
		},

		"Steam_carriages":
		{
			"costs":///TODO CONFIRM DATA
			{
				"credits": 115000, 
				"Timber": 20,
				"Bricks": 40,
				"Steel_beams": 32,
				"Windows": 30,
				"Reinforced_concrete": 30
			},
			"workforce":
			{
				"engineer": -500
			},
			"depends":
			{ 
				"Steam_motors": 1.0,
				"Chassis": 1.0
			},
			"upkeep": -3000,
			"output": 1,
			"building":
			{
				"name": "Cab Assembly Line",
				"requirement": "Electricity image:[assets/icons/Electricity.png]",
				"size": Size(8, 12),
				"unlockCondition":
				{
					"desc": "5000",
					"img": "tiers/investor"
				}
			}
		},

		///OLD WORLD ^^^^
		///
		///NEW WORLD >>>>

		"Wood_":
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 500
			},
			"workforce":
			{
				"jornalero": -10
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
			}
		},

		"Timber_":
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 500
			},
			"workforce":
			{
				"jornalero": -20
			},
			"depends":
			{
				"Wood_": 4
			},
			"upkeep": -10,
			"output": 4,
			"building":
			{
				"name": "Sawmill",
				"size": Size(3, 4)
			}
		},
		
		"Cotton":
		{
			"newWorld": true,
			"costs":
			{
				"credits": 500, 
				"Timber_": 6,
			},
			"workforce":
			{
				"jornalero": -10
			},
			"depends":
			{ },
			"upkeep": -5,
			"output": 1.0,
			"building":
			{
				"name": "Cotton Plantation",
				"size": Size(4, 4),
				"module":
				{
					"count": 144,
					"size": Size(1, 1),
					"cost": 5
				},
				"unlockCondition":
				{
					"desc": "?",///TODO CONFIRM DATA
					"img": "tiers/jornaleros"
				}
			}
		},

		"Cotton_fabric":
		{
			"newWorld": true,
			"costs":
			{
				"credits": 500, 
				"Timber_": 6,
			},
			"workforce":
			{
				"jornalero": -10
			},
			"depends":
			{ 
				"Cotton": 2
			},
			"upkeep": -10,
			"output": 2.0,
			"building":
			{
				"name": "Cotton Mill",
				"size": Size(4, 4),
				"unlockCondition":
				{
					"desc": "100", ///TODO CONFIRM DATA
					"img": "tiers/jornaleros"
				}
			}
		},

		"Sails_":
		{
			"newWorld": true,
			"costs": ///TODO CONFIRM DATA
			{
				"credits": 500,
				"Timber_": 8
			},
			"workforce":
			{
				"jornalero": -20
			},
			"depends":
			{
				"Cotton_fabric": 2
			},
			"upkeep": -15,			
			"output": 2.0,
			"building":
			{
				"name": "Sailmakers",
				"size": Size(5, 5),
				"unlockCondition":
				{
					"desc": "?", ///TODO CONFIRM DATA
					"img": "tiers/jornaleros"
				}
			}
		},

		"Plantains":
		{
			"newWorld": true,
			"costs":
			{
				"credits": 500, 
				"Timber_": 6,
			},
			"workforce":
			{
				"jornalero": -10
			},
			"depends":
			{ },
			"upkeep": -5,
			"output": 2.0,
			"building":
			{
				"requirement": "Plantain Fertility image:[assets/resources/Plantains.png]",
				"name": "Plantain Plantation",
				"size": Size(3, 3),
				"module":
				{
					"count": 128,
					"size": Size(1, 1),
					"cost": 5
				},
				"unlockCondition":
				{
					"desc": "?",///TODO CONFIRM DATA
					"img": "tiers/jornaleros"
				}
			}
		},

		"Fish_Oil": 
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 500,
				"Timber_": 6
			},
			"workforce":
			{
				"jornalero": -15
			},
			"depends":
			{ },
			"upkeep": -5,
			"output": 2.0,
			"attractiveness": -5,
			"building":
			{
				"requirement": "Free coastline",
				"name": "Fish Oil Factory",
				"size": Size(5, 8),
				"unlockCondition":
				{
					"desc": "?",///TODO CONFIRM DATA
					"img": "tiers/jornaleros"
				}
			}
		},

		"Fried_plantains": 
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 500,
				"Timber_": 2
			},
			"workforce":
			{
				"jornalero": -25
			},
			"depends":
			{ 
				"Plantains": 2.0,
				"Fish_Oil": 2.0
			},
			"upkeep": -15,
			"output": 2.0,
			"building":
			{
				"name": "Fried Plantain Kitchen",
				"size": Size(3, 4),
				"unlockCondition":
				{
					"desc": "50",
					"img": "tiers/jornaleros"
				}
			}
		},

		"Sugar_cane":
		{
			"newWorld": true,
			"costs":
			{
				"credits": 500, 
				"Timber_": 6,
			},
			"workforce":
			{
				"jornalero": -10
			},
			"depends":
			{ },
			"upkeep": -5,
			"output": 2.0,
			"building":
			{
				"requirement": "Sugar cane fertility image:[assets/resources/Sugar_cane.png]",
				"name": "Sugar Cane Plantation",
				"size": Size(3, 4),
				"module":
				{
					"count": 128,
					"size": Size(1, 1),
					"cost": 5
				},
				"unlockCondition":
				{
					"desc": "100",
					"img": "tiers/jornaleros"
				}
			}
		},

		"Rum":
		{
			"newWorld": true,
			"costs":
			{
				"credits": 2500, 
				"Timber_": 6,
			},
			"workforce":
			{
				"jornalero": -30
			},
			"depends":
			{ 
				"Wood_": 2.0,
				"Sugar_cane": 2.0
			},
			"upkeep": -50,
			"output": 2.0,
			"building":
			{
				"name": "Rum Distillery",
				"size": Size(6, 7),
				"unlockCondition":
				{
					"desc": "100",
					"img": "tiers/jornaleros"
				}
			}
		},

		"Alpaca_wool":
		{
			"newWorld": true,
			"costs":
			{
				"credits": 500, 
				"Timber_": 6,
			},
			"workforce":
			{
				"jornalero": -10
			},
			"depends":
			{ },
			"upkeep": -5,
			"output": 2.0,
			"building":
			{
				"name": "Alpaca Farm",
				"size": Size(3, 3),
				"module":
				{
					"count": 4,
					"size": Size(3, 3),
					"cost": 15
				},
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/jornaleros"
				},
			}
		},

		"Poncho":
		{
			"newWorld": true,
			"costs":
			{
				"credits": 500, 
				"Timber_": 6,
			},
			"workforce":
			{
				"jornalero": -30
			},
			"depends":
			{ 
				"Alpaca_wool": 2,
			},
			"upkeep": -15,
			"output": 2.0,
			"building":
			{
				"name": "Poncho Darner",
				"size": Size(4, 5),
				"unlockCondition":
				{
					"desc": "200",
					"img": "tiers/jornaleros"
				},
			}
		},

		"Clay_":
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 2500,
				"Timber_": 4
			},
			"workforce":
			{
				"obrero": -100
			},
			"depends":
			{ },
			"upkeep": -10,
			"output": 2,
			"building":
			{
				"name": "Clay Pit",
				"size": Size(5, 5),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/obreros"
				},
			}
		},

		"Bricks_":
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 2500,
				"Timber_": 8
			},
			"workforce":
			{
				"obrero": -50
			},
			"depends":
			{
				"Clay_": 1
			},
			"upkeep": -20,
			"output": 2,
			"building":
			{
				"name": "Brick Factory",
				"size": Size(5, 5),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/obreros"
				},
			}
		},

		"Corn_":
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 2500,
				"Timber_": 3
			},
			"workforce":
			{
				"jornalero": -10
			},
			"depends":
			{
				
			},
			"upkeep": -25,
			"output": 1,
			"building":
			{
				"name": "Corn Farm",
				"size": Size(3, 3),
				"module":
				{
					"count": 168,
					"size": Size(1, 1),
					"cost": 5
				},
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/obreros"
				},
			}
		},

		"Beef_":
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 2500,
				"Timber_": 6
			},
			"workforce":
			{
				"jornalero": -20
			},
			"depends":
			{ },
			"upkeep": -25,
			"output": 1,
			"building":
			{
				"name": "Cattle Farm",
				"size": Size(4, 5),
				"module":
				{
					"count": 6,
					"size": Size(3, 4),
					"cost": 50
				},
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/obreros"
				},
			}
		},

		"Tortilla_":
		{
			"newWorld": true,
			"costs": 
			{
				"credits": 2500,
				"Timber_": 3,
				"Bricks_": 2
			},
			"workforce":
			{
				"obrero": -100
			},
			"depends":
			{
				"Beef_": 2,
				"Corn_": 2
			},
			"upkeep": -100,
			"output": 2,
			"building":
			{
				"name": "Cattle Farm",
				"size": Size(3, 5),
				"unlockCondition":
				{
					"desc": "1",
					"img": "tiers/obreros"
				},
			}
		},

		///NEW WORLD ^^^^
	};

	Map buildings = 
	{
		"Dirt_road":
		{
			"name": "Dirt Road",
			"desc": "Connects buildings and allows for transportation of goods.",
			"costs": 
			{
				"credits": 3
			},
			"size": Size(1, 1)
		},
		"Paved_street":
		{
			"name": "Paved Street",
			"desc": "Improves street connections and allows for faster transportation of goods.",
			"costs": 
			{
				"credits": 13,
				"Bricks": 1
			},
			"size": Size(1, 1),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/worker"
			}
		},
		"Railway":
		{
			"name": "Railway",
			"desc": "Allows for transportation of oil by trains.",
			"costs": 
			{
				"credits": 50,
				"Timber": 1,
				"Steel_beams": 1
			},
			"size": Size(1, 1),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/engineer"
			}
		},
		"Quay":
		{
			"name": "Quay",
			"desc": "Beautifies your harbour area. Requires free harbour area.",
			"costs": 
			{
				"credits": 5,
				"Bricks": 1
			},
			"size": Size(1, 1)
		},
		"Marketplace":
		{
			"name": "Marketplace",
			"desc": "A place that provides your inhabitants with all the necessities of daily life.",
			"costs": 
			{
				"credits": 500,
				"Timber": 10
			},
			"upkeep": -20,
			"size": Size(5, 6)
		},
		"Residence":
		{
			"name": "Farmer Residence",
			"desc": "Your residents live here. Residents provide income and workforce.",
			"costs": 
			{
				"Timber": 2.0
			},
			"size": Size(3, 3)
		},
		"Worker_Residence":
		{
			"name": "Worker Residence",
			"desc": "Worker residences are the second-tier types of homes in the game. They are upgraded from farmer residences, provided the needs of the home are met. If a worker's residence has all of its needs met, it can be upgraded into an artisan residence.",
			"costs": 
			{
				"Timber": 6.0
			},
			"size": Size(3, 3),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/farmer"
			}
		},
		"Artisan_Residence":
		{
			"name": "Artisan Residence",
			"desc": "Artisan residences are the third-tier homes in the game. They are upgraded from a worker residence, provided the needs of the home are met. Artisans are capable of jobs that require careful crafting. An artisan residence can be upgraded into an engineer residence, provided the needs of the home are met.",
			"costs": 
			{
				"Timber": 12.0,
				"Bricks": 2.0,
				"Steel_beams": 2.0
			},
			"size": Size(3, 3),
			"unlockCondition":
			{
				"desc": "750",
				"img": "tiers/worker"
			}
		},
		"Engineer_Residence":
		{
			"name": "Engineer Residence",
			"desc": "Engineer residences are the fourth-tier homes in the game. They are upgraded from an artisan residence, provided the needs of the home are met. Engineers are highly educated citizens that are capable of bringing modern age technology into the world through technological revolution. An engineer residence can be upgraded to a investor residence, provided the needs of the home are met.",
			"costs": 
			{
				"Timber": 20.0,
				"Bricks": 5.0,
				"Steel_beams": 4.0,
				"Windows": 2.0
			},
			"size": Size(3, 3),
			"unlockCondition":
			{
				"desc": "1500",
				"img": "tiers/artisan"
			}
		},
		"Investor_Residence":
		{
			"name": "Investor Residence",
			"desc": "Investor residences are the fifth and final tier of Old World population in the game. They are upgraded from engineer residences, provided the needs of the residents are met. Investors are the wealthy elite, members of an upper class who have built fortunes off inheritances or their wit and bare hands.",
			"costs": 
			{
				"Timber": 30.0,
				"Bricks": 9.0,
				"Steel_beams": 7.0,
				"Windows": 5.0,
				"Reinforced_concrete": 3.0
			},
			"influence": 2,
			"size": Size(3, 3),
			"unlockCondition":
			{
				"desc": "1750",
				"img": "tiers/engineer"
			}
		},
		"Warehouse":
		{
			"name": "Small Warehouse",
			"desc": "Accepts and distributes goods from, and to your production buildings.",
			"costs": 
			{
				"credits": 500,
				"Timber": 10
			},
			"upkeep": -20,
			"size": Size(5, 5)
		},
		"Fire_station":
		{
			"name": "Fire Station",
			"desc": "Fights fire in its influence radius. Can mobilise additional special units if required.",
			"costs": 
			{
				"credits": 500,
				"Timber": 4
			},
			"upkeep": -25,
			"size": Size(3, 5),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/farmer"
			}
		},
		"Pub":
		{
			"name": "Small Warehouse",
			"desc": "Provides a public service for your residents.",
			"costs": 
			{
				"credits": 500,
				"Timber": 10
			},
			"upkeep": -20,
			"size": Size(4, 6),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/farmer"
			}
		},
		"Trade_Union":
		{
			"name": "Trade Union",
			"desc": "Only useful if equipped with items. Attach items here to provide bonuses to production.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 25,
				"Bricks": 5
			},
			"upkeep": -50,
			"influence": -20,
			"size": Size(4, 4),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/worker"
			}
		},
		"Church":
		{
			"name": "Church",
			"desc": "Provides a public service for your residents.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 25,
				"Bricks": 25
			},
			"upkeep": -75,
			"size": Size(6, 8),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/worker"
			}
		},
		"Sailing_shipyard":
		{
			"name": "Sailing Shipyard",
			"desc": "Builds ships. Requires free coastline. Can be improved by electricity.",
			"costs": 
			{
				"credits": 10000,
				"Timber": 20,
				"Bricks": 25
			},
			"upkeep": -100,
			"size": Size(6, 15),
			"workforce":
			{
				"worker": 100
			},
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/worker"
			},
			"requirement": "Free harbour area"
		},
		"Depot":
		{
			"name": "Depot",
			"desc": "Increases overall storage capacity by 50 tons. Requires free harbour area.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 10,
				"Bricks": 10
			},
			"upkeep": -20,
			"size": Size(4, 10),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/worker"
			},
			"requirement": "Free harbour area"
		},
		"Harbourmasters_Office":
		{
			"name": "Harbourmaster's Office",
			"desc": "Only useful if equipped with items. Attach items here to provide bonuses to harbour buildings.\nRequires free harbour area.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 20,
				"Bricks": 10
			},
			"upkeep": -50,
			"influence": -20,
			"size": Size(4, 4),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/worker"
			},
			"requirement": "Free harbour area"
		},
		"Mounted_guns":
		{
			"name": "Mounted Guns",
			"desc": "Attacks and slows enemies over a medium range. More accurate up close. Requires free harbour area.",
			"costs": 
			{
				"credits": 2000,
				"Timber": 10,
				"Bricks": 10,
				"Weapons": 5
			},
			"upkeep": -10,
			"influence": -3,
			"size": Size(4, 4),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/worker"
			},
			"requirement": "Free harbour area",
			"range": "Attack Range: 72"
		},
		"Cannon_Tower":
		{
			"name": "Cannon Tower",
			"desc": "Does solid damage to enemies at long range, with good all-round defense. Requires free harbour area.",
			"costs": 
			{
				"credits": 4000,
				"Timber": 10,
				"Bricks": 10,
				"Steel_beams": 8,
				"Weapons": 10
			},
			"upkeep": -30,
			"influence": -7,
			"size": Size(4, 4),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/worker"
			},
			"requirement": "Free harbour area",
			"range": "Attack Range: 92"
		},
		"Big_Betty":
		{
			"name": "Big Betty",
			"desc": "	Deals huge area damage to enemies over a very long range, at the cost of long reload times.",
			"costs": 
			{
				"credits": 22000,
				"Timber": 40,
				"Bricks": 75,
				"Steel_beams": 60,
				"Windows": 60,
				"Reinforced_concrete": 50,
				"Advanced_weapons": 20
			},
			"upkeep": -350,
			"influence": -14,
			"size": Size(4, 6),
			"unlockCondition":
			{
				"desc": "150",
				"img": "tiers/worker"
			},
			"requirement": "Free harbour area",
			"range": "Attack Range: 108"
		},
		"Police_Station":
		{
			"name": "Police Station",
			"desc": "Fights riots in its influence radius. Can mobilise additional special units if required.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 8,
				"Bricks": 10
			},
			"upkeep": -50,
			"size": Size(4, 6),
			"unlockCondition":
			{
				"desc": "500",
				"img": "tiers/worker"
			},
		},
		"School":
		{
			"name": "School",
			"desc": "Provides a public service for your residents.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 20,
				"Bricks": 25,
				"Steel_beams": 20
			},
			"upkeep": -50,
			"size": Size(5, 6),
			"unlockCondition":
			{
				"desc": "750",
				"img": "tiers/worker"
			},
		},
		"Town_Hall":
		{
			"name": "Town Hall",
			"desc": "Only useful if equipped with items. Attach items here to provide bonuses to residences and public buildings.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 20,
				"Bricks": 25,
				"Steel_beams": 20,
				"Windows": 5
			},
			"upkeep": -50,
			"influence": -20,
			"size": Size(4, 4),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/artisan"
			},
			"range": "Radius: 20"
		},
		"Variety_theatre":
		{
			"name": "Variety Theatre",
			"desc": "Provides a public service for your residents.",
			"costs": 
			{
				"credits": 10000,
				"Timber": 30,
				"Bricks": 50,
				"Steel_beams": 40,
				"Windows": 40
			},
			"upkeep": -100,
			"size": Size(4, 5),
			"unlockCondition":
			{
				"desc": "250",
				"img": "tiers/artisan"
			}
		},
		"Public_mooring":
		{
			"name": "Public Mooring",
			"desc": "Enables visitors to make a stopover on your island. Requires free coastline. Limited to one per island.",
			"costs": 
			{
				"credits": 25000,
				"Timber": 20,
				"Bricks": 20,
				"Steel_beams": 10,
				"Windows": 8
			},
			"upkeep": -400,
			"size": Size(8, 25),
			"unlockCondition":
			{
				"desc": "250",
				"img": "tiers/artisan"
			},
			"requirement": "Free coastline"
		},
		"Repair_crane":
		{
			"name": "Repair Crane",
			"desc": "Repairs nearby ships and buildings. Requires free harbour area.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 15,
				"Bricks": 15,
				"Steel_beams": 25
			},
			"upkeep": -50,
			"influence": -3,
			"size": Size(5, 5),
			"unlockCondition":
			{
				"desc": "250",
				"img": "tiers/artisan"
			},
			"requirement": "Free coastline",
			"range": "Radius: 20?" ///TODO CONFIRM DATA
		},
		"Pier":
		{
			"name": "Pier",
			"desc": "Provides additional space for ships to load and unload goods. Requires free harbour area.",
			"costs": 
			{
				"credits": 2500,
				"Timber": 30,
				"Bricks": 50,
				"Steel_beams": 40,
				"Windows": 40
			},
			"upkeep": -50,
			"size": Size(7, 6),
			"unlockCondition":
			{
				"desc": "250",
				"img": "tiers/artisan"
			},
			"requirement": "Free harbour area"
		},
		"Zoo":
		{
			"name": "Zoo",
			"desc": "The zoo is a special building that is unlocked upon reaching 500 Artisans and whose purpose is to increase the attractiveness of an island.\n\nWhile the main building itself does not provide attractiveness, the modules that attach to it gives the player an opportunity to display an Animal per module, up to 100 modules.",
			"costs": 
			{
				"credits": 10000,
				"Timber": 30,
				"Bricks": 30,
				"Steel_beams": 10,
				"Windows": 5
			},
			"upkeep": -100,
			"size": Size(4, 7),
			"unlockCondition":
			{
				"desc": "500",
				"img": "tiers/artisan"
			},
			"module":
			{
				"count": 100,
				"size": Size(4, 6),
				"cost": 500
			},
		},
		"Hospital":
		{
			"name": "Hospital",
			"desc": "Fights illness in its influence radius. Can mobilise additional special units if required.",
			"costs": 
			{
				"credits": 10000,
				"Timber": 12,
				"Bricks": 20,
				"Steel_beams": 16,
				"Windows": 40
			},
			"upkeep": -100,
			"size": Size(6, 6),
			"unlockCondition":
			{
				"desc": "900",
				"img": "tiers/artisan"
			}
		},
		"University":
		{
			"name": "University",
			"desc": "Provides a public service for your residents.",
			"costs": 
			{
				"credits": 15000,
				"Timber": 30,
				"Bricks": 50,
				"Steel_beams": 40,
				"Windows": 40
			},
			"upkeep": -400,
			"size": Size(6, 9),
			"unlockCondition":
			{
				"desc": "1500",
				"img": "tiers/artisan"
			}
		},
		"Museum":
		{
			"name": "Museum",
			"desc": "The Museum is a special building that is unlocked upon reaching 1500 Artisans and whose purpose is to increase the attractiveness of an island.\n\nWhile the main building itself does not provide attractiveness, the modules that attach to it gives the player an opportunity to display an Artifact per module, up to 100 modules.",
			"costs": 
			{
				"credits": 10000,
				"Timber": 30,
				"Bricks": 30,
				"Steel_beams": 10,
				"Windows": 5
			},
			"upkeep": -100,
			"size": Size(5, 8),
			"unlockCondition":
			{
				"desc": "1500",
				"img": "tiers/artisan"
			},
			"module":
			{
				"count": 100,
				"size": Size(4, 5),
				"cost": 500
			},
		},
		"Oil_Harbour":
		{
			"name": "Oil Harbour",
			"desc": "Provides trains for transportation and allows you to store and trade oil (+500 oil storage). Requires free coastline. Limited to one per island.",
			"costs": 
			{
				"credits": 10000,
				"Timber": 20,
				"Bricks": 25,
				"Steel_beams": 20,
				"Windows": 15,
				"Reinforced_concrete": 15
			},
			"upkeep": -100,
			"size": Size(7, 8),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/engineer"
			},
			"requirement": "Free harbour area"
		},
		"Oil_Storage":
		{
			"name": "Oil Storage",
			"desc": "Increases island storage for oil by 200. Requires free harbour area.",
			"costs": 
			{
				"credits": 8000,
				"Timber": 8,
				"Bricks": 15,
				"Steel_beams": 12,
				"Windows": 10,
				"Reinforced_concrete": 10
			},
			"upkeep": -50,
			"size": Size(4, 8),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/engineer"
			},
			"requirement": "Free harbour area"
		},
		"Oil_Power_Plant":
		{
			"name": "Oil Power Plant",
			"desc": "Burns oil to provide electricity to surrounding factories. Requires 1t of oil every 5 seconds.",
			"costs": 
			{
				"credits": 25000,
				"Timber": 30,
				"Bricks": 50,
				"Steel_beams": 40,
				"Windows": 30,
				"Reinforced_concrete": 25
			},
			"workforce":
			{
				"engineer": 150
			},
			"attractiveness": -15,
			"upkeep": -400,
			"size": Size(5, 5),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/engineer"
			}
		},
		"Commuter_pier":
		{
			"name": "Commuter Pier",
			"desc": "Enables the transfer of workforce between two or more islands.",
			"costs": 
			{
				"credits": 25000,
				"Steel_beams": 50,
				"Windows": 40,
				"Reinforced_concrete": 30
			},
			"influence": -15,
			"upkeep": -200,
			"size": Size(5, 4),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/engineer"
			}
		},
		"Steam_shipyard":
		{
			"name": "Steam Shipyard",
			"desc": "Produces steam-powered ships. Requires free coastline. Needs electricity.",
			"costs": 
			{
				"credits": 90000,
				"Timber": 50,
				"Bricks": 100,
				"Steel_beams": 80,
				"Windows": 75,
				"Reinforced_concrete": 75
			},
			"workforce":
			{
				"engineer": 200
			},
			"upkeep": -400,
			"size": Size(7, 17),
			"unlockCondition":
			{
				"desc": "500",
				"img": "tiers/engineer"
			}
		},
		"Bank":
		{
			"name": "Bank",
			"desc": "Provides a public service for your residents.",
			"costs": 
			{
				"credits": 100000,
				"Timber": 40,
				"Bricks": 75,
				"Steel_beams": 60,
				"Windows": 60,
				"Reinforced_concrete": 50
			},
			"workforce":
			{
				"engineer": 200
			},
			"upkeep": -1000,
			"size": Size(12, 10),
			"unlockCondition":
			{
				"desc": "3000",
				"img": "tiers/engineer"
			}
		},
		"Worlds_fair":
		{
			"name": "World's Fair",
			"desc": "The World Fair is the end-game monument building in Anno 1800, available to be constructed upon reaching Tier 5 residents in the Old World. Unlike other buildings, the World Fair is built over several stages, with each stage taking time to complete and requiring a significant amount of goods and a workforce investment for the period of construction for that stage. Upon completion, the World's Fair can host exhibitions which represent the new technology, discovery and exploration of the 19th century, rewarding items upon completion and a temporary Attractiveness Attractiveness bonus for the duration of the exhibition.",
			"costs": 
			{
				"credits": 300000,
				"Timber": 100,
				"Bricks": 200,
				"Steel_beams": 160,
				"Windows": 150,
				"Reinforced_concrete": 150,
			},
			"workforce":
			{
				"farmer": 500
			},
			"size": Size(18, 22),
			"unlockCondition":
			{
				"desc": "1",
				"img": "tiers/investor"
			}
		},
		"Members_club":
		{
			"name": "Members Club",
			"desc": "Provides a public service for your residents.",
			"costs": 
			{
				"credits": 50000,
				"Timber": 50,
				"Bricks": 100,
				"Steel_beams": 80,
				"Windows": 75,
				"Reinforced_concrete": 75,
			},
			"workforce":
			{
				"farmer": 500
			},
			"upkeep": -350,
			"size": Size(6, 6),
			"unlockCondition":
			{
				"desc": "750",
				"img": "tiers/investor"
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