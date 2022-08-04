# Identifiers 
Got an request asking me to make a Resource where the identifiers, ID's, gets saved to the database, and sends them to the Discord!
Since I already had a script saving ID's to HeidiSQL, I decided to upgrade that!

So, for it to work, you have to save the ID's to the Database, which this script does! Although if you happen to delete a Row, the script will recoginize the player as the first connection.
**How it works:**
The script checks if the players Steamid exists in the database, if not, it recoginizes as "New player" and sends the message to discord. Although, if you enable "sendMsgOnConnect" it will send a message to Discord anyways, with Identifiers. This can all be disabled in the Config.lua. Also, there you add the WEBHOOKS.

# I TRULY
recommend that you DO NOT log the IP to a Discord server! Sertanly not if you have multiple people that can access these logs!
If you'd like to remove something from the log, perhaps IP, navigate to where. Either "playerConnect" or "newPlayerConnect" events.

Then, go to "local message". Then delete from the begining of "\nIP" (speachmark included) to the .. after ipLog.
If you experience problems, please make a GitHub issue or contact me via Discord.
Tuggummi#7842

## Installation Process
**[EN]**
1. Download the script from the GitHub, rename it to "Identifiers" and put it where you'd like. (Somewhere in the resource folder!)
2. Make sure you have a HeidiSQL Database set up, it's working and accessble.
3. Run the SQL file, and it should create one Table named "identifiers". DO NOT CHANGE ANYTHING!
4. Open the config, add the WEBHOOKS and configure when it should send the Message to discord. 
5. Make sure you've started the resource in the server.cfg and start the server! 
###### SE
1. Ladda ner scriptet från GitHub, se till att namnet är "Identifiers" och lägg det någonstans i Resource mappen.
2. Se till att du har en HeidiSQL Databas som fungerar och åtkomlig.
3. Kör SQL filen, det borde skapas en tabell med namnet "identifiers". RÖR INGET!
4. Öppna Config.lua filen, lägg till WEBHOOKS och konfiguera när det ska skrivas till Discord, och vad.
5. Se till att du har startat den i server.cfg, starta servern!

# DEPENDENCIES
**MYSQL-ASYNC** is required!