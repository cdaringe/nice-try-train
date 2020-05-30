function on_pre_death(evt)
  player = game.players[evt.player_index]
  player_force = player.force
  if evt.cause ~= nil and evt.cause.train ~= nil then
	train_force = evt.cause.force
	if player_force.index == train_force.index then
	  player.character.health = 1
	end
  end
end
script.on_event(defines.events.on_pre_player_died, on_pre_death)
