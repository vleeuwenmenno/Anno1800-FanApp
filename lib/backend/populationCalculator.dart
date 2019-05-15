
class PopulationCalculator
{
	Map needs = 
	{
		"farmer": 
		{
			"Residence":    0.1,
			"Fish":         0.0025,
			"Work_clothes": 0.00307692,
			"Schnapps":     0.00333334
		},
		
		"worker":
		{
			"Residence":    0.05,
			"Fish":         0.0025,
			"Work_clothes": 0.00307692,
			"Schnapps":     0.00333334,
			"Sausages":     0.001000002,
			"Bread":        0.00090909,
			"Soap":         0.000416667,
			"Beer":         0.00076923
		},

		"artisan":
		{
			"Residence":       0.0333333333,
			"Sausages":        0.001333334,
			"Bread":           0.001212122,
			"Soap":            0.000555556,
			"Beer":            0.001025642,
			"Canned_food":     0.00034188,
			"Sewing_machines": 0.00095238,
			"Rum":             0.001904762,
			"Fur_Coats":       0.000888888,  
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
		
		try
		{
			needs[tier].forEach((String key, double value)
			{
				if (key == "Residence")
				{
					double residency = value * population; /// Total needs
					int houses = 1;
					
					returnData["Residence"] = 
					{
						"buildings": residency.ceil(),
						"efficiency": residency / (produce['${tier}_Residence'] * houses),
					};
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
			});
		}
		catch (e)
		{ }

		return returnData;
	}
}