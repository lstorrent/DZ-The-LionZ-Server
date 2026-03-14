# How to configure the Expansion Book

## Server Informations Tab
- Side Buttons
- Server Description
- Server Settings

## Server Rules Tab
### How to create your own rules

## Crafting Recipes Tab
### How to add new recipes (crafts)

## Other tabs

### "EnableStatusTab"
This setting allows you to enable or disable the "Player Profile" tab.

- 0 = Disabled
- 1 = Enabled

### "EnablePartyTab"
This setting allows you to enable or disable the "Party Manager" tab.

- 0 = Disabled
- 1 = Enabled

**Caution:** Disabling it will prevent players to create parties (groups)!

### "EnableTerritoryTab"
This setting allows you to enable or disable the "Territory Manager" tab.

- 0 = Disabled
- 1 = Enabled

**Caution:** Disabling it will prevent players to invite/kick/manage players into their territory

### "EnableBookMenu"
This setting allows you to enable or disable the book.

- 0 = Disabled
- 1 = Enabled

### "CreateBookmarks"
Currently doesn't work, in the old version of the book. Tabs were shown on the top of the book like bookmarks. This feature as yet to be re introduced.


---

## Setting up the Server Book Tab [Buttons]

### Server Info tab

### Where do you need to go?
Go to `DayZServer\ServerProfile` (or config)`\ExpansionMod\Settings` and open the `BookSettings.json`

### How does it work?

```json
{
    "Name": "Feedback",
    "URL": "https://exp.thurston.pw/",
    "IconName": "Forums",
    "IconColor": -14473430
},
{
    "Name": "My Name To Display",
    "URL": "My Link here",
    "IconName": "MyIconHere",
    "IconColor": -14473430
}
```

**REMOVE** the `,` from `},` on the last server button config entry.

### Configuration Options

#### "Links"
Array. Contain a list of social links.

#### "Links" -> "Name"
String. The name to display

#### "Links" -> "URL"
String. The URL used for this link

#### "Links" -> "IconName"
String. The icon to display. A list will be provided later

#### "Links" -> "IconColor"
Integer. The color of the icon

**Use this website to generate the color you want to apply on your Icon!**

Enter the RGBA values and then click on the button "ARGB → int" to generate the color code you will need.

- R: Red
- G: Green
- B: Blue
- A: Opacity from 0 (can't be seen) to 255 (very visible, opaque)

You can use this website to generate the RGBA color, however watch out this website generate the A value from 0 to 1 instead of 255!

### Example

```json
"Links": [
    {
        "Name": "Homepage",
        "URL": "https://www.google.com/",
        "IconName": "Homepage",
        "IconColor": -14473430
    },
    {
        "Name": "Feedback",
        "URL": "https://exp.thurston.pw/",
        "IconName": "Forums",
        "IconColor": -14473430
    },
    {
        "Name": "Discord",
        "URL": "https://www.google.com/",
        "IconName": "Discord",
        "IconColor": -9270822
    },
    {
        "Name": "Patreon",
        "URL": "https://www.patreon.com/dayzexpansion",
        "IconName": "Patreon",
        "IconColor": -432044
    },
    {
        "Name": "Steam",
        "URL": "https://steamcommunity.com/sharedfiles/filedetails/?id=2116151222",
        "IconName": "Steam",
        "IconColor": -14006434
    },
    {
        "Name": "Reddit",
        "URL": "https://www.reddit.com/r/ExpansionProject/",
        "IconName": "Reddit",
        "IconColor": -12386303
    },
    {
        "Name": "GitHub",
        "URL": "https://github.com/salutesh/DayZ-Expansion-Scripts/wiki",
        "IconName": "GitHub",
        "IconColor": -16777216
    },
    {
        "Name": "YouTube",
        "URL": "https://www.youtube.com/channel/UCZNgSvIEWfru963tQZOAVJg",
        "IconName": "YouTube",
        "IconColor": -65536
    },
    {
        "Name": "Twitter",
        "URL": "https://twitter.com/DayZExpansion",
        "IconName": "Twitter",
        "IconColor": -14835214
    }
]
```


---

## Setting up the Server Book Tab [Description]

### Server Info tab

### Where do you need to go?
Go to `DayZServer\ServerProfile` (or config)`\ExpansionMod\Settings` and open the `BookSettings.json`

### How does it work?

```json
"Descriptions": [
    {
        "CategoryName": "My First Category",
        "Descriptions": [
            {
                "DescriptionText": "My first paragraph !"
            },
            {
                "DescriptionText": "And my second paragraph :)"
            }
        ]
    },
    {
        "CategoryName": "My Second Category",
        "Descriptions": [
            {
                "DescriptionText": "And this paragraph is in a new category"
            }
        ]
    }
]
```

**REMOVE** the `,` from `},` at the last DescriptionText and Descriptions entry.

### Configuration Options

#### "Descriptions"
Array. A list of description categories.

#### "Descriptions" -> "CategoryName"
String. The title of this category.

#### "Descriptions" -> "Descriptions"
Array. A list of description for this category

#### "Descriptions" -> "Descriptions" -> "DescriptionText"
String. The text content for this description paragraph.


---

## Setting up the Server Settings Tab

### Server Info tab

### Where do you need to go?
Go to `DayZServer\ServerProfile` (or config)`\ExpansionMod\Settings` and open the `BookSettings.json`

### How does it work?

```json
"SettingCategories": [
    {
        "CategoryName": "Base-Building Settings",
        "Settings": [
            {
                "SettingTitle": "Expansion.Settings.BaseBuilding.CanCraftVanillaBasebuilding",
                "SettingText": "Fence and Watchtower",
                "SettingValue": "Disabled"
            },
            {
                "SettingTitle": "Expansion.Settings.BaseBuilding.CanCraftExpansionBasebuilding",
                "SettingText": "My Custom Text to display",
                "SettingValue": "My Custom Value to display"
            }
        ]
    },
    {
        "CategoryName": "Party Settings",
        "Settings": [
            {
                "SettingTitle": "Expansion.Settings.Party.MaxMembersInParty",
                "SettingText": "",
                "SettingValue": ""
            },
            {
                "SettingTitle": "Expansion.Settings.Party.UseWholeMapForInviteList",
                "SettingText": "",
                "SettingValue": ""
            }
        ]
    }
]
```

**REMOVE** the `,` from `},`

### Configuration Options

#### "CategoryName"
String. The name title of a list of settings.

#### "Settings"
Array. A list of settings.

#### "Settings" -> "SettingTitle"
String. The path of this setting.

- Format: `"Expansion.Settings.Category.SettingName"`
- Example: `"Expansion.Settings.BaseBuilding.CanCraftVanillaBasebuilding"`

#### "Settings" -> "SettingText"
String. You can write a custom description or leave it empty.

#### "Settings" -> "SettingValue"
String. You can also use this setting to display a custom secondary information about this setting. If it's enabled or disabled for example.


---

## Setting up the Rule Book Tab

### Where do you need to go?
Go to `DayZServer\ServerProfile` (or config)`\ExpansionMod\Settings` and open the `BookSettings.json`

### How does it work?

```json
"RuleCategories": [
    {
        "CategoryName": "General",
        "Rules": [
            {
                "RuleParagraph": "1.1.",
                "RuleText": "Insults, discrimination, extremist and racist statements or texts are taboo."
            },
            {
                "RuleParagraph": "1.2.",
                "RuleText": "We reserve the right to exclude people from the server who share extremist or racist ideas or who clearly disturb the server harmony."
            }
        ]
    },
    {
        "CategoryName": "Memes",
        "Rules": [
            {
                "RuleParagraph": "One",
                "RuleText": "No step on snek"
            },
            {
                "RuleParagraph": "Two",
                "RuleText": "We are waiting for you, in the test chamberrr"
            }
        ]
    }
]
```

**REMOVE** the `,` from `},` on the last rule category config and rule entry.

### Configuration Options

#### "RuleCategories"
Array. A list of rules.

#### "RuleCategories" -> "CategoryName"
String. The title of a rule category.

#### "RuleCategories" -> "Rules"
Array. A list of rules from a category.

#### "RuleCategories" -> "Rules" -> "RuleParagraph"
String. Allows to give a rule number to your text.

#### "RuleCategories" -> "Rules" -> "RuleText"
String. The text of your rule.


---

## [Server Hosting] How to add new recipes (BookSettings)

### Where do you need to go?
Go to `DayZServer\ServerProfile` (or config)`\ExpansionMod\Settings` and open the `BookSettings.json`

### How does it work?

```json
{
    "CategoryName": "BaseBuilding Kits",
    "Results": [
        "fencekit",
        "watchtowerkit",
        "territorykit"
    ]
}
```

**REMOVE** the `,` if it's the last entry of your results or your last category

### Configuration Options

#### "CategoryName"
String. The name to display of this category

#### "Results"
Array. Contain a list of crafted items. The system will automatically find what items need to be combined to craft this item.

**Note:** Yes this can be used with any items from any mods as long as they are from a crafting 'recipe' (item A + Item B = result)
