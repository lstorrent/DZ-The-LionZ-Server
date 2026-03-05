# [Server Hosting] AI Configuration

## DayZ Expansion - AI System Configuration

---

## AI Location Settings

**File Location:** `mpmissions\<mapname>\expansion\settings\AILocationSettings.json`

This file controls how AI navigate the world.

### RoamingLocations

List of available locations for roaming AI (`"WaypointBehavior": "ROAMING"` in AIPatrolSettings.json). This will be filled automatically from the locations found in CfgWorlds <mapname> Names. For maps that have no named locations, a list of random locations will be auto-generated 10 seconds after the server has finished loading.

Each location needs to have the following format:

```json
{
    "Name": "Settlement_Capital (Petropavlovsk-Sakhalinsky)",
    "Position": [4749.0, 0.0, 10695.0],
    "Radius": 1000.0,
    "Type": "Capital",
    "Enabled": 1
}
```

**Parameters:**
- **"Name"** - String. Just to tell the locations apart more easily, you can choose anything you like.
- **"Position"** - Vector. Location coordinates.
- **"Radius"** - Float. Radius of the location area.
- **"Type"** - String. Pre-filled from the entries in CfgWorlds, you can leave it empty when adding custom locations.
- **"Enabled"** - Boolean. If 1 or true, AI can pick it as roaming destination. If 0 or false, the location will be ignored.

---

### ExcludedRoamingBuildings

List of building classnames or partial classnames (compared from the beginning of each string) that roaming AI should not pick as destination (they may still go there to loot, which is fine). 

**It is strongly recommended to leave the defaults intact and only add to this list.**

Example:
```json
"ExcludedRoamingBuildings": [
    "Land_CementWorks_Hall2_Grey",
    "Land_Factory_Small",
    "Land_House_1W09",
    "Land_House_2W03",
    "Land_HouseBlock_1F4",
    "Land_Boathouse",
    "Land_Mine_Building",
    "Land_Shed_W2",
    "Land_Tenement_Big"
]
```

---

### NoGoAreas

List of areas that AI should avoid. **Use sparsely since it affects pathfinding efficiency.**

Each no go area needs to be in the following format:

```json
{
    "Name": "Hashima Exclusion Zone",
    "Position": [558.0, 0.0, 4558.0],
    "Radius": 300.0,
    "Height": 130.0
}
```

**Parameters:**
- **"Name"** - String. Name of the exclusion zone.
- **"Position"** - Vector. Center coordinates of the zone.
- **"Radius"** - Float. Radius of the exclusion zone.
- **"Height"** - Float. Height of the exclusion zone.

---

## AI Load Balancing

**File Location:** `mpmissions/dayzoffline.mapname/expansion/settings/AIPatrolSettings.json`

### LoadBalancingCategories

Allows to specify how many patrols of each type are allowed to spawn/stay depending on the amount of online players. If a patrol is already spawned, and more players connect than the load balancing allows for that range of players, then the patrol will automatically despawn (AI will sit down just like players would when logging out, and cannot be killed while in this despawn phase).

Each individual patrol can have a LoadBalancingCategory assigned, and each category can define at least one or more entries that define ranges of online players and maximum amount of patrols for each range.

#### Default Categories:

If no category is assigned (`""`), then the following defaults will be used:

- **ObjectPatrols** will use the ObjectPatrol category (if it exists)
- **Patrols** will use the Patrol category (if it exists)
- **Quest AI** (e.g. AICamp or AIPatrol when DayZ-Expansion-Quests is loaded) will use the Quest category (if it exists)

If a **Global** category exists, it will always be used in addition to the individual categories, so if an individual category doesn't limit a patrol, then any global limit(s) will still be in effect (if any).

**Note:** A value of -1 for MaxPatrols means no limit will be applied by that specific entry.

You can edit, add and remove categories to your liking, there's no requirement to stick to any default category (but note that if you want global patrol limiting, then the category needs to be called Global). Removing all categories means no limits will be in effect.

#### Example Configuration:

```json
"LoadBalancingCategories": {
    "Example": [
        {
            "MinPlayers": 0,
            "MaxPlayers": 255,
            "MaxPatrols": -1
        }
    ],
    "Quest": [
        {
            "MinPlayers": 0,
            "MaxPlayers": 255,
            "MaxPatrols": -1
        }
    ],
    "ObjectPatrol": [
        {
            "MinPlayers": 0,
            "MaxPlayers": 255,
            "MaxPatrols": 5
        }
    ],
    "HelicopterWreck": [
        {
            "MinPlayers": 0,
            "MaxPlayers": 255,
            "MaxPatrols": 3
        }
    ],
    "Global": [
        {
            "MinPlayers": 0,
            "MaxPlayers": 10,
            "MaxPatrols": 10
        },
        {
            "MinPlayers": 11,
            "MaxPlayers": 20,
            "MaxPatrols": 8
        },
        {
            "MinPlayers": 21,
            "MaxPlayers": 30,
            "MaxPatrols": 6
        },
        {
            "MinPlayers": 31,
            "MaxPlayers": 40,
            "MaxPatrols": 4
        },
        {
            "MinPlayers": 41,
            "MaxPlayers": 50,
            "MaxPatrols": 2
        },
        {
            "MinPlayers": 51,
            "MaxPlayers": 255,
            "MaxPatrols": 0
        }
    ],
    "ContaminatedArea": [
        {
            "MinPlayers": 0,
            "MaxPlayers": 255,
            "MaxPatrols": 2
        }
    ],
    "Patrol": [
        {
            "MinPlayers": 0,
            "MaxPlayers": 255,
            "MaxPatrols": 5
        }
    ]
}
```

The default settings are fairly conservative, and allow up to 10 patrols (with anywhere from 1-3 AI each) when up to 10 players are online, but only 2 patrols when 50 players are online. This assumes a server that can handle 60 players.

---

## AIPatrolSettings

**File Location:** `mpmissions/dayzoffline.mapname/expansion/settings/AIPatrolSettings.json`

### Configuration Parameters:

#### "m_Version"
Integer. Contains the current setting version number. **NEVER change this value** unless you really know what you are doing as it's used internally for automatic conversion of old settings.

#### "Enabled"
Boolean.
- 0 = OFF | Disabled
- 1 = ON | Enabled

#### "FormationScale"
Float. How far apart the individual formation positions are.

- For formations that are on a grid (like Vee, InvVee, Wall, Column and InvColumn), the value determines the side length of the grid in meters.
- For formations that are not on a grid (like Star, StarDot, Circle and CircleDot), the value roughly determines the distance between the positions.

**Default:** -1.0 (uses AISettings.json value, which defaults to 1.0)

#### "DespawnTime"
Float. How long in seconds will it take for the patrol to despawn if no players are in DespawnRadius.
- -1 = Use the value from AISettings.json

#### "RespawnTime"
Float. How long in seconds until this patrol can respawn if no players are in MinDistRadius?
- -1 = Use the value from AISettings.json

#### "MinDistRadius"
Float. The required minimum distance from a player to spawn. If a player is closer than MinDistRadius meters, then the patrol won't spawn.
- -1 = Use the value from AISettings.json

#### "MaxDistRadius"
Float. The required maximum distance from a player to spawn. If a player is further away than MaxDistRadius meters, then the patrol won't spawn.
- -1 = Use the value from AISettings.json

#### "DespawnRadius"
Float. The required distance from a player to despawn. If a player is closer than DespawnRadius meters, then the patrol won't despawn.
- -1 = Use the value from AISettings.json

#### "AccuracyMin"
Float. Minimum accuracy of the AI (0.0-1.0)
- -1 = Use the value from AISettings.json

#### "AccuracyMax"
Float. Maximum accuracy of the AI (0.0-1.0)
- -1 = Use the value from AISettings.json

#### "ThreatDistanceLimit"
Float. Distance in meters when the target will start be considered a potential threat. AI will not see enemies past this distance, so use with care.
- -1 = Use the value from AISettings.json

#### "NoiseInvestigationDistanceLimit"
Float. Max distance in meters that AI will search for noise sources.
- -1 = Use value from AISettings.json

#### "MaxFlankingDistance"
Float. Max distance to enemy in meters that AI will try to flank the enemy (default 200).
- -1 = Use value from AISettings.json

#### "EnableFlankingOutsideCombat"
Integer. Enable flanking outside combat. Note that this will give AI a sort of "sixth sense" about enemies, but not necessarily their exact position when there is no line of sight.
- 0 = Disabled
- 1 = Enabled
- -1 = Use value from AISettings.json

#### "DamageMultiplier"
Float. Damage multiplier from the AI (default 1.0 = no change). Base damage they will deal multiplied by this value.
- -1 = Use the value from AISettings.json

#### "DamageReceivedMultiplier"
Float. Damage multiplier for damage the AI receive (default 1.0 = no change). Base damage they receive will be multiplied by this value.
- -1 = Use the value from AISettings.json

---

## AISettings

**File Location:** `mpmissions/dayzoffline.mapname/expansion/settings/AISettings.json`

### Configuration Parameters:

#### "m_Version"
Integer. Contains the current setting version number. **NEVER change this value** unless you really know what you are doing.

#### "AccuracyMin"
Float. Minimum accuracy of the AI (0.0-1.0). This setting can be overridden in each patrol.

#### "AccuracyMax"
Float. Maximum accuracy of the AI (0.0-1.0). This setting can be overridden in each patrol.

#### "ThreatDistanceLimit"
Float. Maximum distance the AI is allowed to calculate a potential target as a threat. This setting can be overridden in each patrol.

#### "NoiseInvestigationDistanceLimit"
Float. How far away a noise can be for AI to consider checking it out. This setting can be overridden in each patrol.

#### "DamageMultiplier"
Float. How much damage AI is doing. 1.0 = 100%. This setting can be overridden in each patrol.

#### "DamageReceivedMultiplier"
Float. How much damage AI is receiving when attacked. 1.0 = 100%. This setting can be overridden in each patrol.

#### "Admins"
Array[String]. A list of Steam IDs in quotes to allow access to a debug menu for AI.

#### "Vaulting"
Boolean.
- 0 = AI won't vault
- 1 = AI can vault over objects

#### "SniperProneDistanceThreshold"
Float. How close a target can be for AI to go prone when using a bolt action rifle. If the target is closer than this value, AI won't go prone.

#### "Manners"
Boolean.
- 0 = AI won't taunt or emote
- 1 = AI will taunt after killing a target, or emote, randomly

#### "MemeLevel"
Integer. Make the AI behave in goofy ways.
- 0 = Turned off
- ??? = Do something

#### "CanRecruitFriendly"
Boolean.
- 0 = Friendly AI cannot be recruited
- 1 = Players can recruit Friendly AIs (Based on Faction relations)

#### "CanRecruitGuards"
Boolean.
- 0 = Guards cannot be recruited
- 1 = Players can recruit Guards

#### "PreventClimb"
Array[String]. A list of object classnames the AI shouldn't be able to climb. For example "Land_Mil_Airfield_HQ" (this one is hardcoded).

#### "PlayerFactions"
Array[String]. A list of Factions in quotes. One of these listed factions will be randomly assigned to new players.

#### "LogAIHitBy"
Boolean. Log AI getting hit to admin log.

#### "LogAIKilled"
Boolean. Log AI getting killed to admin log.

#### "EnableZombieVehicleAttackHandler"
Boolean. Zombies will attack vehicles if a player sits in them.

#### "EnableZombieVehicleAttackPhysics"
Boolean. Zombies will shake up the vehicle while attacking it.

#### "LightingConfigMinNightVisibilityMeters"
Sets how far AI can see at night without flashlight/NVG depending on lightingConfig value in CfgGameplay.json.

**Default for Chernarus:**
```json
"LightingConfigMinNightVisibilityMeters": {
    "0": 100.0,
    "1": 10.0
}
```

---

## Example AISettings.json

```json
{
    "m_Version": 10,
    "AccuracyMin": 0.1,
    "AccuracyMax": 0.5,
    "ThreatDistanceLimit": 500.0,
    "NoiseInvestigationDistanceLimit": 100.0,
    "DamageMultiplier": 1.0,
    "DamageReceivedMultiplier": 1.0,
    "Admins": ["76561198012345678"],
    "Vaulting": 1,
    "SniperProneDistanceThreshold": 50.0,
    "Manners": 1,
    "MemeLevel": 0,
    "CanRecruitFriendly": 1,
    "CanRecruitGuards": 0,
    "PreventClimb": ["Land_Mil_Airfield_HQ"],
    "PlayerFactions": ["Survivors", "Bandits"],
    "LogAIHitBy": 1,
    "LogAIKilled": 1,
    "EnableZombieVehicleAttackHandler": 1,
    "EnableZombieVehicleAttackPhysics": 1,
    "LightingConfigMinNightVisibilityMeters": {
        "0": 100.0,
        "1": 10.0
    }
}
```

---

## Important Notes

- **Performance:** AI load balancing is crucial for server performance. Adjust categories based on your server capacity.
- **Accuracy:** Higher accuracy values make AI more deadly. Balance carefully for gameplay.
- **Distance Limits:** ThreatDistanceLimit affects AI awareness. Too high can impact performance, too low makes AI less challenging.
- **Roaming Locations:** Ensure locations are properly distributed across the map for better AI behavior.
- **No Go Areas:** Use sparingly as they affect pathfinding efficiency.


---

## [Server Hosting] How to create AI Patrols

### Overview of Recent Changes

**Expansion 1.9.50 (2025-12-22)**
- Added CanSpawnInContaminatedArea
- Added two new waypoint behaviors LOOP_OR_ALTERNATE and ROAMING_LOCAL
- Added DefaultStance
- Added DefaultLookAngle
- Added MaxFlankingDistance
- Added EnableFlankingOutsideCombat

**Expansion 1.9.41 (2025-10-10)**
- Added LootDropOnDeath

**Expansion 1.9.34 (2025-08-22)**
- Merged ObjectPatrols into Patrols

**Expansion 1.9.23 (2025-05-14)**
- Added LoadBalancingCategory and FormationScale

**Expansion 1.9.14 (2025-02-12)**
- Added extended description for new LootingBehaviour options

**Expansion 1.9.0 (2024-07-25)**
- Added Persist option
- Added new possible value "RANDOM" for Faction option
- Added new possible value "ROAMING" for Behaviour option
- Changed UnlimitedReload to a bitmask to allow different behavior per target type

---

### 1) Finding AIPatrolSettings.json

Inside your `mpmissions/dayzoffline.mapname/expansion/settings/` you will find the `AIPatrolSettings.json`

---

### 2) Adding a new Patrol

The easiest way to create a new patrol is using the in-game AI menu. Set yourself as admin in AISettings.json, spawn a few companion AI, use CTRL+click to set waypoints, and select "Export Patrol" from the AI menu. You can then edit the exported file to your liking and copy the patrol into AIPatrolSettings.json.

---

## Patrol Configuration Parameters

### "Name"
String. Allows you to give a name for each patrol so you know what is what. It is also used as the group name in logs.

---

### "Persist"
Boolean. If Name is given and unique, alive patrol members will be saved when despawning (also at server restarts) and restored with all their gear at the last position when respawning. Note this is only supported if ObjectClassName is not set.

---

### "Faction"
String. This setting allows you to specify what faction this patrol will be in.

When an AI encounters another AI with a different faction, then if either faction considers the other as hostile, combat will ensue. Peaceful encounters will only happen if both factions see each other as neutral.

**Note:** Any AI that is attacked will turn hostile even if it originally considered the attacker's faction as neutral.

**Available Factions:**

- **West** → Considered hostile by any faction except Civilian and other West
- **East** → Considered hostile by any faction except Civilian and other East
- **Raiders** → Considered hostile by everyone, including other Raiders (unless they are part of the same group)
- **Mercenaries** → Considered hostile by any faction except other Mercenaries
- **Civilian** → Considered neutral by any faction
- **Passive** → Completely passive, will not react to other entities and be ignored by other factions
- **Guards** → Always neutral toward other guards, neutral toward other AI and players as long as they don't raise their weapon
- **InvincibleGuards** → Like guards, but can't be killed
- **Shamans** → Considered hostile by everyone except other Shamans, won't attack or be attacked by Zs and animals
- **Observers** → Will only look at other entities, but not engage in combat
- **InvincibleObservers** → Like observers, but can't be killed
- **YeetBrigade** → Same as guard faction but won't pick up weapons and has insanely strong melee (one-shots bears with their fists) that send their victim flying
- **InvincibleYeetBrigade** → Like YeetBrigade, but can't be killed
- **Brawlers** → Seen as hostile by any faction except Civilian and other Brawlers. Very strong melee (not as strong as YeetBrigade) that can one-shot Infected with fists
- **RANDOM** → Chooses one of the above factions that are not invincible, observer or passive and don't have special melee abilities

---

### "Formation"
String. Formation of the group. Valid values: Column, InvColumn, File, InvFile, Vee, InvVee, Wall, Star, StarDot, Circle, CircleDot or RANDOM.

---

### "FormationScale"
Float. How far apart the individual formation positions are.

- For formations that are on a grid (like Vee, InvVee, Wall, Column and InvColumn), the value determines the side length of the grid in meters.
- For formations that are not on a grid (like Star, StarDot, Circle and CircleDot), the value roughly determines the distance between the positions.

**Default:** -1.0 = use value from top of AIPatrolSettings.json (fall back to AISettings.json if also -1)

---

### "FormationLooseness"
Float. How loose the formation is, i.e. how close each AI tries to stay to their respective position in the formation. In meters.

**Examples:**
- 0 = will try to follow formation exactly
- 0.5 = loose formation
- 1.0 = very loose formation

---

### "Loadout"
String. The name of your loadout.json containing the weapons, outfit and gear they will carry with them. For example "HumanLoadout"

---

### "Units"
Array[String]. If you want specific AI to spawn, enter the eAI classnames here, else leave empty. Note that it will pick classnames randomly from the list UNLESS you set NumberOfAI to EXACTLY the number of classnames you enter here (in which case it will spawn the exact set you entered).

**Example:**
```json
"Units": [
    "eAI_SurvivorF_Eva",
    "eAI_SurvivorM_Mirek",
    "eAI_SurvivorF_Judy",
    "eAI_SurvivorM_Guo"
]
```

---

### "NumberOfAI"
Integer. How many AI will be in this patrol.

If you set this setting to a negative number, the system will spawn a random amount of AI between 1 and the specified number with the sign removed.

**Example:** -6 will tell the game to spawn between 1 and 6 AI.

---

### "Behaviour"
String. Desired behaviour of your patrol.

- **HALT** → The patrol won't move unless in combat and then return to the waypoint.
- **ONCE** → The patrol will follow the waypoints from start to finish, then stop.
- **LOOP** → The patrol will follow the waypoints from start to finish, then return to start and repeat. Should only be used if the last waypoint is close to the first waypoint.
- **ALTERNATE** → The patrol will follow the waypoints from start to finish, then from finish to start and repeat.
- **LOOP_OR_ALTERNATE** → Will pick LOOP if start and end waypoints are close together, else ALTERNATE.
- **HALT_OR_ALTERNATE** → The patrol will spawn with a random behaviour of either HALT or ALTERNATE.
- **HALT_OR_LOOP** → The patrol will spawn with a random behaviour of either HALT or LOOP.
- **ROAMING** → Only the starting waypoint will be used, then the AI will go off and pick destination locations on its own.
- **ROAMING_LOCAL** → Only the starting waypoint will be used, then the AI will go off and roam buildings at nearest location indefinitely if there are more than three.

---

### "LootingBehaviour"
String. Desired AI looting behavior.

Options can be combined like so:
```json
"LootingBehaviour": "WEAPONS | BANDAGES | CLOTHING_HIPS | CLOTHING_BACK_SMALL | UPGRADE"
```

**Available options:**

- **WEAPONS_FIREARMS**
- **WEAPONS_LAUNCHERS**
- **WEAPONS_MELEE**
- **WEAPONS** - Same as WEAPONS_FIREARMS | WEAPONS_LAUNCHERS | WEAPONS_MELEE
- **BANDAGES**
- **CLOTHING_ARMBAND**
- **CLOTHING_BACK_LARGE**
- **CLOTHING_BACK_MEDIUM**
- **CLOTHING_BACK_SMALL**
- **CLOTHING_BACK** - Same as all CLOTHING_BACK_* options combined
- **CLOTHING_BODY**
- **CLOTHING_EYEWEAR**
- **CLOTHING_FEET**
- **CLOTHING_GLOVES**
- **CLOTHING_HEADGEAR**
- **CLOTHING_HIPS**
- **CLOTHING_LEGS**
- **CLOTHING_MASK**
- **CLOTHING_MELEE**
- **CLOTHING_SHOULDER**
- **CLOTHING_VEST**
- **CLOTHING** - Same as all the other CLOTHING_* options combined (except CLOTHING_SIMILAR and CLOTHING_IDENTICAL)
- **CLOTHING_IDENTICAL** - Will only loot identical clothing to the one the AI is currently wearing
- **CLOTHING_SIMILAR** - Will only loot similar clothing to the one the AI is currently wearing (i.e. same type, different color)
- **FOOD** - Food procurement including hunting and animal skinning
- **UPGRADE** - If the AI already has a weapon or clothing in slot, should it be allowed to upgrade?
- **DEFAULT** - Same as WEAPONS_FIREARMS | WEAPONS_LAUNCHERS | WEAPONS_MELEE
- **ALL** - Same as WEAPONS | BANDAGES | CLOTHING | UPGRADE
- **NONE**

---

### "Speed"
String. Maximum speed allowed for the AI when not in combat.

- **STATIC** → The patrol won't move
- **WALK**
- **JOG**
- **SPRINT**
- **RANDOM** → will give a result between STATIC and SPRINT
- **RANDOM_NONSTATIC** → will give a result between WALK and SPRINT

---

### "UnderThreatSpeed"
String. Maximum speed allowed for the AI when in combat.

- **STATIC** → The patrol won't move
- **WALK**
- **JOG**
- **SPRINT**
- **RANDOM** → will give a result between STATIC and SPRINT
- **RANDOM_NONSTATIC** → will give a result between WALK and SPRINT

---

### "DefaultStance"
String. Default stance the AI will take when not under fire and not melee fighting.

- **STANDING** (default)
- **CROUCHED**
- **PRONE**

---

### "DefaultLookAngle"
Float. Default horizontal look angle in degrees when not looking at a target and not moving. Only used when waypoint behavior is set to HALT. 0.0 = north, 90 = west, -90 = east +-180 = south, any value in between is possible. If ObjectClassName is set, this angle is relative to the respective object's yaw angle.

---

### "CanBeLooted"
Boolean. If set to 1, AI can be looted once dead. If set to 0, they cannot be looted.

---

### "LootDropOnDeath"
String. If set to a JSON filename in `<serverprofile>\ExpansionMod\AI\LootDrops`, will spawn this loot when AI dies. You can look at the Example.json that is automatically generated to see how the file contents need to be laid out (format is similar to loadouts).

---

### "UnlimitedReload"
Integer (Bitmask). If set to any non-zero value, AI will be able to reload infinitely if they have a spare mag or ammo in their inventory (mags will refill automagically).

- **0** → Off
- **1** → All targets
- **2** → Animals
- **4** → Infected
- **8** → Players
- **16** → Vehicles

Values other than 1 can be added together to combine them. E.g. a value of 6 means only allow unlimited reload if current AI target is an animal or Infected.

---

### "SniperProneDistanceThreshold"
Float. Minimum distance in meters before an AI holding a bolt action rifle will go prone to engage a target. If the target is closer, AI won't go prone. Setting to 0 disables prone completely.

---

### "AccuracyMin"
Float. Minimum accuracy of this patrol (0.0-1.0). If set to -1 will use the AccuracyMin setting used on the top of the config file.

---

### "AccuracyMax"
Float. Maximum accuracy of this patrol (0.0-1.0). If set to -1 will use the AccuracyMax setting used on the top of the config file.

---

### "ThreatDistanceLimit"
Float. Distance in meters when the target will start be considered a potential threat. If set to -1 will use the setting used on the top of the config file.

---

### "NoiseInvestigationDistanceLimit"
Float. Max distance in meters that AI will search for noise sources. -1 = use value from top of AIPatrolSettings.json (fall back to AISettings.json if also -1)

---

### "MaxFlankingDistance"
Float. Max distance to enemy in meters that AI will try to flank the enemy (default 200). -1 = use value from top of AIPatrolSettings.json (fall back to AISettings.json if also -1)

---

### "EnableFlankingOutsideCombat"
Integer. Enable flanking outside combat. Note that this will give AI a sort of "sixth sense" about enemies, but not necessarily their exact position when there is no line of sight. 0 = disabled, 1 = enabled, -1 = use value from top of AIPatrolSettings.json (fall back to AISettings.json if also -1)

---

### "DamageMultiplier"
Float. Damage multiplier for damage dealt by the AI (default 1.0 = no change). Base damage they deal will be multiplied by this value. If set to -1 will use the setting used on the top of the config file.

---

### "DamageReceivedMultiplier"
Float. Damage multiplier for damage the AI receive (default 1.0 = no change). Base damage they receive will be multiplied by this value. If set to -1 will use the setting used on the top of the config file.

---

### "HeadshotResistance"
Float. Default 0.0 = no change. Any value above 0 will disable the brain damage zone (disables instakill when brain is hit). 1.0 = AI will not receive damage from headshots.

---

### "CanSpawnInContaminatedArea"
Boolean. Whether or not this patrol can spawn in contaminated areas.

---

### "CanBeTriggeredByAI"
Boolean. Whether or not this patrol can be triggered by other AI or only actual players.

---

### "MinDistRadius"
Float. The required minimum distance from a player to spawn. If a player is closer than MinDistRadius meters, then the patrol won't spawn. If set to -1 will use the MinDistRadius setting used on the top of the config file.

---

### "MaxDistRadius"
Float. The required maximum distance from a player to spawn. If a player is further away than MaxDistRadius meters, then the patrol won't spawn. If set to -1 will use the MinDistRadius setting used on the top of the config file.

---

### "DespawnRadius"
Float. The required distance from a player to despawn. If a player is closer than DespawnRadius meters, then the patrol won't despawn. If set to -1 will use the DespawnRadius setting used on the top of the config file.

---

### "MinSpreadRadius" / "MaxSpreadRadius"
Float. This setting allows you to make each of your waypoints randomized in a radius defined by min/max spread. If you want your waypoints to be accurate, keep this setting at 0.

---

### "Chance"
Float. Spawn chance for this patrol as a value between 0.0 (0%) and 1.0 (100%).

---

### "DespawnTime"
Float. How long will it take for the patrol to despawn if no players are in MaxDistRadius. If set to -1 will use the DespawnTime setting used on the top of the config file.

---

### "RespawnTime"
Float. How long until this patrol can respawn?
- If set to -1 they won't respawn
- If set to -2 will use the RespawnTime setting used on the top of the config file

---

### "LoadBalancingCategory"
String. This allows you to assign a category for load balancing, to determine how many patrols of this type can be active depending on player count, with great amount of customizability. See AI Load Balancing section.

---

### "ObjectClassName"
String. A classname of a building you want AI to spawn on (e.g. heli or police wrecks, police stations, etc).

By default, only objects inheriting from BuildingBase/House are supported, but if you use DayZ-Expansion-Missions, then also the individual airdrop container classnames can be used.

---

### "WaypointInterpolation"
String. If any interpolation should be used on the given waypoints to smooth out the path at turns. Valid values: CatmullRom, NaturalCubic, UniformCubic or empty string (no interpolation).

---

### "UseRandomWaypointAsStartPoint"
Boolean (only used if ObjectClassName is empty). If set to 1, use a random waypoint as spawn point (else use the 1st waypoint).

---

### "Waypoints"
Array[Vector]. A list of positions the patrols will have to go to. Normally, these positions are world coordinates, but if ObjectClassName is set, these positions are relative to the respective object's position.

**Hint:** As an admin, to get a waypoint relative to any specific object, use an admin tool with ESP functionality (e.g. COT or VPP), place the object in question and make sure its orientation is 0 0 0, place your player where you want the waypoint to be, and then subtract the object's position from the player's position to get the relative coordinates.

---

## Example Patrol Configuration

```json
{
    "Name": "Military Patrol Alpha",
    "Persist": 0,
    "Faction": "West",
    "Formation": "Vee",
    "FormationScale": 2.0,
    "FormationLooseness": 0.5,
    "Loadout": "MilitaryLoadout",
    "Units": [],
    "NumberOfAI": 4,
    "Behaviour": "LOOP",
    "LootingBehaviour": "WEAPONS | BANDAGES | UPGRADE",
    "Speed": "JOG",
    "UnderThreatSpeed": "SPRINT",
    "DefaultStance": "STANDING",
    "DefaultLookAngle": 0.0,
    "CanBeLooted": 1,
    "LootDropOnDeath": "",
    "UnlimitedReload": 1,
    "SniperProneDistanceThreshold": 50.0,
    "AccuracyMin": 0.3,
    "AccuracyMax": 0.7,
    "ThreatDistanceLimit": 500.0,
    "NoiseInvestigationDistanceLimit": 100.0,
    "MaxFlankingDistance": 200.0,
    "EnableFlankingOutsideCombat": 0,
    "DamageMultiplier": 1.0,
    "DamageReceivedMultiplier": 1.0,
    "HeadshotResistance": 0.0,
    "CanSpawnInContaminatedArea": 0,
    "CanBeTriggeredByAI": 0,
    "MinDistRadius": 100.0,
    "MaxDistRadius": 500.0,
    "DespawnRadius": 800.0,
    "MinSpreadRadius": 0.0,
    "MaxSpreadRadius": 0.0,
    "Chance": 1.0,
    "DespawnTime": 300.0,
    "RespawnTime": 600.0,
    "LoadBalancingCategory": "Patrol",
    "ObjectClassName": "",
    "WaypointInterpolation": "",
    "UseRandomWaypointAsStartPoint": 0,
    "Waypoints": [
        [4500.0, 10.0, 6500.0],
        [4600.0, 12.0, 6600.0],
        [4700.0, 15.0, 6500.0],
        [4600.0, 12.0, 6400.0]
    ]
}
```


---

## [Server Hosting] How to assign a player to a faction

**Please Note:** You can also give a faction to a player with DayZ Expansion Quests, however we won't explain how in this guide.

### 1) Finding AISettings.json

Inside your server profile go to `ExpansionMod/Settings/AISettings.json` 

The server profile is where you will find the crash logs, script logs, rpt, permissionframework, expansionmod, console.log and many other folders related to mods. This folder sadly can be renamed and can be found under many names like "config", "instance", "profile" or "sc" to only name a few.

### 2) Adding new PlayerFactions

Inside this file you will see a setting similar to this:

```json
"PlayerFactions": []
```

This setting allows you to specify what faction your players will be in (randomly). You can find the list of available factions in the Faction section above.

**Note:** All factions ignore the Passive faction.

#### Examples:

**Single Faction:**
```json
"PlayerFactions": ["West"]
```

**Multiple Factions (Random Assignment):**
```json
"PlayerFactions": ["West", "East", "Raiders"]
```

When multiple factions are listed, new players will be randomly assigned to one of these factions when they join the server for the first time.

### Available Player Factions

You can use any of the following factions for players:
- West
- East
- Raiders
- Mercenaries
- Civilian
- Guards
- Shamans
- Brawlers

**Note:** It's not recommended to use invincible, observer, or passive factions for players as they have special behaviors designed for AI.
