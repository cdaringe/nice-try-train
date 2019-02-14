SEARCH_RANGE = 2
function on_pre_death(evt, cause)
  player = game.players[evt.player_index]
  local search_area = {
    {player.position.x - SEARCH_RANGE, player.position.y - SEARCH_RANGE},
    {player.position.x + SEARCH_RANGE, player.position.y + SEARCH_RANGE}
  }
  local trains = player.surface.find_entities_filtered
  {
    area = search_area,
    type= "locomotive"
  }
  local cargo_wagons = player.surface.find_entities_filtered
  {
    area = search_area,
    type= "cargo-wagon"
  }
  local fluid_wagons = player.surface.find_entities_filtered
  {
    area = search_area,
    type= "fluid-wagon"
  }
  if #trains > 0 or #cargo_wagons > 0 or #fluid_wagons > 0 then
    player.character.health = 1
  end
end
script.on_event(defines.events.on_pre_player_died, on_pre_death)
