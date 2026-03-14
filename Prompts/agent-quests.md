# [Server Hosting] Expansion Quests

## DayZ Expansion

The Expansion Quests Mod is a dynamic quest system to create interactive MMO like quests for DayZ.

**WORK IN PROGRESS** - Please note that the content of this page may change in the future and is not final!

---

## Tools

Please note we are not going to teach you how to use these tools.

- **[DayZeEditor]** by shawminator#1073 - GUI Tool for the Expansion Settings (market, safezone, AI, quests, [...])

---

## Quest Setup

- [Server Hosting] How do Quests work
- [Server Hosting] How to setup the Quest System

## Quests Settings

- [Server Hosting] Quest Configuration
- [Server Hosting] Quest Objectives Configuration
- [Server Hosting] Quest NPC Configuration
- [Server Hosting] Quest Settings

## Modding

- [Modding] Community made configs
- [Modding] Creating Custom Expansion Quest Entities/NPC's
- [Modding] Creating custom Expansion treasure hunt containers
- [Modding] Advanced quest events and features

---

## [Server Hosting] How do Quests work

**WORK IN PROGRESS** - Please note that the content of this page may change in the future and is not final!

A quest always needs different components to get fed with the right information to process and run the quest as intended.

- The quest NPC/s that heads-out or takes-in the quest if the quest is not automatically completed.
- The objectives the quest has and the player needs to complete to complete the whole quest.
- The quest itself with all the information like the quest NPCs, objectives and certain other data that will get displayed to the player under certain conditions.

A quest will only work and can be accepted when the configuration is complete and the player meets all the requirements to accept the quest. If a quest is not getting displayed when interacting with the certain Quest NPC then something is not right with the configuration.

---

## [Server Hosting] How to setup the Quest System

### Download and install the required mods on your server:

**Required mods:**
- CF
- Dabs Framework
- DayZ-Expansion-Core
- DayZ-Expansion-Quests

**Optional mods:**

The following mods will extend the functionality of the quest system:

- **DayZ-Expansion-Book** - Adds a new section to the book menu that will act as the quest log.
- **DayZ-Expansion-AI** - Adds the possibility to use the AI quest objective types and to use AI as quest NPCs.
- **DayZ-Expansion-Groups** - Adds the possibility to do group quests and let group members share and progress quests together with their other members.
- **DayZ-Expansion-Navigation** - Adds the possibility to set Markers on objectives.

### Server config

After starting your server with the quest mod and its requirements for the first time, the server will generate the folder structure and default files in your profile folder (sometimes also named "sc" or "config"). If everything is installed and running correctly you will find new folder in your ExpansionMod folder with the name "Quests".

---

## [Server Hosting] Quest Configuration

### File Information:
You can name a quest configuration file to whatever you want as long as it has the .json file extension and is placed in the quest configurations folder it will get loaded by the quest system.

### Configuration Parameters:

#### "ConfigVersion"
Integer. Current config file version. Please don't change this unless you know what you are doing!

#### "ID"
Integer. Unique quest ID. Make sure this ID is different for every single quest.

#### "Type"
Integer. Quest type from ExpansionQuestType enumeration. Only use type 1 for all quests.
- NORMAL = 1

#### "Title"
String. Quest title.

#### "Descriptions"
Array. Should have only max. 3 entries in the array! Each index has its own use in the system.
- 0 - Description of getting the quest.
- 1 - Description while the quest is active (only visible at the given quest NPCs).
- 2 - Description when taking in quest. (only visible at the given quest turn-in NPC).

#### "ObjectiveText"
String. Short objective description text.

#### "FollowUpQuest"
Integer. Follow-up Quest ID. If this quest has a follow quest you need to add the quest ID of the follow-up quest here so it will be automatically shared with the player when he completes the pre-quest.

#### "Repeatable"
Boolean. Quest is a repeatable quest.

#### "IsDailyQuest"
Boolean. Quest is a daily quest and has a daily reset.

#### "IsWeeklyQuest"
Boolean. Quest is a weekly quest and has a weekly cooldown.

#### "CancelQuestOnPlayerDeath"
Boolean. The quest will be canceled if the quest player (or one of his group members when it's a group quest) dies.

#### "Autocomplete"
Boolean. Quest will be autocompleted when all quest objectives are completed.

#### "IsGroupQuest"
Boolean. Quest is a group quest.

#### "ObjectSetFileName"
String. Can be used to spawn a set of objects when a quest player starts a certain quest. Add the file name of the .map file that will get loaded without the .map extension. The .map file need to be located in the mission directory at: `MISSION.MAPNAME/expansion/quests/objects`.

#### "QuestItems"
Array<ExpansionQuestItemConfig>. Quest items that the player will receive when starting the quest. These items get deleted from the quest player/s when the quest is canceled/completed or the player logs out/server restarts.

```json
{
    "ClassName": "SledgeHammer",
    "Amount": 1
}
```

#### "Rewards"
Array<ExpansionQuestRewardConfig>. Quest rewards that the player will receive when turning in the quest and all objectives are completed.

```json
{
    "ClassName": "TaloonBag_Blue",
    "Amount": 1,
    "Attachments": [],
    "DamagePercent": 0,
    "QuestID": -1,
    "Chance": 1.0
}
```

#### "NeedToSelectReward"
Boolean. If enabled and there are multiple rewards for the quest in the rewards array the player needs to select one reward when he turns in the quest from the given rewards.

#### "RandomReward"
Boolean. If enabled and there are multiple rewards for the quest in the rewards array then random rewards will be selected on quest completion based on the given reward chances.

#### "RandomRewardAmount"
Integer. Amount of randomly selected reward items each quest player will get on quest completion.

#### "RewardsForGroupOwnerOnly"
Boolean. If enabled and the quest is a group quest only the group owner (quest owner) will receive the rewards.

#### "QuestGiverIDs"
Array. Unique quest NPC IDs from the quest NPC configuration of the NPCs that will head out the quest.

#### "QuestTurnInIDs"
Array. Unique quest NPC IDs from the quest NPC configuration of the NPCs that will turn in the quest when completed.

#### "IsAchivement"
Boolean. Quest is an achievement quest and gets added to new players when they join the server for the first time automatically.

#### "Objectives"
Array<ExpansionQuestObjectiveConfigBase>. Quest objectives that the player needs to complete.

```json
{
    "ConfigVersion": 21,
    "ID": 3,
    "ObjectiveType": 3
}
```

Objective Types:
- TARGET = 2
- TRAVEL = 3
- COLLECT = 4
- DELIVERY = 5
- TREASUREHUNT = 6
- AIPATROL = 7
- AICAMP = 8
- AIESCORT = 9
- ACTION = 10
- CRAFTING = 11

#### "QuestColor"
Integer. The main color of the quest will be used to display it in the menus and quest HUD.

#### "ReputationReward"
Integer. Only used if the Hardline mod is loaded. Reputation reward the quest players will receive on quest completion.

#### "ReputationRequirement"
Integer. Only used if the Hardline mod is loaded. Reputation points needed to see and accept the quest.

#### "PreQuestIDs"
Array. Pre-Quest Quest IDs. If this quest requires other quests to be completed before it can be displayed/accepted.

#### "RequiredFaction"
String. Only used if the AI mod is loaded. Name of the Expansion-AI faction the player needs to be in.

#### "FactionReward"
String. Only used if the AI mod is loaded. Name of the Expansion-AI faction the player will join as a reward.

#### "PlayerNeedQuestItems"
Boolean. Controls if the quest will be canceled if the quest players are missing one of the quest items on relog.

#### "DeleteQuestItems"
Boolean. Controls if the quest items will be deleted when the quest is completed or not.

#### "SequentialObjectives"
Boolean. Controls if the configured quest objectives need to be completed in sequential order.

#### "FactionReputationRequirements"
Map<String, integer>. Controls how many reputation points are needed for certain factions.

#### "FactionReputationRewards"
Map<String, integer>. Controls how many reputation points the player gets for certain factions on quest completion.

#### "SuppressQuestLogOnCompetion"
Boolean. Suppressed display of the quest log on quest completion.

#### "Active"
Boolean. Enable/disable this configuration file from being loaded by the quest system.

### Example configuration JSON file:

```json
{
    "ConfigVersion": 21,
    "ID": 2,
    "Type": 1,
    "Title": "A favor for Steve...",
    "Descriptions": [
        "So, Peter sends you, hmm? Well I have what he wants...",
        "You are not done yet? Come back when the job is done!",
        "Oh there you are! Well, here is your reward."
    ],
    "ObjectiveText": "Kill 10 civilian Infected with Steve's sledgehammer.",
    "FollowUpQuest": 3,
    "Repeatable": 0,
    "IsDailyQuest": 0,
    "IsWeeklyQuest": 0,
    "CancelQuestOnPlayerDeath": 0,
    "Autocomplete": 0,
    "IsGroupQuest": 0,
    "ObjectSetFileName": "",
    "QuestItems": [
        {
            "ClassName": "SledgeHammer",
            "Amount": 1
        }
    ],
    "Rewards": [
        {
            "ClassName": "WaterBottle",
            "Amount": 1,
            "Attachments": [],
            "DamagePercent": 0,
            "HealthPercent": 0,
            "QuestID": -1,
            "Chance": 1.0
        }
    ],
    "NeedToSelectReward": 0,
    "RandomReward": 0,
    "RandomRewardAmount": 0,
    "RewardsForGroupOwnerOnly": 1,
    "QuestGiverIDs": [2],
    "QuestTurnInIDs": [2],
    "IsAchievement": 0,
    "Objectives": [
        {
            "ConfigVersion": 26,
            "ID": 2,
            "ObjectiveType": 3
        }
    ],
    "QuestColor": 0,
    "ReputationReward": 0,
    "ReputationRequirement": -1,
    "PreQuestIDs": [1],
    "RequiredFaction": "",
    "FactionReward": "",
    "PlayerNeedQuestItems": 1,
    "DeleteQuestItems": 1,
    "SequentialObjectives": 1,
    "FactionReputationRequirements": {},
    "FactionReputationRewards": {},
    "SuppressQuestLogOnCompetion": 0,
    "Active": 1
}
```

### Special Quest Configurations:

#### Auto-Start Quest
An Auto-start quest will be added to the player on the first server connection.

Required parameters:
- `"QuestGiverIDs": []` - Make sure the quest has no quest giver IDs!
- `"IsAchivement": 0` - Make sure the quest is not flagged as an achievement quest!
- `"IsGroupQuest": 0` - Make sure the quest is not flagged as a group quest!
- `"PreQuestIDs": []` - Make sure the quest has no pre-quest IDs!

#### Achievement Quest
An Achievement quest will get added to the player on the first server connection but the player will never be notified except when he completes the quest.

Required parameters:
- `"QuestGiverIDs": []` - Make sure the quest has no quest giver IDs!
- `"IsAchivement": 1` - Make sure the quest is flagged as an achievement quest!
- `"Autocomplete": 1` - Make sure the quest is auto-completed!
- `"IsGroupQuest": 0` - Make sure the quest is not flagged as a group quest!
- `"PreQuestIDs": []` - Make sure the quest has no pre-quest IDs!

#### Daily Quest
Daily quests can be completed once per day and then set on a cooldown until the server's daily quest reset.

Required parameters:
- `"Repeatable": 1` - Make sure the quest is repeatable!
- `"IsDailyQuest": 1`
- `"IsWeeklyQuest": 0` - Make sure it's only a daily or weekly quest!

#### Weekly Quest
Weekly quests can be completed once per week and then set on a cooldown until the server's weekly quest reset.

Required parameters:
- `"Repeatable": 1` - Make sure the quest is repeatable!
- `"IsDailyQuest": 0` - Make sure it's only a daily or weekly quest!
- `"IsWeeklyQuest": 1`

---

## [Server Hosting] Quest Objectives Configuration

### File Information:
You can name an objective configuration file to whatever you want as long as it has the .json file extension and is placed in the related objective configurations folder.

### Main Objective Configuration Parameters:

#### "ConfigVersion"
Integer. Current config file version. NEVER CHANGE THIS!

#### "ID"
Integer. Unique objective ID. Make sure this ID is different for every single objective in this objective category!

#### "ObjectiveType"
Integer. Objective Type of this objective configuration.

- TARGET = 2 (Kill certain amount of mobs/players)
- TRAVEL = 3 (Go to location XY)
- COLLECT = 4 (Collect/find certain amount of items)
- DELIVERY = 5 (Deliver items to certain position and NPC)
- TREASUREHUNT = 6 (Find location containing stashed treasure)
- AIPATROL = 7 (Clear an AI patrol)
- AICAMP = 8 (Clear an AI Camp)
- AIVIP = 9 (Protect and escort an AI)
- ACTION = 10 (Execute certain Action)
- CRAFTING = 11 (Craft certain items)

#### "ObjectiveText"
String. The objective text displayed in the quest log and quest HUD.

#### "TimeLimit"
Integer. The time limit in seconds the quest player/s has to complete this objective.

#### "Active"
Boolean. Enable/disable this objective configuration file.

---

## [Server Hosting] Quest NPC Configuration

### File Information:
You can name a quest npc configuration file to whatever you want as long as it has the .json file extension and is placed in the quest npc configurations folder.

### Main NPC Configuration Parameters:

#### "ConfigVersion"
Integer. Current config file version. NEVER CHANGE THIS!

#### "ID"
Integer. Unique NPC ID. Make sure this ID is different for every single NPC configuration!

#### "ClassName"
String. NPC Class name to use for this NPC.

**Default NPC types:**
- ExpansionQuestNPCMirek, ExpansionQuestNPCDenis, ExpansionQuestNPCBoris, ExpansionQuestNPCCyril
- ExpansionQuestNPCElias, ExpansionQuestNPCFrancis, ExpansionQuestNPCGuo, ExpansionQuestNPCHassan
- ExpansionQuestNPCIndar, ExpansionQuestNPCJose, ExpansionQuestNPCKaito, ExpansionQuestNPCLewis
- ExpansionQuestNPCManua, ExpansionQuestNPCNiki, ExpansionQuestNPCOliver, ExpansionQuestNPCPeter
- ExpansionQuestNPCQuinn, ExpansionQuestNPCRolf, ExpansionQuestNPCSeth, ExpansionQuestNPCTaiki
- ExpansionQuestNPCLinda, ExpansionQuestNPCMaria, ExpansionQuestNPCFrida, ExpansionQuestNPCGabi
- ExpansionQuestNPCHelga, ExpansionQuestNPCIrena, ExpansionQuestNPCJudy, ExpansionQuestNPCKeiko
- ExpansionQuestNPCEva, ExpansionQuestNPCNaomi, ExpansionQuestNPCBaty

**Default AI NPC types (Only if Expansion-AI mod is loaded):**
- ExpansionQuestNPCAIMirek, ExpansionQuestNPCAIDenis, ExpansionQuestNPCAIBoris, etc.

**Default static object types:**
- ExpansionQuestObjectBoard, ExpansionQuestBoardSmall, ExpansionQuestBoardLarge, ExpansionQuestObjectLocker

#### "Position"
Vector. Position of the NPC to be spawned in the world.

#### "Orientation"
Vector. The orientation of the NPC when spawned.

#### "NPCName"
String. NPC name that gets displayed on the action.

#### "DefaultNPCText"
String. Default text displayed in the quest menu when interacting with this NPC.

#### "Waypoints"
Array. Only used if the NPC is an AI type. Should contain the NPCs position as the first waypoint entry!

#### "NPCEmoteID"
Integer. Only used if the NPC is an AI type. NPC Emote ID the NPC will play randomly.

#### "NPCEmoteIsStatic"
Boolean. Only used if the NPC is an AI type. Forces the NPC into this animation permanently.

#### "NPCLoadoutFile"
String. Loadout file name from the expansion loadouts folder.

#### "NPCInteractionEmoteID"
Integer. Only used if the NPC is an AI type. NPC Emote ID when interacting.

#### "NPCQuestCancelEmoteID"
Integer. Only used if the NPC is an AI type. NPC Emote ID when quest is canceled.

#### "NPCQuestStartEmoteID"
Integer. Only used if the NPC is an AI type. NPC Emote ID when quest is started.

#### "NPCQuestCompleteEmoteID"
Integer. Only used if the NPC is an AI type. NPC Emote ID when quest is completed.

#### "NPCFaction"
String. Only used if the NPC is an AI type. Controls the faction of the NPC.

#### "NPCType"
Integer. NPC type to set the right spawn event.
- NORMAL = 0 (Normal NPC type)
- OBJECT = 1 (Object type)
- AI = 2 (AI NPC type)

#### "Active"
Boolean. Enable/disable this configuration file.

### Example:

```json
{
    "ConfigVersion": 6,
    "ID": 1,
    "ClassName": "ExpansionQuestNPCAIDenis",
    "Position": [3706.27, 402.01, 5987.08],
    "Orientation": [282.0, 0.0, 0.0],
    "NPCName": "Peter",
    "DefaultNPCText": "Hmm?",
    "Waypoints": [[3706.27, 402.01, 5987.08]],
    "NPCEmoteID": 46,
    "NPCEmoteIsStatic": 0,
    "NPCLoadoutFile": "NBCLoadout",
    "NPCInteractionEmoteID": 1,
    "NPCQuestCancelEmoteID": 60,
    "NPCQuestStartEmoteID": 58,
    "NPCQuestCompleteEmoteID": 39,
    "NPCFaction": "InvincibleObservers",
    "NPCType": 2,
    "Active": 1
}
```

---

## [Server Hosting] Quest Settings

### Setting Parameters:

#### "m_Version"
Integer. Current setting file version. NEVER CHANGE THIS!

#### "EnableQuests"
Boolean. Enable/disable the quest system.

#### "EnableQuestLogTab"
Boolean. Only used if the Expansion-Book mod is loaded. Enable/disable the book quest log tab.

#### "CreateQuestNPCMarkers"
Boolean. Only used if the Expansion-Navigation mod is loaded. Set server map markers on quest NPC spawn locations.

#### "QuestAcceptedTitle" / "QuestAcceptedText"
String. Text displayed in notification when quest is accepted.

#### "QuestCompletedTitle" / "QuestCompletedText"
String. Text displayed in notification when quest is completed.

#### "QuestFailedTitle" / "QuestFailedText"
String. Text displayed in notification when quest is failed.

#### "QuestCanceledTitle" / "QuestCanceledText"
String. Text displayed in notification when quest is canceled.

#### "QuestTurnInTitle" / "QuestTurnInText"
String. Text displayed in notification when quest is turned-in.

#### "QuestObjectiveCompletedTitle" / "QuestObjectiveCompletedText"
String. Text displayed in notification when quest objective is completed.

#### "AchivementCompletedTitle" / "AchivementCompletedText"
String. Text displayed in notification when achievement quest is completed.

#### "WeeklyQuestResetDay"
String. Day name in English when weekly quest reset should happen.

#### "WeeklyQuestResetHour"
Integer. Hour when quest reset will happen for all weekly quests.

#### "WeeklyQuestResteMinute"
Integer. Minute when quest reset will happen for all weekly quests.

#### "DailyQuestResetHour"
Integer. Hour when quest reset will happen for all daily quests.

#### "DailyQuestResetMinute"
Integer. Minute when quest reset will happen for all daily quests.

#### "UseUTCTime"
Boolean. Use UTC server time or not for all quest cooldown and reset times.

#### "QuestCooldownTitle" / "QuestCooldownText"
String. Text displayed in notification when quest is on cooldown.

#### "QuestNotInGroupTitle" / "QuestNotInGroupText"
String. Text displayed when group quest is accepted without being in a group.

#### "QuestNotGroupOwnerTitle" / "QuestNotGroupOwnerText"
String. Text displayed when group quest is accepted/turned-in and player is not group owner.

#### "GroupQuestMode"
Integer.
- 0 - Only group owners can accept and turn-in group quests.
- 1 - Only group owner can turn-in group quest but all members can accept.
- 2 - All group members can accept and turn-in group quests.

### Example:

```json
{
    "m_Version": 10,
    "EnableQuests": 1,
    "EnableQuestLogTab": 1,
    "CreateQuestNPCMarkers": 1,
    "QuestAcceptedTitle": "Quest Accepted",
    "QuestAcceptedText": "The quest %1 has been accepted!",
    "QuestCompletedTitle": "Quest Completed",
    "QuestCompletedText": "All objectives of the quest %1 have been completed",
    "QuestFailedTitle": "Quest Failed",
    "QuestFailedText": "The quest %1 failed!",
    "QuestCanceledTitle": "Quest Canceled",
    "QuestCanceledText": "The quest %1 has been canceled!",
    "QuestTurnInTitle": "Quest Turn-In",
    "QuestTurnInText": "The quest %1 has been completed!",
    "QuestObjectiveCompletedTitle": "Objective Completed",
    "QuestObjectiveCompletedText": "You have completed the objective %1 of the quest %2.",
    "QuestCooldownTitle": "Quest Cooldown",
    "QuestCooldownText": "This quest is still on cooldown! Come back in %1",
    "QuestNotInGroupTitle": "Group Quest",
    "QuestNotInGroupText": "Group quests can only be accepted while in a group!",
    "QuestNotGroupOwnerTitle": "Group Quest",
    "QuestNotGroupOwnerText": "Only a group owner can accept and turn-in a group quest!",
    "GroupQuestMode": 0,
    "AchievementCompletedTitle": "Achievement \"%1\" completed!",
    "AchievementCompletedText": "%1",
    "WeeklyResetDay": "Wednesday",
    "WeeklyResetMinute": 0,
    "WeeklyResetHour": 8,
    "DailyResetHour": 8,
    "DailyResetMinute": 0,
    "UseUTCTime": 0,
    "UseQuestNPCIndicators": 1,
    "MaxActiveQuests": 5
}
```


---

## Detailed Objective Configurations

### Action Objective Configuration

Quest player/s will need to execute a certain action a specific amount of times.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 10,
    "ObjectiveText": "Lockpick a vehicle",
    "TimeLimit": -1,
    "Active": 1,
    "ActionNames": [
        "ExpansionVehicleActionPickLock",
        "ExpansionActionPickVehicleLockBase",
        "ExpansionActionPickVehicleLock"
    ],
    "AllowedClassNames": [],
    "ExcludedClassNames": [],
    "ExecutionAmount": 1
}
```

#### Parameters:

**"ActionNames"**
Array[String]. Class names of the action classes that will trigger this objective.

**"AllowedClassNames"**
Array[String]. Class names of items/entities that are allowed for this action objective. Example: If we add "PotatoSeed" and the player needs to execute "Plant seed" action, the objective would only be completed when using "PotatoSeed".

**"ExcludedClassNames"**
Array[String]. Class names of items/entities that are NOT allowed for this action objective. Example: If we add "PotatoSeed" and the player needs to execute "Plant seed" action, the objective would only be completed when using any seed BUT NOT "PotatoSeed".

**"ExecutionAmount"**
Integer. Controls how many times the action needs to be executed to complete this objective.

---

### AI Camp Objective Configuration

Quest player/s will need to clear an AI Camp at a specific location.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 8,
    "ObjectiveText": "Kill all 10 bandits at the marked location",
    "TimeLimit": -1,
    "Active": 1,
    "InfectedDeletionRadius": 500.0,
    "AISpawns": [
        {
            "NumberOfAI": 1,
            "NPCName": "Quest Target",
            "Waypoints": [[4351.33, 307.07, 6400.52]],
            "Behaviour": 0,
            "Formation": "RANDOM",
            "Loadout": "BanditLoadout",
            "Faction": "West",
            "Speed": 0.0,
            "ThreatSpeed": 3.0,
            "MinAccuracy": 0.0,
            "MaxAccuracy": 0.0,
            "CanBeLooted": 1,
            "UnlimitedReload": 1,
            "ThreatDistanceLimit": 150.0,
            "DamageMultiplier": 1.0,
            "DamageReceivedMultiplier": 1.0,
            "ClassNames": ["eAI_SurvivorM_Boris", "eAI_SurvivorM_Denis"],
            "SniperProneDistanceThreshold": 300.0,
            "RespawnTime": 1.0,
            "DespawnTime": 1.0,
            "MinDistanceRadius": 50.0,
            "MaxDistanceRadius": 150.0,
            "DespawnRadius": 880.0
        }
    ],
    "MaxDistance": -1.0,
    "MinDistance": -1.0,
    "AllowedWeapons": [],
    "AllowedDamageZones": []
}
```

#### Parameters:

**"InfectedDeletionRadius"**
Float. Deletion radius for infected/zombies within the objective area. Set to 0 to disable the deletion of infected.

**"AISpawns"**
Array. An array of AI unit spawn entries. Each entry is for one AI unit and every unit can be configured individually.

**AI Spawn Entry Parameters:**

- **"NumberOfAI"** - Integer. Amount of spawned AI units for this spawn entry (should always be 1).
- **"NPCName"** - String. Name displayed in name tags and tooltips.
- **"Waypoints"** - Array. Waypoints for the AI unit. First entry should always be the initial spawn position.
- **"Behaviour"** - eAIWaypointBehavior:
  - 0 = HALT
  - 1 = LOOP
  - 2 = ALTERNATE
  - 3 = HALT_OR_LOOP
  - 4 = HALT_OR_ALTERNATE
- **"Formation"** - String. Should be always "RANDOM" as the spawned unit is not in a group.
- **"Loadout"** - String. AI unit loadout file from the AI loadout folder.
- **"Faction"** - String. Faction used for the spawned AI unit.
- **"Speed"** - Float. Min. speed of the spawned AI unit.
- **"ThreatSpeed"** - Float. Max. speed when in threat mode.
- **"MinAccuracy"** - Float. Min. weapon accuracy.
- **"MaxAccuracy"** - Float. Max. weapon accuracy.
- **"CanBeLooted"** - Boolean. Enable/disable if the AI can be looted.
- **"UnlimitedReload"** - Boolean. Enable/disable unlimited reloads.
- **"ThreatDistanceLimit"** - Float. Max. distance from spawn position before losing threat target.
- **"DamageMultiplier"** - Float. Damage multiplier for damage dealt. Can be negative to reduce damage.
- **"DamageReceivedMultiplier"** - Float. Damage multiplier for damage received. Can be negative to reduce incoming damage.
- **"ClassNames"** - Array[String]. Valid eAIBase entity types to spawn.
- **"SniperProneDistanceThreshold"** - Float. Distance to target where AI will use prone stance.
- **"RespawnTime"** - Float. Respawn time when no player is within proximity range.
- **"DespawnTime"** - Float. Despawn time when no player is within proximity range.
- **"MinDistanceRadius"** - Float. Min. proximity range for spawn/despawn.
- **"MaxDistanceRadius"** - Float. Max. proximity range for spawn/despawn.
- **"DespawnRadius"** - Float. Despawns AI when player is outside this range from spawn position.

**"MaxDistance"**
Float. Max. distance a player can have to an executed AI unit to count the kill.

**"MinDistance"**
Float. Min. distance a player can have to an executed AI unit to count the kill.

**"AllowedWeapons"**
Array[String]. If not empty, controls the allowed weapons quest players must use to kill targets. Leave empty to disable.

**"AllowedDamageZones"**
Array[String]. If not empty, defines valid hit zones where the player needs to hit to count the kill.

**Valid AI/Players and infected damage zones:**
- Head, Brain, LeftArm, RightArm, LeftLeg, RightLeg, LeftFoot, RightFoot, Torso

---

### AI Patrol Objective Configuration

Quest player/s will need to clear an AI patrol at a specific location.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 7,
    "ObjectiveText": "Kill all 4 units of the bandit patrol at the marked location",
    "TimeLimit": -1,
    "Active": 1,
    "AISpawn": {
        "NumberOfAI": 4,
        "NPCName": "Quest Target",
        "Waypoints": [
            [6914.70, 403.03, 11381.70],
            [6931.27, 399.86, 11456.70],
            [6891.92, 397.45, 11496.10]
        ],
        "Behaviour": 0,
        "Formation": "RANDOM",
        "Loadout": "BanditLoadout",
        "Faction": "West",
        "Speed": 1.0,
        "ThreatSpeed": 3.0,
        "MinAccuracy": 0.0,
        "MaxAccuracy": 0.0,
        "CanBeLooted": 1,
        "UnlimitedReload": 1,
        "ThreatDistanceLimit": 150.0,
        "DamageMultiplier": 1.0,
        "DamageReceivedMultiplier": 1.0,
        "ClassNames": ["eAI_SurvivorM_Boris", "eAI_SurvivorM_Denis"],
        "SniperProneDistanceThreshold": 300.0,
        "RespawnTime": 1.0,
        "DespawnTime": 1.0,
        "MinDistanceRadius": 50.0,
        "MaxDistanceRadius": 150.0,
        "DespawnRadius": 880.0
    },
    "MaxDistance": -1.0,
    "MinDistance": -1.0,
    "AllowedWeapons": [],
    "AllowedDamageZones": []
}
```

#### Parameters:

**"AISpawn"**
Object. Single AI patrol group configuration.

**AI Patrol Parameters:**

- **"NumberOfAI"** - Integer. Amount of spawned AI units for this patrol group.
- **"NPCName"** - String. Name displayed in name tags and tooltips for all patrol units.
- **"Waypoints"** - Array. Waypoints for the patrol to follow. First entry should always be the initial spawn position.
- **"Behaviour"** - eAIWaypointBehavior:
  - 0 = HALT
  - 1 = LOOP
  - 2 = ALTERNATE
  - 3 = HALT_OR_LOOP
  - 4 = HALT_OR_ALTERNATE
- **"Formation"** - String. eAIFormation used for the spawned AI patrol.
- **"Loadout"** - String. AI unit loadout file from the AI loadout folder.
- **"Faction"** - String. eAIFaction type used for the spawned AI patrol.
- **"Speed"** - Float. Min. speed of the spawned AI patrol.
- **"ThreatSpeed"** - Float. Max. speed when in threat mode.
- **"MinAccuracy"** - Float. Min. weapon accuracy.
- **"MaxAccuracy"** - Float. Max. weapon accuracy.
- **"CanBeLooted"** - Boolean. Enable/disable if the patrol can be looted.
- **"UnlimitedReload"** - Boolean. Enable/disable unlimited reloads.
- **"ThreatDistanceLimit"** - Float. Max. distance from spawn position before losing threat target.
- **"DamageMultiplier"** - Float. Damage multiplier for damage dealt.
- **"DamageReceivedMultiplier"** - Float. Damage multiplier for damage received.
- **"ClassNames"** - Array[String]. Valid eAIBase entity types to spawn.
- **"SniperProneDistanceThreshold"** - Float. Distance to target where AI will use prone stance.
- **"RespawnTime"** - Float. Respawn time when no player is within proximity range.
- **"DespawnTime"** - Float. Despawn time when no player is within proximity range.
- **"MinDistanceRadius"** - Float. Min. proximity range for spawn/despawn.
- **"MaxDistanceRadius"** - Float. Max. proximity range for spawn/despawn.
- **"DespawnRadius"** - Float. Despawns AI when player is outside this range.

**"MaxDistance"**
Float. Max. distance a player can have to an executed AI unit to count the kill.

**"MinDistance"**
Float. Min. distance a player can have to an executed AI unit to count the kill.

**"AllowedWeapons"**
Array[String]. If not empty, controls the allowed weapons quest players must use. Leave empty to disable.

**"AllowedDamageZones"**
Array[String]. If not empty, defines valid hit zones where the player needs to hit to count the kill.

**Valid damage zones:**
- Head, Brain, LeftArm, RightArm, LeftLeg, RightLeg, LeftFoot, RightFoot, Torso

For other entities, check the RV CfgVehicles configuration class (config.cpp) and look up the children of the DamageZones class.


---

### AI VIP Objective Configuration

Quest player/s will need to protect and escort an AI to a certain location.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 9,
    "ObjectiveText": "Bring the VIP to the marked location.",
    "TimeLimit": 180,
    "Active": 1,
    "Position": [3193.59, 296.71, 6090.57],
    "MaxDistance": 20.0,
    "MarkerName": "Escort VIP",
    "ShowDistance": 1,
    "CanLootAI": 0,
    "NPCLoadoutFile": "BanditLoadout",
    "NPCClassName": "",
    "NPCName": "Survivor"
}
```

#### Parameters:

**"Position"** - Vector. Objective position to where the VIP AI needs to be escorted.

**"MaxDistance"** - Float. If the escorted AI is within the given range from the objective position the objective will be triggered as completed.

**"MarkerName"** - String. Text for the objective quest marker. Leave empty to create no marker.

**"ShowDistance"** - Boolean. Controls whether the distance to the objective position will be displayed in the quest HUD.

**"CanLootAI"** - Boolean. Controls if spawned AI can be looted or not.

**"NPCLoadoutFile"** - String. NPC loadout file. Same as for AI patrol settings.

**"NPCClassName"** - String. NPC class name of the eAI entity that should be used to spawn in the VIP NPC. Leave the field empty to get a random AI unit.

**"NPCName"** - String. Name of the AI units that will be displayed in all name tags and tooltips for the spawned AI unit.

---

### Collection Objective Configuration

Quest player/s will need to collect/find a certain amount of items.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 4,
    "ObjectiveText": "Collect 5 apples",
    "TimeLimit": -1,
    "Active": 1,
    "Collections": [
        {
            "Amount": 5,
            "ClassName": "Apple",
            "QuantityPercent": -1,
            "MinQuantityPercent": 0
        }
    ],
    "ShowDistance": 1,
    "AddItemsToNearbyMarketZone": 0,
    "NeedAnyCollection": 0
}
```

#### Parameters:

**"Collections"** - Array[ExpansionQuestObjectiveDelivery]. Items the quest players need to/can collect for this objective.

- **"Amount"** - Integer. Amount needed for the objective item.
- **"ClassName"** - String. Class name of the item needed.
- **"QuantityPercent"** - Integer. Max. quantity percentage of the item so it gets counted by the objective.
- **"MinQuantityPercent"** - Integer. Min. quantity percentage of the item so it gets counted by the objective.

**"ShowDistance"** - Boolean. Controls whether the distance to the objective position will be displayed in the quest HUD.

**"AddItemsToNearbyMarketZone"** - Boolean. Only used when the market mod is loaded and the quest turn-in NPC is within a market zone. Controls if the objective items get added to the nearby market zone after the quest with this objective has been completed.

**"NeedAnyCollection"** - Boolean. Controls if the quest players need to collect all the items defined in the "Collections" array or only one. If enabled and players still have more than one objective item then they will need to select the item they want to use to complete this quest when turning the quest in.

---

### Crafting Objective Configuration

Quest player/s will need to craft certain items.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 11,
    "ObjectiveText": "Craft an improvised fishing rod",
    "TimeLimit": -1,
    "Active": 1,
    "ItemNames": ["ImprovisedFishingRod"],
    "ExecutionAmount": 1
}
```

#### Parameters:

**"ItemNames"** - Array[String]. Class names of the items the player can craft to complete this objective.

**"ExecutionAmount"** - Integer. How many times does the crafting action need to be executed to complete the objective?

---

### Delivery Objective Configuration

Quest player/s will need to deliver given items to a certain position and NPC.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 5,
    "ObjectiveText": "Deliver the note to Steve",
    "TimeLimit": -1,
    "Active": 1,
    "Collections": [
        {
            "Amount": 1,
            "ClassName": "ExpansionQuestItemPaper",
            "QuantityPercent": -1,
            "MinQuantityPercent": 0
        }
    ],
    "ShowDistance": 1,
    "AddItemsToNearbyMarketZone": 0,
    "MaxDistance": 10.0,
    "MarkerName": "Deliver Items"
}
```

#### Parameters:

**"Collections"** - Array[ExpansionQuestObjectiveDelivery]. Items the quest players need to deliver for this objective and that will be spawned on the main quest player when the quest with this objective is accepted/started.

- **"Amount"** - Integer. Amount needed for the objective item.
- **"ClassName"** - String. Class name of the item needed.
- **"QuantityPercent"** - Integer. Max. quantity percentage of the item so it gets counted by the objective. Use 10 when the item has a quantity to match with the needed amount.
- **"MinQuantityPercent"** - Integer. Min. quantity percentage of the item so it gets counted by the objective.

**"ShowDistance"** - Boolean. Controls whether the distance to the objective position will be displayed in the quest HUD.

**"AddItemsToNearbyMarketZone"** - Boolean. Only used when the market mod is loaded and the quest turn-in NPC is within a market zone.

**"MaxDistance"** - Float. Max. distance to the turn-in NPC position to complete the distance check for the objective.

**"MarkerName"** - String. Given text is used for the quest objective marker when the Expansion-Navigation mod is loaded and 2D or 3D markers are enabled.

---

### Target Objective Configuration

Quest player/s will need to kill a certain amount of mobs/players (Optional: With a special weapon).

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 2,
    "ObjectiveText": "Kill 10 Infected with a sledgehammer",
    "TimeLimit": -1,
    "Active": 1,
    "Position": [2596.70, 306.10, 6378.47],
    "MaxDistance": 150.0,
    "MinDistance": -1.0,
    "Amount": 10,
    "ClassNames": [
        "ZmbM_CitizenASkinny_Base",
        "ZmbM_CitizenBFat_Base",
        "ZmbF_CitizenANormal_Base"
    ],
    "CountSelfKill": 0,
    "AllowedWeapons": ["SledgeHammer"],
    "ExcludedClassNames": [],
    "CountAIPlayers": 0,
    "AllowedTargetFactions": [],
    "AllowedDamageZones": []
}
```

#### Parameters:

**"Position"** - Vector. Objective positions where the given entities need to be eliminated. Leave empty or set to vector 0 to disable this condition.

**"MaxDistance"** - Float. If an objective position is defined then the quest players need to be outside the given range when they eliminate a target to count it for the objective.

**"MinDistance"** - Float. If an objective position is defined then the quest players need to be within the given range when they eliminate a target to count it for the objective.

**"Amount"** - Integer. Amount of eliminations that need to be executed on given entities to complete this objective.

**"ClassNames"** - Array[String]. Class names that will be used to control kills. If a unit gets killed that is not in this array the kill will not count for this objective.

**"CountSelfKill"** - Boolean. If the target entity is a type of player this parameter controls if player suicides or eliminations on the quest players will count towards the quest objective.

**"AllowedWeapons"** - Array[String]. If not empty then this array controls the allowed weapons the quest players can and need to use to kill certain objective targets. If empty this check is disabled.

**"ExcludedClassNames"** - Array[String]. Class names of entities that will not count towards the objective when eliminated.

**"CountAIPlayers"** - Boolean. If the target entity is a type of expansion AI unit this parameter controls if AI eliminations will count towards the quest objective.

**"AllowedTargetFactions"** - Array[String]. Names of the factions a kill target can be in when it is a player or AI. Kills will be only counted when the target is in one of the given factions.

**"AllowedDamageZones"** - Array[String]. If not empty then you can define valid hit zones where the player needs to hit to execute an AI unit to count the kill for the objective.

**Valid damage zones:** Head, Brain, LeftArm, RightArm, LeftLeg, RightLeg, LeftFoot, RightFoot, Torso

---

### Travel Objective Configuration

Quest player/s will need to go to location XY.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 3,
    "ObjectiveText": "Get to the Village",
    "TimeLimit": -1,
    "Active": 1,
    "Position": [4333.37, 311.78, 6299.88],
    "MaxDistance": 20.0,
    "MarkerName": "Get to the Village",
    "ShowDistance": 1,
    "TriggerOnEnter": 1,
    "TriggerOnExit": 0
}
```

#### Parameters:

**"Position"** - Vector. Objective positions where the quest players need to travel to.

**"MaxDistance"** - Float. If a quest player is within the given range to the objective position the objective will get triggered as completed.

**"MarkerName"** - String. Text for the objective quest marker. Leave empty to create no marker.

**"ShowDistance"** - Boolean. Controls whether the distance to the objective position will be displayed in the quest HUD.

**"TriggerOnEnter"** - Boolean. Controls if the distance check will trigger when entering the defined objective area. Should always be enabled as this objective type will not be complete otherwise!

**"TriggerOnExit"** - Boolean. Controls if the distance check will trigger and set the objective to incomplete when leaving the defined objective area.

---

### Treasure Hunt Objective Configuration

Quest player/s will need to find a location containing a stashed treasure.

#### Example Configuration:

```json
{
    "ConfigVersion": 26,
    "ID": 1,
    "ObjectiveType": 6,
    "ObjectiveText": "Find the location of the treasure",
    "TimeLimit": -1,
    "Active": 1,
    "ShowDistance": 1,
    "ContainerName": "ExpansionQuestSeaChest",
    "DigInStash": 1,
    "MarkerName": "???",
    "MarkerVisibility": 4,
    "Positions": [
        [2936.48, 350.61, 6369.39],
        [3143.35, 365.78, 6942.04],
        [5233.51, 290.88, 6246.37]
    ],
    "Loot": [
        {
            "Name": "AKM",
            "Attachments": ["AK_WoodBttstck", "AK_WoodHndgrd", "Mag_AKM_30Rnd"],
            "Chance": 1.0,
            "QuantityPercent": -2,
            "Max": 1,
            "Min": 0,
            "Variants": []
        },
        {
            "Name": "Mag_AKM_30Rnd",
            "Attachments": [],
            "Chance": 1.0,
            "QuantityPercent": -2,
            "Max": 2,
            "Min": 2,
            "Variants": []
        }
    ],
    "LootItemsAmount": 3,
    "MaxDistance": 10.0
}
```

#### Parameters:

**"ShowDistance"** - Boolean. Controls whether the distance to the objective position will be displayed in the quest HUD.

**"ContainerName"** - String. Container entity class name that will be used for this objective. The entity class always needs to inherit from "ExpansionQuestContainerBase".

**"DigInStash"** - Boolean. Controls if the container will be dug into an underground stash or not.

**"MarkerName"** - String. Text for the objective quest marker. Leave empty to create no marker.

**"MarkerVisibility"** - Integer. Defines the visibility of the objective quest marker:
- 4 = visible on map
- 2 = visible in world
- 6 = visible on map and in world

**"Positions"** - Array[Vector]. A random position from this array will be selected when the quest with this objective is started and set as the stash and objective position.

**"Loot"** - Array[ExpansionLoot]. Loot reward items that will get spawned/attached into/on the stash.

**"LootItemsAmount"** - Integer. Max amount of loot items that will get selected and spawned into the stash from the defined expansion loot configuration.

**"MaxDistance"** - Float. If a quest player is within a given range of the objective position the stash will be created and spawned.
