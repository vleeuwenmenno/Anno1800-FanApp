
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
		}
	};

	Map produce = 
	{
		/// Farmers
		"Fish": 2,
		"Work_clothes": 2,
		"Schnapps": 2,
		/// Farmers ^^^^


		/// Residences
		"farmer_Residence": 10,
		"worker_Residence": 20,
		"artisian_Residence": 30,
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
					
					while (residency / (produce['${tier}_Residence'] * houses) > 1) /// While the efficiency is above 100%
						houses++;
					
					returnData["Residence"] = 
					{
						"buildings": residency.ceil(),
						"efficiency": residency / (produce['${tier}_Residence'] * houses),
					};
				}
				else
				{
					double tons = value * population; /// Total needs
					int building = 1;
					
					while (tons / (produce[key] * building) > 1) /// While the efficiency is above 100%
						building++;

					returnData[key] = 
					{
						"tonsNeeded": tons,
						"efficiency": tons / (produce[key] * building),
						"buildings": building
					};
				}
			});
		}
		catch (e)
		{

		}

		return returnData;
	}
}