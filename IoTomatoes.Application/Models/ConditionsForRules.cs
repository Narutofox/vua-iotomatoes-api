using System;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Application.Models
{
    public class ConditionsForRules
    {
        public int MinimumTemperature { get; set; }
        public int MaximumTemperature { get; set; }

        public int MinimumSoilHumidity { get; set; }
        public int MaximumSoilHumidity { get; set; }

        public DateTime? LightTimeSwitchOn { get; set; }
        public DateTime? LightTimeSwitchOff { get; set; }

        public void SetModelFromList(List<ConditionsForRules> conditions)
        {
            if (conditions.Any(x => x.MinimumTemperature > 0))
            {
                MinimumTemperature = conditions.First(x => x.MinimumTemperature > 0).MinimumTemperature;
            }
            if (conditions.Any(x => x.MaximumTemperature > 0))
            {
                MaximumTemperature = conditions.First(x => x.MaximumTemperature > 0).MaximumTemperature;
            }
            if (conditions.Any(x => x.MinimumSoilHumidity > 0))
            {
                MinimumSoilHumidity = conditions.First(x => x.MinimumSoilHumidity > 0).MinimumSoilHumidity;
            }
            if (conditions.Any(x => x.MaximumSoilHumidity > 0))
            {
                MaximumSoilHumidity = conditions.First(x => x.MaximumSoilHumidity > 0).MaximumSoilHumidity;
            }

            if (conditions.Any(x => x.LightTimeSwitchOn.HasValue))
            {
                LightTimeSwitchOn = conditions.First(x => x.LightTimeSwitchOn.HasValue).LightTimeSwitchOn;
            }
            if (conditions.Any(x => x.LightTimeSwitchOff.HasValue))
            {
                LightTimeSwitchOff = conditions.First(x => x.LightTimeSwitchOff.HasValue).LightTimeSwitchOff;
            }
        }
    }
}
