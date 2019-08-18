SEARCH_RANGE = 2
function on_pre_death(evt, cause)
  player = game.players[evt.player_index]
  local search_area = {
    {player.position.x - SEARCH_RANGE, player.position.y - SEARCH_RANGE},
    {player.position.x + SEARCH_RANGE, player.position.y + SEARCH_RANGE}
  }
  local death_machines = player.surface.find_entities_filtered
  {
    area = search_area,
    type= {"locomotive", "cargo-wagon", "fluid-wagon"}
  }
  if #death_machines > 0 then
    player.character.health = 1
  end
end
script.on_event(defines.events.on_pre_player_died, on_pre_death)
