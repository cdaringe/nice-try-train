function on_pre_death(evt)
    if evt.cause ~= nil and evt.cause.train ~= nil then
        setting = settings.global["nice-try-train-friendly-setting"]
        player = game.players[evt.player_index]
        player_force = player.force
        train_force = evt.cause.force
        if setting == "nice-try-train-my-trains" and player_force.index == train_force.index then
            player.character.health = 1
        elseif setting == "nice-try-train-all-trains" then
            player.character.health = 1
        elseif setting == "nice-try-train-friend-trains" and train_force.get_friend(player_force) then
            player.character.health = 1
        end
    end
end

script.on_event(defines.events.on_pre_player_died, on_pre_death)
