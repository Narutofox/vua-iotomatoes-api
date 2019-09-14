using IoTomatoes.Domain.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Persistence.Commons;
using System;
using System.Collections.Generic;
using System.Linq;

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

        public FarmSensorMeasurement GetLastSensorMeasurement(int farmSensorId)
        {
            return Context.FarmSensorMeasurements
                .Where(fsm => fsm.FarmSensorId.Equals(farmSensorId))
                .OrderByDescending(x=>x.DateCreated)
                .FirstOrDefault();

        }

        public IQueryable<FarmSensor> SelectFarmSensors()
        {
            return Context.FarmSensors;
        }

        public IQueryable<MeasuringUnit> SelectMeasuringUnits() 
        { 
            return Context.MeasuringUnits;
        }

        public IQueryable<Sensor> SelectSensors()
        {
            return Context.Sensors;
        }

        public IQueryable<FarmSensorMeasurement> SelectFarmSensorMeasurements()
        {
            return Context.FarmSensorMeasurements;
        }

        public IQueryable<SensorType> SelectSensorTypes()
        {
            return Context.SensorTypes;
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
                sensorQuery = sensorQuery.Where(x => x.DateCreated.Value.Date.Equals(dateFrom.Value.Date));
            }

            var farmSensorMeasurements = sensorQuery
                .OrderBy(x => x.DateCreated)
                .ToList();

            return farmSensorMeasurements;
        }
    }
}
