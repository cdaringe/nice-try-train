/** @noSelfInFile **/

import {
  EventId,
  LuaEntityDamagedEventFilter,
  OnEntityDamagedEvent,
} from "factorio:runtime";

type Event = EventId<OnEntityDamagedEvent, LuaEntityDamagedEventFilter>;

script.on_event(
  defines.events.on_entity_damaged as Event,
  function on_damaged(evt) {
    const isTrainDeathEvent =
      !!evt.entity &&
      evt.entity.type == "character" &&
      !!evt.cause &&
      !!evt.cause.train;
    if (!isTrainDeathEvent) {
      return;
    }
    const setting = settings.global["nice-try-train-friendly-setting"].value;
    const damaging_force = evt.entity.force;
    const cause_force = evt.cause.force;
    const isLiveSavingEventA =
      setting == "all-trains" ||
      (setting == "my-trains" && damaging_force.index == cause_force.index);
    const isLiveSavingEventB =
      setting == "friend-trains" &&
      (cause_force.get_friend(damaging_force) ||
        cause_force.index == damaging_force.index);
    if (isLiveSavingEventA || isLiveSavingEventB) {
      // evt.final_health = 1;
      evt.entity.health = 1;
    }
  },
  [
    { filter: "damage-type", type: "impact" as any },
    { filter: "final-health", mode: "and", value: 0, comparison: "=" },
  ]
);
