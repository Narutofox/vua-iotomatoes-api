using IoTomatoes.Domain.Models;
using IoTomatoes.Domain.Interfaces;
using IoTomatoes.Persistence.Commons;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace IoTomatoes.Persistence.Repositories
{
    public class FarmSensorMeasurementRepository: GenericRepository<FarmSensorMeasurement>, IFarmSensorMeasurementRepository
    {
        private IoTomatoesContext Context => (IoTomatoesContext)_context;
        public FarmSensorMeasurementRepository(IoTomatoesContext context) : base(context) { }

        public List<FarmSensorMeasurement> GetBySensorId(int sensorId)
        {
            return Context.FarmSensorMeasurements
                .Where(fsm => fsm.FarmSensorId == sensorId)
                .ToList();
        }
    }
}
