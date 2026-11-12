local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
-- Original Metal and Stars 0.0.8 direct routes. Existing definitions win.
local routes = {
  {"nauvis-shipyard", "nauvis", "shipyard", 5000, "nauvis_gleba"},
  {"shipyard-fulgora", "shipyard", "fulgora", 5000, "nauvis_fulgora"},
  {"fulgora-nix", "fulgora", "nix", 7000, "nauvis_fulgora"},
}
for _, route in ipairs(routes) do
  if not data.raw["space-connection"][route[1]] then
    data:extend{{type="space-connection", name=route[1], subgroup="planet-connections",
      from=route[2], to=route[3], order="b", length=route[4],
      asteroid_spawn_definitions=asteroid_util.spawn_definitions(asteroid_util[route[5]])}}
  end
end
