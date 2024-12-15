import { SettingsData } from "factorio:common";
import { StringSettingDefinition } from "factorio:settings";

declare const data: SettingsData;

const setting = {
  type: "string-setting",
  name: "nice-try-train-friendly-setting",
  default_value: "all-trains",
  allowed_values: ["my-trains", "all-trains", "friend-trains"],
  setting_type: "runtime-global",
} satisfies StringSettingDefinition;

data.extend([setting]);
