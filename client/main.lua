RegisterCommand("try", function(_, args)
    if #args == 0 then
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            args = {"System", "Usage: /try [your action]"}
        })
        return
    end

    local msg = table.concat(args, " ")
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    TriggerServerEvent("try:attempt", msg, coords)
end, false)
