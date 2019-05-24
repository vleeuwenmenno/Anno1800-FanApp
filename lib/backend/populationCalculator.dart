
import 'dart:io';

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
			"output": 2.0
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
			"output": 2.0
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
			"output": 2.0
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
			"output": 2.0
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
			"output": 2.0
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
			"output": 2.0
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
			"output": 2.0
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
			"output": 2.0
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
			"output": 1.0
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
			"output": 1.0
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
			"output": 1.0
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
			"output": 2.0
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
			"output": 1.0
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
			"output": 2.0
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
			"output": 0.667
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
			"output": 1.0
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
			"output": 4
		},

		"Coal":
		{
			"Kiln":
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
				"output": 2.0
			},
			"Mine":
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
				"output": 4
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
			"output": 2.0
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
			"output": 1.333
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
			"output": 0.667
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
			"output": 1.0
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
			"output": 2.0
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