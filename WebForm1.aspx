<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SignalRSimpleChat.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.6.4.js" type="text/javascript" ></script>
    <script src="Scripts/jquery.signalR-2.2.0.js" type="text/javascript" ></script>
    <script type="text/javascript" src="signalr/hubs" ></script>
</head>
<body>
    <div>
        <input type="text" name="message" id="message" />
        <input type="button" name="sendMessage" id="sendMessage" value="Send" />
        <ul id="messageList"></ul>
    </div>
    <script>
        $(function () {
            var chat = $.connection.myChatHub;
            chat.client.addMessage = function (message) {

                $('#messageList').append('<li>' + message + '</li>');
            };

            $('#sendMessage').click(function () {
                chat.server.send($('#message').val());
            });

            $.connection.hub.start();
        });
    </script>
</body>
</html>
