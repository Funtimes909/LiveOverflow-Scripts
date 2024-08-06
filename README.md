# LiveOverflow-Scripts

I should probably explain how this works/how I found the server IP address, it's pretty simple.

The information I was given to find the server consisteded of a dumb down version of the server icon, the IP ranges of the VPS provider that was hosting the server (Around 2.3 million addresses at the time of writing) and that the servers MOTD was "A Minecraft Server" (How informative!)

The first step was scanning the IP ranges I was given using [Masscan](https://github.com/robertdavidgraham/masscan) for existing minecraft servers within that IP range. 
This gave me a list of currently active minecraft servers that I could then pipe directly into base64.sh and ping all of those servers again to get the server info from in JSON format. 
Left that to run overnight and in the morning I had a folder of all the information about each and every online server in a file with it's IP address as the file name. then I simply ran decode-base64 over each file, grepping for the base64 encoded image and converting it back into a png and saving it.
After all that I simply just had to go through the images folder and scroll down until I found any icon that looked like the original server icon and once I found a match the IP address was the file name.

You are free to use these scripts and this method to find the server on your own.

# Software used

[Masscan](https://github.com/robertdavidgraham/masscan)
[MCPTool](https://github.com/wrrulos/MCPTool)
[MCStatus](https://github.com/py-mine/mcstatus)
