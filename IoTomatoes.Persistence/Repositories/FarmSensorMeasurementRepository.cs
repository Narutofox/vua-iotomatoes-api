using IoTomatoes.Domain.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Persistence.Commons;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace IoTomatoes.Persistence.Repositories
{
    public class FarmSensorMeasurementRepository : GenericRepository<FarmSensorMeasurement>, IFarmSensorMeasurementRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public FarmSensorMeasurementRepository(IoTomatoesContext context) : base(context) { }

        public List<FarmSensorMeasurement> GetBySensorId(int sensorId)
        {
            return Context.FarmSensorMeasurements
                .Where(fsm => fsm.FarmSensorId == sensorId)
                .ToList();
        }

        public List<FarmSensorMeasurement> GetSensorMeasurements(int farmSensorId, DateTime? dateFrom, DateTime? dateTo)
        {
            var sensorQuery = Context.FarmSensorMeasurements
                    .Where(fsm => fsm.FarmSensorId == farmSensorId);

            if (dateFrom.HasValue && dateTo.HasValue)
            {
                sensorQuery = sensorQuery.Where(x => x.DateCreated >= dateFrom.Value && x.DateCreated <= dateTo.Value);
            } 
            else if(dateFrom.HasValue && !dateTo.HasValue)
            {
                sensorQuery = sensorQuery.Where(x => x.DateCreated.Equals(dateFrom.Value));
            }

            var farmSensorMeasurements = sensorQuery
                .OrderBy(x => x.DateCreated)
                .ToList();

            return farmSensorMeasurements;
        }
    }
}
