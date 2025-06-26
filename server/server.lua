math.randomseed(os.time())

local function determineSuccess()
    if Config.OutcomeMode == "fixed" then
        return math.random() < Config.SuccessChance
    elseif Config.OutcomeMode == "balanced" then
        return math.random(0, 1) == 1
    else
        return math.random(0, 99) < math.random(0, 100)
    end
end

local function logToDiscord(playerName, message, outcome)
    if not Config.WebhookURL or Config.WebhookURL == "" then return end

    local embed = {
        {
            title = "Try Attempt",
            color = outcome == "succeeded" and 65280 or 16711680,
            fields = {
                {name = "Player", value = playerName, inline = true},
                {name = "Outcome", value = outcome, inline = true},
                {name = "Message", value = message, inline = false}
            },
            footer = {
                text = "FiveM Try Log \226\128\162 " .. os.date("%Y-%m-%d %H:%M:%S")
            }
        }
    }

    PerformHttpRequest(Config.WebhookURL, function() end, "POST", json.encode({
        username = "Try Logger",
        embeds = embed
    }), {
        ["Content-Type"] = "application/json"
    })
end

RegisterNetEvent("try:attempt", function(msg, coords)
    local src = source
    local playerName = GetPlayerName(src)
    local success = determineSuccess()

    local result = string.format(
        "%s has tried %s and it %s.",
        playerName,
        msg,
        success and "succeeded" or "failed"
    )

    local color = success and {0, 255, 0} or {255, 0, 0}

    for _, id in ipairs(GetPlayers()) do
        local ped = GetPlayerPed(id)
        if ped then
            local targetCoords = GetEntityCoords(ped)
            local dist = #(targetCoords - vector3(coords.x, coords.y, coords.z))
            if dist <= Config.ProximityDistance then
                TriggerClientEvent("chat:addMessage", id, {
                    color = color,
                    args = {"Try", result}
                })
            end
        end
    end

    logToDiscord(playerName, msg, success and "succeeded" or "failed")
end)
