SEARCH_RANGE = 1
function on_pre_death(evt, cause)
  player = game.players[evt.player_index]
  local trains = player.surface.find_entities_filtered
  {
    area =
    {{player.position.x - SEARCH_RANGE, player.position.y - SEARCH_RANGE},
    {player.position.x + SEARCH_RANGE, player.position.y + SEARCH_RANGE}},
    type= "locomotive"
  }
  if #trains > 0 then
    player.character.health = 1
  end
end
script.on_event(defines.events.on_pre_player_died, on_pre_death)
