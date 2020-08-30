namespace IoTomatoes.Application.Models
{
    public class SensorDTO
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public int SensorTypeId { get; set; }
        public string SensorTypeName { get; set; }
        public string SensorTypeCode { get; set; }
        public string MeasuringUnitName { get; set; }
        public string MeasuringUnitCode { get; set; }
        public int MeasuringUnitId { get; set; }
    }
}
