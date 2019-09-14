using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;

namespace IoTomatoes.Api.Hubs
{
    public class SensorMeasurementHub : Hub
    {
        public async Task SensorMeasurementNotificationSubscribe(int farmId)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, "FarmId:" + farmId);
        }

        public async Task SensorMeasurementNotificationUnSubscribe(int farmId)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, "FarmId:" + farmId);
        }

        //public async Task SensorMeasurementNotification(int farmId)
        //{
        //    await Clients.Group("FarmId:" + farmId).SendAsync("SensorMeasurementNotification", farmId);
        //}
    }
}
