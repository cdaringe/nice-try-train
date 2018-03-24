--control.lua

script.on_event({defines.events.on_tick},
   function (e)
      if e.tick % 60 == 0 then --common trick to reduce how often this runs, we don't want it running every tick, just 1/second
         for index,player in pairs(game.connected_players) do  --loop through all online players on the server

            --if they're wearing our armor
            if player.character and player.get_inventory(defines.inventory.player_armor).get_item_count("fire-armor") >= 1 then
               --create the fire where they're standing
              --  player.surface.create_entity{name="fire-flame", position={ x = player.position.x + 2, y = player.position.y}, force="neutral"}
            end
         end
      end
   end
)

function on_build(e)
  --this initializes a global variable
  last_built=e.created_entity.name
  game.print('weeee')
end
function on_mine(e)
  --in this function we will use:
  if last_built then game.players[e.player_index].print("Last thing that was built is "..last_built) end
end
script.on_event(defines.events.on_built_entity,on_build)
-- script.on_event(defines.events.on_mined_entity,on_mine)

script.on_event(defines.events.on_built_entity,on_build)


function on_damaged(e)
  --this initializes a global variable
  for _, player in pairs(game.players)
  do
    game.print(player.name)
  end
end
function on_death(e)
  --this initializes a global variable
  for _, player in pairs(game.players)
  do
    game.print('nooooo')
  end
end
script.on_event(defines.events.on_player_died,on_death)
