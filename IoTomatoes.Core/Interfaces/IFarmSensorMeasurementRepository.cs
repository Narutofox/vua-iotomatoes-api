using IoTomatoes.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IoTomatoes.Domain.Interfaces
{
    public interface IFarmSensorMeasurementRepository : IGenericRepository<FarmSensorMeasurement>
    {
        List<FarmSensorMeasurement> GetBySensorId(int sensorId);
        List<FarmSensorMeasurement> GetSensorMeasurements(int farmSensorId, DateTime? dateFrom, DateTime? dateTo);
        FarmSensorMeasurement GetLastSensorMeasurement(int farmSensorId);
        IQueryable<FarmSensor> SelectFarmSensors();
        IQueryable<MeasuringUnit> SelectMeasuringUnits();
        IQueryable<Sensor> SelectSensors();
        IQueryable<FarmSensorMeasurement> SelectFarmSensorMeasurements();
        IQueryable<SensorType> SelectSensorTypes();        
    }
}
