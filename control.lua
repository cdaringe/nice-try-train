function damaged(evt)
    if evt.entity ~= nil and evt.entity.type == "character" and evt.cause ~= nil and evt.cause.train ~= nil then
        local setting = settings.global["nice-try-train-friendly-setting"].value
        local damaged_force = evt.entity.force
        local cause_force = evt.cause.force
        if (setting == "my-trains" and damaged_force.index == cause_force.index) or setting == "all-trains" or (setting == "friend-trains" and (cause_force.get_friend(damaged_force) or cause_force.index == damaged_force.index)) then
            evt.final_health = 1
            evt.entity.health = 1
        end
    end
end

script.on_event(defines.events.on_entity_damaged, damaged, {{filter="damage-type", type="impact"},{mode="and", filter="final-health", value=0, comparison="="}})