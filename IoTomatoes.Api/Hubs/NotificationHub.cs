using IoTomatoes.Application.Models;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IoTomatoes.Api.Hubs
{
    public class NotificationHub : Hub
    {
        public NotificationHub()
        {

        }
        
        public Task SendMeasurements(FarmMeasurements data)
        {
            string json = JsonConvert.SerializeObject(data);
            return Clients.All.SendAsync("ReceiveMeasurements", json);
        }

        public override Task OnConnectedAsync()
        {
            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            return base.OnDisconnectedAsync(exception);
        }
    }
}
