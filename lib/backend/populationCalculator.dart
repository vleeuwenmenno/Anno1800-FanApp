
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
			"Fur_coats":		0.0013333335,
			"University":		0.0,
			"Glasses":			0.000222222,
			"Coffee":			0.0011764710000000001,
			"Pocket_watches":	0.0001960785,
			"Electricity":		0.0,
			"Light_bulbs":		0.0003124995,
			"luxury": 
			{
				"Variety_theatre":		0.0,
				"Rum":					0.002857143,
				"High_wheelers":		0.0006250005000000001,
				"Pocket_watches":		0.0001960785,
				"Bank":					0.0,
			}
		},

		"investor":
		{
			"Residence":		0.02,
			"Glasses":			0.0003555552,
			"High_wheelers":	0.0009999995999999999,
			"Coffee":			0.0018823524,
			"Pocket_watches":	0.0003137256,
			"Electricity":		0.0,
			"Light_bulbs":		0.0005000004,
			"Bank":				0.0,
			"Champagne":		0.0004704,
			"Cigars":			0.000444444,
			"Chocolate":		0.0010666668,
			"Steam_carriages":	0.00013333319999999998,
			"luxury": 
			{
				"High_wheelers":	0.0006250005000000001,
				"Pocket_watches":	0.0001960785,
				"Bank":				0.0,
				"Jewelry":			0.00042105239999999997,
				"Gramophones":		0.00010524,
				"Members_club":		0.0,
			}
		}
	};

	Map produce = 
	{
		/// Farmers
		"Fish": 2,
		"Work_clothes": 2,
		"Schnapps": 2,
		/// Farmers ^^^^
		
		/// Workers
		"Sausages": 1,
		"Bread": 1,
		"Soap": 2,
		"Beer": 1,
		/// Workers ^^^^
		
		/// Artisans
		"Canned_food": 1,
		"Sewing_machines": 2,
		"Rum": 2,
		"Fur_Coats": 2,
		/// Artisans ^^^^


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
						"efficiency": residency / (produce['${tier}_Residence'] * houses),
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
							"efficiency": tons / ((tons / produce[luxKey]).ceil() * produce[luxKey]),
							"buildings": (tons / produce[luxKey]).ceil()
						};
					}
				}
				else
				{
					double tons = value * population; /// Total needs (tons = consumption * population)
					returnData[key] = 
					{
						"tonsNeeded": tons,
						"efficiency": tons / ((tons / produce[key]).ceil() * produce[key]),
						"buildings": (tons / produce[key]).ceil()
					};
				}
			}
		}
		catch (e)
		{ }

		return returnData;
	}
}