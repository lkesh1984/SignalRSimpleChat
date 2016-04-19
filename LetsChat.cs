using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SignalRSimpleChat
{
	[HubName("myChatHub")]
	public class LetsChat : Hub
	{
		public void JoinRoom(string roomName)
		{
			Groups.Add(this.Context.ConnectionId, roomName);
			Clients.Group(roomName).addMessage(Context.User.Identity.Name + " has joined...");
		}

		public void LeaveRoom(string roomName)
		{
			Groups.Remove(this.Context.ConnectionId, roomName);
		}

		public void Send(string message)
		{
			//Clients.All.addMessage(message);

			//Clients.Caller.addMessage(message);

			Clients.Others.addMessage(message);
		}
	}
}