namespace IoTomatoes.Application.Models
{
    public class FarmaSensorMeasurmentDTO
    {
        public int FarmId { get; set; }
        public decimal? Temperature { get; set; }
        public decimal? SoilHumidity { get; set; }
        public decimal? AirHumidity { get; set; }
        public decimal? Light { get; set; }
    }
}
