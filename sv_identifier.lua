-- DO NOT EDIT ANYTHING HERE; YOU ARE PROHIBITED AND YOU CAN RUIN THE RESOURCE! --

local location = '^1{^2TPF^1}^7 ~ '

-- Saving identifiers of all players connecting to the server. Using MySQL-Async
-- With that, also demanding a Steamid, (steam opened). Turn off this whole script if you'd not want to prohibit users without steam!

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    local steamid
    local license
    local license2
    local discord
    local fivem
    local xbl
    local ip
    deferrals.defer()
    Wait(10)

    for k, v in ipairs(identifiers) do
        if string.match(v, "steam") then
            steamid = v -- Adding players' steamid to "steamid"
        elseif string.match(v, "license:") then -- Using ":" to make sure we get the right license. There's two!
            license = v -- Adding players' license to "license"
        elseif string.match(v, "license2:") then
            license2 = v -- Adding players' license2 to "license2"
        elseif string.match(v, "discord") then
            discord = v -- Adding players' discord to "discord"
        elseif string.match(v, "fivem") then
            fivem = v -- Adding players' fivem to "fivem"
        elseif string.match(v, "xbl:") then
            xbl = v -- Adding players' xbl to "xbl"
        elseif string.match(v, "ip") then
            ip = v -- Adding players' ip to "ip"
        end
    end
    deferrals.update('Hämtar ditt steamid!') -- Update message to the user!
    Wait(10)

    if not steamid then -- Checks if a steamid is avaiable 
        deferrals.done('\nInget Steamid hittades! Har du steam öppet?')
        return
    end
    deferrals.update('Steamid hittades! Fortsätter!')
    Wait(10)

    MySQL.Async.fetchScalar('SELECT 1 FROM identifiers WHERE steamid = @steamid', {
        ["@steamid"] = steamid
    }, function(result)
        if not result then
            deferrals.update('Inför ditt steamid till databasen!')
            Wait(5)

            MySQL.Async.execute('INSERT INTO identifiers (steamname, steamid, license, license2, discord, fivem, xbox, ip) VALUES (@steamname, @steamid, @license, @license2, @discord, @fivem, xbox, @ip)', {
                ["@steamname"] = GetPlayerName(src), ["@steamid"] = steamid, ["@license"] = license, ["@license2"] = license2, ["@discord"] = discord, ["@fivem"] = fivem, ["@xbox"] = xbl, ["@ip"] = ip
            })
            deferrals.update('Införning avklarad, ansluter dig till servern!')
            Wait(10)
            deferrals.done()
            if Config.sendMsgOnFirstConnect then
                TriggerEvent('TPF-Logs:newPlayerConnect', src, steamid, license, discord, fivem, xbl, ip)
            end
        else
            deferrals.update('Identifierare hittades i databasen, uppdatterar resterande!')
            MySQL.Async.execute('UPDATE identifiers SET steamname = @steamname, license = @license, license2 = @license2, discord = @discord, fivem = @fivem, xbox = @xbox WHERE steamid = @steamid', {
                ["@steamname"] = GetPlayerName(src), ["@license"] = license, ["@license2"] = license2 ,["@discord"] = discord, ["@fivem"] = fivem, ["@xbox"] = xbl, ["@steamid"] = steamid
            })
            deferrals.update('Uppdatering avklarad, ansluter dig till servern!')
            Wait(10)
            deferrals.done()

            if Config.sendMsgOnConnect then
                TriggerEvent("TPF-Logs:playerConnect", src, steamid, license, discord, fivem, xbl, ip)
            end
        end
    end)
end)

RegisterServerEvent('TPF-Logs:newPlayerConnect')
AddEventHandler('TPF-Logs:newPlayerConnect', function(src, steamid, license, discord, fivem, xbl, ip)
    if steamid == nil then
        steamid = "Inget hittades"
    end
    if license == nil then
        license = "Inget hittades"
    end
    if discord == nil then
        discord = "Inget hittades"
    end
    if fivem == nil then
        fivem = "Inget hittades"
    end
    if xbl == nil then
        xbl = "Inget hittades"
    end
    if ip == nil then
        ip = "Inget hittades"
    end

    local steamLog = string.gsub(steamid, "steam:", "")
    local licenseLog = string.gsub(license, "license:", "")
    local discordLog = string.gsub(discord, "discord:", "")
    local fivemLog = string.gsub(fivem, "fivem:", "")
    local xblLog = string.gsub(xbl, "xbl:", "")
    local ipLog = string.gsub(ip, "ip:", "")

    local name = GetPlayerName(src)
    local message = '' .. _T.firstConnect .. '\n\n**Steam:** ' .. steamLog .. "\n**License:** " .. licenseLog .. "\n**Discord:** " .. discordLog ..  "\n**FiveM:** " .. fivemLog .. "\n**Xbox Live:** " .. xblLog .. "\n**IP:** " .. ipLog .. ""
    local footer = os.date("%y/%m/%d %X")
    discordFirstConnect(16711680, name, message, footer)
end)

RegisterServerEvent('TPF-Logs:playerConnect')
AddEventHandler('TPF-Logs:playerConnect', function(src, steamid, license, discord, fivem, xbl, ip)
    if steamid == nil then
        steamid = "Inget hittades"
    end
    if license == nil then
        license = "Inget hittades"
    end
    if discord == nil then
        discord = "Inget hittades"
    end
    if fivem == nil then
        fivem = "Inget hittades"
    end
    if xbl == nil then
        xbl = "Inget hittades"
    end
    if ip == nil then
        ip = "Inget hittades"
    end

    local steamLog = string.gsub(steamid, "steam:", "")
    local licenseLog = string.gsub(license, "license:", "")
    local discordLog = string.gsub(discord, "discord:", "")
    local fivemLog = string.gsub(fivem, "fivem:", "")
    local xblLog = string.gsub(xbl, "xbl:", "")
    local ipLog = string.gsub(ip, "ip:", "")

    local name = GetPlayerName(src)
    local message = '' .. _T.usalConnect .. '\n\n**Steam:** ' .. steamLog .. "\n**License:** " .. licenseLog .. "\n**Discord:** " .. discordLog ..  "\n**FiveM:** " .. fivemLog .. "\n**Xbox Live:** " .. xblLog .. "\n**IP:** " .. ipLog .. ""
    local footer = os.date("%y/%m/%d %X")
    discordPlayerConnect(16711680, name, message, footer)
end)

function discordFirstConnect(color, name, message, footer)
    local embed = {
        { 
            ["color"] = color,
            ["title"] = "**" .. name .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer
            }
        }
    }
    PerformHttpRequest(Config.webhookFirstConnect, function(err, text, headers) end, 'POST', json.encode({username = "TPF Logs", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function discordPlayerConnect(color, name, message, footer)
    local embed = {
        { 
            ["color"] = color,
            ["title"] = "**" .. name .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer
            }
        }
    }
    PerformHttpRequest(Config.webhookConnect, function(err, text, headers) end, 'POST', json.encode({username = "TPF Logs", embeds = embed}), { ['Content-Type'] = 'application/json' })
end