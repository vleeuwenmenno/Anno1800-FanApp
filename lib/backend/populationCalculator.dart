
class PopulationCalculator
{
	Map needs = 
	{
		"farmer": 
		{
			"Market":       0.0,
			"Residence":    0.1,
			"Fish":         0.0025,
			"Work_clothes": 0.00307692,
			"luxury": 
			{
				"Schnapps":  0.00333334,
				"Pub":       0.0
			}
		},
		
		"worker":
		{
			"Market":       0.0,
			"Residence":    0.05,
			"Fish":         0.0025,
			"Work_clothes": 0.00307692,
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
			"Residence":       0.0333333333,
			"Sausages":        0.001333334,
			"Bread":           0.001212122,
			"Soap":            0.000555556,
			"Canned_food":     0.00034188,
			"Sewing_machines": 0.00095238,
			"Fur_Coats":       0.000888888,  
			"luxury": 
			{
				"Church":          0.0,
				"Beer":            0.001025642,
				"Variety_theatre": 0.0,
				"Rum":             0.001904762,
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