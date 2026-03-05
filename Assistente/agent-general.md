# [Server Hosting] GeneralSettings

## DayZ Expansion - General Settings Configuration

---

## Configuration Parameters

### "m_Version"
Integer.

Contains the current setting version number. **NEVER change this value** unless you really know what you are doing as it's used internally for automatic conversion of old settings whenever we change something.

---

### "DisableShootToUnlock"
Boolean.

- 0 = Players can shoot at locked building doors to brute force the door and unlock it.
- 1 = Players can't shoot at a locked building door and will need a lockpick to unlock the door of the building.

---

### "EnableGravecross"
Boolean.

- 0 = Gravecross will be disabled. The dead player inventory will stay on him.
- 1 = Gravecross will be enabled. When a player dies a Gravecross will spawn on him with all his stuff in it. This is usually used to prevent body despawn between restarts.

---

### "GravecrossDeleteBody"
Boolean. Only works if "EnableGravecross" is enabled.

- 0 = If you still want the dead body next to the Gravecross because you want your players to skin dead players.
- 1 = This will delete the body of the dead player. Use this to only have the Gravecross and not have a naked dead body next to it.

---

### "GravecrossTimeThreshold"
Integer. Only works if "EnableGravecross" is enabled.

How long a player needs to be playing (in seconds) in one session to get the normal cross (Expansion_Gravecross) instead of the low lifetime one (Expansion_Gravecross_LowLifetime).

---

### "UseCustomMappingModule"
Boolean. **WARNING:** Custom mapping has a big impact on server and player performance. **Doesn't work with NatureOverhaul Mod.**

- 0 = The expansion custom mapping will be disabled. This will not disable custom interiors or ivy.
- 1 = The expansion custom mapping will be enabled. Roadblocks, forests, new buildings and more detailed roads will be added. Currently, only ChernarusPlus has custom mapping.

---

### "Mapping"
Array.

List all the locations with custom mapping made by the mod Expansion. If you want to remove a location, just remove the line!

---

### "ObjectsToDelete"
Array.

You can indicate the position and the name of a specific mapped object to be removed. This action can be done to multiple objects.

---

### "BuildingInteriors"
Boolean. **Has a huge impact on server and player performance!** **Doesn't work with NatureOverhaul Mod.**

- 0 = Interiors won't be filled with new props.
- 1 = Interiors will be more detailed.

---

### "Interiors"
Array.

The list of building classnames allowed to spawn custom interiors. If you don't want a specific building to spawn custom interiors, just remove its classname from the list.

---

### "BuildingIvys"
Boolean. **Only works for ChernarusPlus!**

- 0 = No custom ivies will be added to the map.
- 1 = Custom Ivies in specific locations will be added to the map.

---

### "EnableLamps"
Integer.

- 0 = Disabled - Street lights are off.
- 1 = Enabled - Street lights are enabled according to LampAmount_OneInX and LampSelectionMode.

---

### "LampAmount_OneInX"
Integer. Default: 3

Configures how many street lamps will have lights. E.g. the default value 3 will mean 1 in 3 lamps will have lights (33% of all lamps on the map).

**NOTE:** It is not recommended to set this value to 1 (= all lamps on the map have lights) as it may cause considerable flicker when lights overlap.

---

### "LampSelectionMode"
String. Default: FARTHEST_RANDOM

Configures how the lamps with lights are distributed across the map.

- **RANDOM** = Completely random. May cause light overlap and thus flicker.
- **FARTHEST** = Uses optimized farthest point sampling to evenly spread out the lights. May generate the same light positions on each server start (not guaranteed).
- **FARTHEST_RANDOM** = Like FARTHEST, but with random distribution.

---

### "EnableGenerators"
Boolean. **CURRENTLY DOESN'T WORK**

Currently unused. However you can spawn these generators as events!

- 0 = No generators will be spawned inside the towns and villages.
- 1 = Will spawn in towns and villages generators for the mode 1 for "EnableLamps".

---

### "EnableLighthouses"
Boolean.

- 0 = The lighthouses won't emit a light beam.
- 1 = Turns on the light of every lighthouse on the map.

---

### "EnableHUDNightvisionOverlay"
Boolean.

- 0 = Use the NVG vanilla overlay (in short a green screen).
- 1 = Add an immersive NVG overlay.

---

### "DisableMagicCrosshair"
Boolean.

- 0 = Will use the current DayZ vanilla aiming system (bullet goes to crosshair when hipfiring).
- 1 = Enable DayZ Alpha style aiming (bullet goes straight out of the barrel when hipfiring). This setting is needed for the laser sight attachment to be accurate.

---

### "EnableAutoRun"
Boolean.

- 0 = This feature will be turned off.
- 1 = Allow the player to use the autorun feature. It will still work when they are in their inventory.

**Controls:**
- SHIFT + Z = Auto Sprint
- CTRL + Z = Auto Walk
- Z = Auto Jog

---

### "UseDeathScreen"
Boolean.

- 0 = Deathscreen will be a blackscreen as usual. Vanilla way.
- 1 = Add back the old school deathscreen (with the bloody hand).

---

### "UseDeathScreenStatistics"
Boolean.

- 0 = You won't be able to know your stats when dead like in vanilla.
- 1 = When dead you will be able to know your personal stats.

---

### "UseNewsFeedInGameMenu"
Boolean.

- 0 = The news feed in the pause menu will be removed.
- 1 = The news feed in the pause menu will be enabled.

---

## HUD Colors Configuration

You can customize the following HUD colors:

- **"StaminaBarColor"**
- **"NotifierDividerColor"**
- **"TemperatureBurningColor"**
- **"TemperatureHotColor"**
- **"TemperatureIdealColor"**
- **"TemperatureColdColor"**
- **"TemperatureFreezingColor"**
- **"NotifiersIdealColor"**
- **"NotifiersHalfColor"**
- **"NotifiersLowColor"**

### Color Format

The format for all colors is:
- Hexadecimal **RRGGBBAA**
- Hexadecimal **RGBA**
- Decimal **R G B A** with range 0-255 (alpha is optional in all cases)

**Color Generator Tool:** https://color.adobe.com/de/create/color-wheel

If you want alpha transparency, you have to add it manually after the first six digits.

---

## Example Configuration

```json
{
    "m_Version": 10,
    "DisableShootToUnlock": 0,
    "EnableGravecross": 1,
    "GravecrossDeleteBody": 1,
    "GravecrossTimeThreshold": 300,
    "UseCustomMappingModule": 0,
    "BuildingInteriors": 0,
    "BuildingIvys": 1,
    "EnableLamps": 1,
    "LampAmount_OneInX": 3,
    "LampSelectionMode": "FARTHEST_RANDOM",
    "EnableGenerators": 0,
    "EnableLighthouses": 1,
    "EnableHUDNightvisionOverlay": 1,
    "DisableMagicCrosshair": 1,
    "EnableAutoRun": 1,
    "UseDeathScreen": 1,
    "UseDeathScreenStatistics": 1,
    "UseNewsFeedInGameMenu": 0,
    "HUDColors": {
        "StaminaBarColor": "FFFFFFFF",
        "NotifierDividerColor": "FFFFFFFF",
        "TemperatureBurningColor": "FF0000FF",
        "TemperatureHotColor": "FF8800FF",
        "TemperatureIdealColor": "00FF00FF",
        "TemperatureColdColor": "0088FFFF",
        "TemperatureFreezingColor": "0000FFFF",
        "NotifiersIdealColor": "00FF00FF",
        "NotifiersHalfColor": "FFFF00FF",
        "NotifiersLowColor": "FF0000FF"
    }
}
```

---

## Important Notes

- **Performance Impact:** Custom mapping and building interiors have significant performance impact on both server and clients.
- **Mod Compatibility:** Custom mapping and building interiors don't work with NatureOverhaul Mod.
- **Version Control:** Never manually change the m_Version parameter.
- **Lamp Configuration:** Setting all lamps to 1 (100%) may cause visual flicker due to light overlap.
