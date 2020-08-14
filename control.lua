function on_pre_death(evt)
    if evt.cause ~= nil and evt.cause.train ~= nil then
        setting = settings.global["nice-try-train-friendly-setting"].value
        player = game.players[evt.player_index]
        player_force = player.force
        train_force = evt.cause.force
        player.print("setting: " .. setting .. "\nplayer: " .. player.name .. "\nplayer_force: " .. player_force.index .. "\ntrain_force: " .. train_force.index)
        if setting == "my-trains" and player_force.index == train_force.index then
            player.character.health = 1
        elseif setting == "all-trains" then
            player.character.health = 1
        elseif setting == "friend-trains" and (train_force.get_friend(player_force) or train_force.index == player_force.index)then
            player.character.health = 1
        end
    end
end

script.on_event(defines.events.on_pre_player_died, on_pre_death)
