Config = {
    --Wether to or not to send a embed to discord channel on the first connection from a player.
    sendMsgOnFirstConnect = true,

    --Wether to or not to send a embed to discord channel every time a player connects to the server!
    sendMsgOnConnect = true,

    --The webhook to send the embed to.
    --If you don't know how to create a Webhook, read https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks
    --Where to send MsgOnFirstConnect!
    webhookFirstConnect = "DISCORD_WEBHOOK",
    --Where to send MsgOnConnect!
    webhookConnect = "DISCORD_WEBHOOK",
}

_T = {
    -- The name of the player is displayed as the title. So you could just write "conntect to the server for the first time" as description! Here, you can use _ and * to change the font.
    -- First connect message.
    firstConnect = "*conntect to the server* __for the first time__",
    -- Other times someone connects.
    usalConnect = "*connected to the server*",
    --After that it will print the identifiers.
}