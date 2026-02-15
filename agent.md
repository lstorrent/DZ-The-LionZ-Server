# 🦁 Agent Guide - DayZ Expansion Configuration

## 📚 Referência Principal
Wiki Oficial: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki

## 🎯 Contexto do Projeto
Este é o servidor **The LionZ** - um servidor DayZ modded PvP focado em proporcionar uma experiência imersiva e desafiadora para a comunidade brasileira.

## 📁 Estrutura de Configuração

### Localização dos Arquivos
```
mpmissions/dayzOffline.chernarusplus/expansion/settings/
```

### Arquivos Principais de Configuração

#### 1. AIPatrolSettings.json
Configuração de patrulhas de IA e comportamento dos NPCs.

**Parâmetros Globais:**
- `Enabled`: Ativa/desativa o sistema de patrulhas (0 ou 1)
- `DespawnTime`: Tempo em segundos para despawn (600.0 = 10 minutos)
- `RespawnTime`: Tempo para respawn (-1.0 = usa padrão)
- `MinDistRadius`: Raio mínimo de spawn (400.0m)
- `MaxDistRadius`: Raio máximo de spawn (1000.0m)
- `DespawnRadius`: Raio de despawn (1100.0m)
- `AccuracyMin/Max`: Precisão da IA (-1.0 = padrão)
- `DamageMultiplier`: Multiplicador de dano causado pela IA
- `DamageReceivedMultiplier`: Multiplicador de dano recebido pela IA

**LoadBalancingCategories:**
Sistema de balanceamento baseado no número de jogadores online.

Categorias disponíveis:
- `Global`: Patrulhas gerais do mapa
- `HelicopterWreck`: Patrulhas em destroços de helicóptero
- `ObjectPatrol`: Patrulhas em objetos específicos
- `ContaminatedArea`: Patrulhas em áreas contaminadas
- `Patrol`: Patrulhas customizadas
- `Quest`: Patrulhas relacionadas a missões

**Configuração de Patrulhas:**

Cada patrulha possui:
- `Name`: Nome identificador da patrulha
- `Faction`: Facção ("West", "East", "Civilian")
- `NumberOfAI`: Número mínimo de IA
- `NumberOfAIMax`: Número máximo de IA
- `Behaviour`: Comportamento ("HALT", "ALTERNATE", "HALT_OR_ALTERNATE", "LOOP")
- `Speed`: Velocidade ("WALK", "JOG", "SPRINT")
- `UnderThreatSpeed`: Velocidade sob ameaça
- `DefaultStance`: Postura padrão ("STANDING", "CROUCH", "PRONE")
- `CanBeLooted`: Se pode ser saqueado (0 ou 1)
- `Loadout`: Nome do loadout customizado
- `Waypoints`: Array de coordenadas [X, Y, Z]

**Tipos de Spawn:**
1. **ObjectClassName**: Spawna IA próximo a objetos específicos (ex: "Wreck_UH1Y")
2. **Waypoints**: Define pontos de patrulha manualmente

#### 2. BookSettings.json
Configuração do livro in-game (tecla B) que exibe informações do servidor, regras, status do jogador, party e territórios.

**Abas Disponíveis:**
- `EnableStatusTab`: Aba de status do personagem (saúde, fome, sede) (0 ou 1)
- `EnablePartyTab`: Aba de gerenciamento de grupos (0 ou 1)
- `EnableServerInfoTab`: Aba de informações do servidor (0 ou 1)
- `EnableServerRulesTab`: Aba de regras do servidor (0 ou 1)
- `EnableTerritoryTab`: Aba de gerenciamento de territórios (0 ou 1)
- `EnableBookMenu`: Habilita/desabilita o livro completamente (0 ou 1)

**Configurações Visuais:**
- `CreateBookmarks`: Exibe marcadores no topo para navegação rápida (0 ou 1)
- `ShowHaBStats`: Exibe estatísticas do mod Heroes and Bandits se instalado (0 ou 1)
- `DisplayServerSettingsInServerInfoTab`: Mostra configurações do servidor na aba info (0 ou 1)

**RuleCategories** (Array):
Categorias de regras do servidor.

Estrutura:
```json
"RuleCategories": [
    {
        "CategoryName": "Regras Gerais",
        "Rules": [
            {
                "RuleParagraph": "1.1.",
                "RuleText": "Respeite todos os jogadores"
            },
            {
                "RuleParagraph": "1.2.",
                "RuleText": "Não use cheats ou exploits"
            }
        ]
    }
]
```

- `CategoryName`: Título da categoria de regras
- `Rules`: Array de regras
  - `RuleParagraph`: Numeração/identificação da regra (ex: "1.1.", "A)", "§1")
  - `RuleText`: Texto da regra

**SettingCategories** (Array):
Exibe configurações do servidor na aba de informações.

Estrutura:
```json
"SettingCategories": [
    {
        "CategoryName": "Base-Building Settings",
        "Settings": [
            {
                "SettingTitle": "Expansion.Settings.BaseBuilding.CanCraftVanillaBasebuilding",
                "SettingText": "Descrição customizada (opcional)",
                "SettingValue": "Enabled/Disabled (opcional)"
            }
        ]
    }
]
```

- `CategoryName`: Nome da categoria de configurações
- `Settings`: Array de configurações
  - `SettingTitle`: Caminho da configuração (formato: "Expansion.Settings.Category.SettingName")
  - `SettingText`: Descrição customizada (pode ficar vazio "")
  - `SettingValue`: Valor ou status customizado (pode ficar vazio "")

**Links** (Array):
Links sociais e externos exibidos no livro.

Estrutura:
```json
"Links": [
    {
        "Name": "Discord",
        "URL": "https://discord.gg/seuservidor",
        "IconName": "Discord",
        "IconColor": -14473430
    }
]
```

- `Name`: Nome do link a exibir
- `URL`: URL completa do link
- `IconName`: Nome do ícone (Discord, Forums, Website, etc.)
- `IconColor`: Cor do ícone em formato ARGB integer

**Gerador de Cores:**
Use https://www.shodor.org/~efarrow/trunk/html/rgbint.html
- Entre com valores RGBA (R: Red, G: Green, B: Blue, A: Opacity 0-255)
- Clique em "ARGB → int" para gerar o código

**Descriptions** (Array):
Descrições e informações sobre o servidor.

Estrutura:
```json
"Descriptions": [
    {
        "CategoryName": "Sobre o Servidor",
        "Descriptions": [
            {
                "DescriptionText": "Bem-vindo ao The LionZ!"
            },
            {
                "DescriptionText": "Servidor PvP modded com foco em imersão."
            }
        ]
    }
]
```

- `CategoryName`: Título da categoria de descrição
- `Descriptions`: Array de parágrafos
  - `DescriptionText`: Texto do parágrafo

**CraftingCategories** (Array):
Exibe receitas de crafting organizadas por categoria.

Estrutura:
```json
"CraftingCategories": [
    {
        "CategoryName": "Essenciais",
        "Results": [
            "fireplace",
            "splint",
            "improvisedsuppressor"
        ]
    }
]
```

- `CategoryName`: Nome da categoria de crafting
- `Results`: Array com nomes dos itens craftáveis (classnames em minúsculo)

**Exemplo Completo para The LionZ:**
```json
{
    "EnableServerInfoTab": 1,
    "EnableServerRulesTab": 1,
    "RuleCategories": [
        {
            "CategoryName": "Regras Gerais",
            "Rules": [
                {
                    "RuleParagraph": "1.",
                    "RuleText": "Respeite todos os jogadores"
                },
                {
                    "RuleParagraph": "2.",
                    "RuleText": "Não use cheats ou exploits"
                }
            ]
        }
    ],
    "Links": [
        {
            "Name": "Discord",
            "URL": "https://discord.gg/thelionz",
            "IconName": "Discord",
            "IconColor": -14473430
        }
    ],
    "Descriptions": [
        {
            "CategoryName": "Sobre The LionZ",
            "Descriptions": [
                {
                    "DescriptionText": "Servidor PvP modded focado em experiência imersiva e desafiadora."
                }
            ]
        }
    ]
}
```

#### 3. NotificationSettings.json
Configura o sistema de notificações do servidor, incluindo mensagens de entrada/saída de jogadores, airdrops, territórios e kill-feed.

**Configurações Gerais:**
- `EnableNotification`: Habilita/desabilita todas as notificações (0 ou 1)

**Notificações de Jogadores:**
- `ShowPlayerJoinServer`: Exibe quando jogador entra no servidor (0 ou 1)
- `JoinMessageType`: Tipo de exibição (0 = chat, 1 = notificação no canto superior esquerdo)
- `ShowPlayerLeftServer`: Exibe quando jogador sai do servidor (0 ou 1)
- `LeftMessageType`: Tipo de exibição (0 = chat, 1 = notificação no canto superior esquerdo)

**Notificações de Airdrop:**
- `ShowAirdropStarted`: Exibe quando evento de airdrop inicia (0 ou 1)
- `ShowAirdropClosingOn`: Exibe quando avião se aproxima do local de drop (0 ou 1)
- `ShowAirdropDropped`: Exibe quando airdrop é lançado (0 ou 1)
- `ShowAirdropEnded`: Exibe quando airdrop termina/é destruído por infectados (0 ou 1)

**Notificações de Airdrop de Jogador:**
- `ShowPlayerAirdropStarted`: Exibe quando jogador chama airdrop com flare (0 ou 1)
- `ShowPlayerAirdropClosingOn`: Exibe quando airdrop de jogador se aproxima (0 ou 1)
- `ShowPlayerAirdropDropped`: Exibe quando airdrop de jogador é lançado (0 ou 1)

**Notificações de Território:**
- `ShowTerritoryNotifications`: Exibe quando jogador entra em território (0 ou 1)

**Kill-Feed (Feed de Mortes):**
- `EnableKillFeed`: Habilita/desabilita todo o sistema de kill-feed (0 ou 1)
- `KillFeedMessageType`: Tipo de exibição (0 = chat, 1 = notificação no canto superior esquerdo)

**Tipos de Morte no Kill-Feed:**

Mortes por Ambiente:
- `KillFeedFall`: Morte por queda (0 ou 1)
- `KillFeedBarbedWire`: Morte por arame farpado (0 ou 1)
- `KillFeedFire`: Morte por fogo/fogueira (0 ou 1)
- `KillFeedDehydration`: Morte por desidratação (0 ou 1)
- `KillFeedStarvation`: Morte por fome (0 ou 1)
- `KillFeedBleeding`: Morte por sangramento (0 ou 1)
- `KillFeedDrowned`: Morte por afogamento (0 ou 1)

Mortes por Veículos:
- `KillFeedCarHitDriver`: Morte por atropelamento com motorista (0 ou 1)
- `KillFeedCarHitNoDriver`: Morte por atropelamento sem motorista (0 ou 1)
- `KillFeedCarCrash`: Morte por acidente de carro como motorista (0 ou 1)
- `KillFeedCarCrashCrew`: Morte por acidente de carro como passageiro (0 ou 1)
- `KillFeedHeliHitDriver`: Morte por colisão com helicóptero com piloto (0 ou 1)
- `KillFeedHeliHitNoDriver`: Morte por colisão com helicóptero sem piloto (0 ou 1)
- `KillFeedHeliCrash`: Morte por queda de helicóptero como piloto (0 ou 1)
- `KillFeedHeliCrashCrew`: Morte por queda de helicóptero como passageiro (0 ou 1)

Mortes por Combate:
- `KillFeedWeapon`: Morte por arma de fogo (0 ou 1)
- `KillFeedMeleeWeapon`: Morte por arma branca (0 ou 1)
- `KillFeedBarehands`: Morte por luta corporal (0 ou 1)
- `KillFeedWeaponExplosion`: Morte por explosão (granadas, C4, etc.) (0 ou 1)
- `KillFeedSuicide`: Morte por suicídio (0 ou 1)

Mortes por NPCs:
- `KillFeedInfected`: Morte por infectado/zumbi (0 ou 1)
- `KillFeedAnimal`: Morte por animal selvagem (0 ou 1)
- `KillFeedAI`: Morte por IA (0 ou 1)

Mortes Desconhecidas:
- `KillFeedKilledUnknown`: Morte por fonte desconhecida com entidade (0 ou 1)
- `KillFeedDiedUnknown`: Morte por fonte desconhecida (0 ou 1)

**Integração Discord:**
- `EnableKillFeedDiscordMsg`: Envia kill-feed para Discord via webhook (0 ou 1)
  - ⚠️ **AVISO**: Sistema não funciona corretamente e está desabilitado por padrão

**Exemplo de Configuração PvP:**
```json
{
    "EnableNotification": 1,
    "ShowPlayerJoinServer": 1,
    "JoinMessageType": 1,
    "ShowPlayerLeftServer": 1,
    "LeftMessageType": 1,
    "EnableKillFeed": 1,
    "KillFeedMessageType": 1,
    "KillFeedWeapon": 1,
    "KillFeedMeleeWeapon": 1,
    "KillFeedBarehands": 1,
    "KillFeedInfected": 1,
    "KillFeedAnimal": 1
}
```

#### 4. Quest System (Sistema de Missões)

**Localização dos Arquivos:**
```
profiles/ExpansionMod/Quests/
├── Quests/           # Arquivos de configuração de missões
├── Objectives/       # Arquivos de objetivos
└── NPCs/            # Arquivos de NPCs quest givers
```

##### 4.1. Quest Configuration (Configuração de Missões)

Arquivos de quest podem ter qualquer nome desde que tenham extensão `.json` e estejam na pasta `Quests/`.

**Parâmetros Principais:**

- `ConfigVersion`: Integer. Versão do arquivo de configuração (não altere!)
- `ID`: Integer. ID único da quest (deve ser diferente para cada quest)
- `Type`: Integer. Tipo da quest (sempre use `1` = NORMAL)
- `Title`: String. Título da quest
- `Descriptions`: Array com 3 entradas:
  - `[0]`: Descrição ao pegar a quest
  - `[1]`: Descrição enquanto quest está ativa (visível no NPC)
  - `[2]`: Descrição ao entregar a quest (visível no NPC de entrega)
- `ObjectiveText`: String. Texto curto do objetivo
- `FollowUpQuest`: Integer. ID da quest seguinte (quest encadeada)
- `Repeatable`: Boolean. Quest pode ser repetida
- `IsDailyQuest`: Boolean. Quest diária com reset diário
- `IsWeeklyQuest`: Boolean. Quest semanal com reset semanal
- `CancelQuestOnPlayerDeath`: Boolean. Quest cancela se jogador morrer
- `Autocomplete`: Boolean. Quest completa automaticamente ao finalizar objetivos
- `IsGroupQuest`: Boolean. Quest de grupo
- `ObjectSetFileName`: String. Nome do arquivo `.map` (sem extensão) para spawnar objetos
  - Arquivo deve estar em: `MISSION.MAPNAME/expansion/quests/objects`

**Quest Items:**
```json
"QuestItems": [
    {
        "ClassName": "SledgeHammer",
        "Amount": 1
    }
]
```
Itens dados ao jogador ao iniciar a quest. São deletados ao completar/cancelar ou ao deslogar.

**Rewards (Recompensas):**
```json
"Rewards": [
    {
        "ClassName": "TaloonBag_Blue",
        "Amount": 1,
        "Attachments": [],
        "DamagePercent": 0,
        "QuestID": -1,
        "Chance": 1.0
    }
]
```
- `ClassName`: Nome da classe do item
- `Amount`: Quantidade
- `Attachments`: Array de attachments para o item
- `DamagePercent`: Porcentagem de dano do item
- `QuestID`: Se > -1, item se torna quest giver para essa quest ID
- `Chance`: Chance de receber (usado com `RandomReward`)

**Sistema de Recompensas:**
- `NeedToSelectReward`: Boolean. Jogador escolhe uma recompensa da lista
- `RandomReward`: Boolean. Recompensas aleatórias baseadas em `Chance`
- `RandomRewardAmount`: Integer. Quantidade de recompensas aleatórias
- `RewardsForGroupOwnerOnly`: Boolean. Só líder do grupo recebe recompensas

**NPCs:**
- `QuestGiverIDs`: Array. IDs dos NPCs que dão a quest
- `QuestTurnInIDs`: Array. IDs dos NPCs que recebem a quest completa

**Objectives (Objetivos):**
```json
"Objectives": [
    {
        "ConfigVersion": 28,
        "ID": 3,
        "ObjectiveType": 3
    }
]
```

**Tipos de Objetivos:**
- `2` = TARGET: Matar quantidade de mobs/jogadores (opcional: com arma específica)
- `3` = TRAVEL: Ir até localização XY
- `4` = COLLECT: Coletar quantidade de itens
- `5` = DELIVERY: Entregar itens em posição/NPC específico
- `6` = TREASUREHUNT: Encontrar localização com tesouro escondido
- `7` = AIPATROL: Eliminar patrulha de IA (opcional: com arma específica)
- `8` = AICAMP: Eliminar acampamento de IA (opcional: com arma específica)
- `9` = AIVIP: Proteger e escoltar IA até localização
- `10` = ACTION: Executar ação específica
- `11` = CRAFTING: Craftar itens específicos

**Outros Parâmetros:**
- `QuestColor`: Integer. Cor principal da quest (formato ARGB)
- `ReputationReward`: Integer. Recompensa de reputação (requer Hardline mod)
- `ReputationRequirement`: Integer. Reputação necessária para aceitar
- `PreQuestIDs`: Array. IDs de quests que devem ser completadas antes
- `RequiredFaction`: String. Facção necessária (requer Expansion-AI)
- `FactionReward`: String. Facção recebida como recompensa
- `PlayerNeedQuestItems`: Boolean. Quest cancela se perder quest items
- `DeleteQuestItems`: Boolean. Deleta quest items ao completar
- `SequentialObjectives`: Boolean. Objetivos devem ser feitos em ordem
- `FactionReputationRequirements`: Map. Reputação de facção necessária
- `FactionReputationRewards`: Map. Recompensa de reputação por facção
- `SuppressQuestLogOnCompletion`: Boolean. Suprime log ao completar
- `Active`: Boolean. Ativa/desativa esta quest

**Exemplo de Quest Completa:**
```json
{
    "ConfigVersion": 22,
    "ID": 2,
    "Type": 1,
    "Title": "Um favor para Steve...",
    "Descriptions": [
        "Peter te enviou? Bem, eu tenho o que ele quer. Mas preciso de um favor também...",
        "Ainda não terminou? Volte quando o trabalho estiver feito!",
        "Ah, você voltou! Aqui está sua recompensa."
    ],
    "ObjectiveText": "Mate 10 infectados civis com o martelo de Steve.",
    "FollowUpQuest": 3,
    "Repeatable": 0,
    "IsDailyQuest": 0,
    "IsWeeklyQuest": 0,
    "CancelQuestOnPlayerDeath": 0,
    "Autocomplete": 0,
    "IsGroupQuest": 0,
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
            "Chance": 1.0
        }
    ],
    "QuestGiverIDs": [2],
    "QuestTurnInIDs": [2],
    "Objectives": [
        {
            "ConfigVersion": 28,
            "ID": 2,
            "ObjectiveType": 3
        },
        {
            "ConfigVersion": 28,
            "ID": 1,
            "ObjectiveType": 2
        }
    ],
    "PreQuestIDs": [1],
    "SequentialObjectives": 1,
    "Active": 1
}
```

**Configurações Especiais de Quest:**

**Auto-Start Quest** (Quest que inicia automaticamente):
```json
"QuestGiverIDs": [],
"IsAchievement": 0,
"IsGroupQuest": 0,
"PreQuestIDs": []
```

**Achievement Quest** (Conquista):
```json
"QuestGiverIDs": [],
"IsAchievement": 1,
"Autocomplete": 1,
"IsGroupQuest": 0,
"PreQuestIDs": []
```

**Daily Quest** (Quest Diária):
```json
"Repeatable": 1,
"IsDailyQuest": 1,
"IsWeeklyQuest": 0
```

**Weekly Quest** (Quest Semanal):
```json
"Repeatable": 1,
"IsDailyQuest": 0,
"IsWeeklyQuest": 1
```

##### 4.2. Quest Objectives Configuration

Arquivos de objetivos podem ter qualquer nome com extensão `.json` na pasta `Objectives/` correspondente.

**Parâmetros Principais:**
- `ConfigVersion`: Integer. Versão do config (não altere!)
- `ID`: Integer. ID único do objetivo (único por categoria)
- `ObjectiveType`: Integer. Tipo do objetivo (deve corresponder à categoria)
- `ObjectiveText`: String. Texto exibido no quest log e HUD
- `TimeLimit`: Integer. Tempo limite em segundos para completar
- `Active`: Boolean. Ativa/desativa este objetivo

**Links para Configurações Específicas:**
- Action Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Action-Objective-Configuration
- AI Camp Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/AI-Camp-Objective-Configuration
- AI Patrol Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/AI-Patrol-Objective-Configuration
- AI VIP Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/AI-VIP-Objective-Configuration
- Collection Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Collection-Objective-Configuration
- Crafting Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Crafting-Objective-Configuration
- Delivery Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Delivery-Objective-Configuration
- Target Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Target-Objective-Configuration
- Travel Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Travel-Objective-Configuration
- Treasure Hunt Objective: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Treasure-Hunt-Objective-Configuration

##### 4.3. Quest NPC Configuration

Arquivos de NPC podem ter qualquer nome com extensão `.json` na pasta `NPCs/`.

**Parâmetros Principais:**
- `ConfigVersion`: Integer. Versão do config (não altere!)
- `ID`: Integer. ID único do NPC
- `ClassName`: String. Classe do NPC
- `Position`: Vector [X, Y, Z]. Posição de spawn no mundo
- `Orientation`: Vector [Yaw, Pitch, Roll]. Orientação do NPC
- `NPCName`: String. Nome exibido na ação
- `DefaultNPCText`: String. Texto padrão quando não há quests disponíveis
- `NPCType`: Integer. Tipo do NPC:
  - `0` = NORMAL (NPC normal)
  - `1` = OBJECT (Objeto estático)
  - `2` = AI (NPC com IA)
- `Active`: Boolean. Ativa/desativa este NPC

**NPCs Padrão Disponíveis:**

NPCs Normais:
- ExpansionQuestNPCMirek, ExpansionQuestNPCDenis, ExpansionQuestNPCBoris
- ExpansionQuestNPCCyril, ExpansionQuestNPCElias, ExpansionQuestNPCFrancis
- ExpansionQuestNPCGuo, ExpansionQuestNPCHassan, ExpansionQuestNPCIndar
- ExpansionQuestNPCJose, ExpansionQuestNPCKaito, ExpansionQuestNPCLewis
- ExpansionQuestNPCManua, ExpansionQuestNPCNiki, ExpansionQuestNPCOliver
- ExpansionQuestNPCPeter, ExpansionQuestNPCQuinn, ExpansionQuestNPCRolf
- ExpansionQuestNPCSeth, ExpansionQuestNPCTaiki, ExpansionQuestNPCLinda
- ExpansionQuestNPCMaria, ExpansionQuestNPCFrida, ExpansionQuestNPCGabi
- ExpansionQuestNPCHelga, ExpansionQuestNPCIrena, ExpansionQuestNPCJudy
- ExpansionQuestNPCKeiko, ExpansionQuestNPCEva, ExpansionQuestNPCNaomi
- ExpansionQuestNPCBaty

NPCs AI (requer Expansion-AI):
- ExpansionQuestNPCAIMirek, ExpansionQuestNPCAIDenis, etc. (adicione "AI" após "NPC")

Objetos Estáticos:
- ExpansionQuestObjectBoard, ExpansionQuestBoardSmall
- ExpansionQuestBoardLarge, ExpansionQuestObjectLocker

**Parâmetros para NPCs AI (NPCType = 2):**
- `Waypoints`: Array de vetores. Caminho que o NPC seguirá (primeira entrada deve ser Position)
- `NPCEmoteID`: Integer. ID do emote que NPC faz aleatoriamente
- `NPCEmoteIsStatic`: Boolean. Força NPC a ficar neste emote sempre
- `NPCLoadoutFile`: String. Nome do arquivo de loadout (sem extensão)
- `NPCInteractionEmoteID`: Integer. Emote ao interagir
- `NPCQuestCancelEmoteID`: Integer. Emote ao cancelar quest
- `NPCQuestStartEmoteID`: Integer. Emote ao aceitar quest
- `NPCQuestCompleteEmoteID`: Integer. Emote ao completar quest
- `NPCFaction`: String. Nome da facção do NPC

**IDs de Emotes:**
```
1=GREETING, 2=SOS, 3=HEART, 4=TAUNT, 5=LYINGDOWN, 6=TAUNTKISS
7=FACEPALM, 8=TAUNTELBOW, 9=THUMB, 10=THROAT, 11=SUICIDE, 12=DANCE
13=CAMPFIRE, 14=SITA, 15=SITB, 16=THUMBDOWN, 32=DABBING, 35=TIMEOUT
39=CLAP, 40=POINT, 43=SILENT, 44=SALUTE, 45=RPS, 46=WATCHING
47=HOLD, 48=LISTENING, 49=POINTSELF, 50=LOOKATME, 51=TAUNTTHINK
52=MOVE, 53=DOWN, 54=COME, 55=RPS_R, 56=RPS_P, 57=RPS_S
58=NOD, 59=SHAKE, 60=SHRUG, 61=SURRENDER, 62=VOMIT
```

**Exemplo de NPC AI:**
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

##### 4.4. Quest Settings (QuestSettings.json)

**Localização:** `profiles/ExpansionMod/Settings/QuestSettings.json`

**Parâmetros Principais:**
- `m_Version`: Integer. Versão do arquivo (não altere!)
- `EnableQuests`: Boolean. Ativa/desativa sistema de quests
- `EnableQuestLogTab`: Boolean. Ativa aba de quests no livro (requer Expansion-Book)
- `CreateQuestNPCMarkers`: Boolean. Cria marcadores no mapa para NPCs (não funciona ainda)
- `MaxActiveQuests`: Integer. Máximo de quests ativas simultaneamente

**Textos de Notificação:**
- `QuestAcceptedTitle/Text`: Título/texto ao aceitar quest
- `QuestCompletedTitle/Text`: Título/texto ao completar quest
- `QuestFailedTitle/Text`: Título/texto ao falhar quest
- `QuestCanceledTitle/Text`: Título/texto ao cancelar quest
- `QuestTurnInTitle/Text`: Título/texto ao entregar quest
- `QuestObjectiveCompletedTitle/Text`: Título/texto ao completar objetivo
- `AchievementCompletedTitle/Text`: Título/texto ao completar conquista
- `QuestCooldownTitle/Text`: Título/texto quando quest está em cooldown
- `QuestNotInGroupTitle/Text`: Título/texto para quest de grupo sem estar em grupo
- `QuestNotGroupOwnerTitle/Text`: Título/texto quando não é líder do grupo

**Reset de Quests:**
- `WeeklyResetDay`: String. Dia da semana para reset (em inglês: "Monday", "Tuesday", etc.)
- `WeeklyResetHour`: Integer. Hora do reset semanal (0-23)
- `WeeklyResetMinute`: Integer. Minuto do reset semanal (0-59)
- `DailyResetHour`: Integer. Hora do reset diário (0-23)
- `DailyResetMinute`: Integer. Minuto do reset diário (0-59)
- `UseUTCTime`: Boolean. Usa horário UTC para resets

**Modo de Quest de Grupo:**
- `GroupQuestMode`: Integer
  - `0`: Só líder aceita e entrega quests de grupo
  - `1`: Só líder entrega, mas todos podem aceitar
  - `2`: Todos podem aceitar e entregar

**Exemplo:**
```json
{
    "m_Version": 10,
    "EnableQuests": 1,
    "EnableQuestLogTab": 1,
    "QuestAcceptedTitle": "Quest Aceita",
    "QuestAcceptedText": "A quest %1 foi aceita!",
    "QuestCompletedTitle": "Quest Completa",
    "QuestCompletedText": "Todos objetivos de %1 foram completados",
    "WeeklyResetDay": "Wednesday",
    "WeeklyResetHour": 8,
    "WeeklyResetMinute": 0,
    "DailyResetHour": 8,
    "DailyResetMinute": 0,
    "UseUTCTime": 0,
    "GroupQuestMode": 0,
    "MaxActiveQuests": 5
}
```

#### 5. BaseBuildingSettings.json

**Localização:** `mpmissions/dayzOffline.<mapname>/expansion/settings/BaseBuildingSettings.json`

⚠️ **Nota:** Diferente de outras configurações, este arquivo é específico por mapa.

**Parâmetros Principais:**

- `m_Version`: Integer. Versão do arquivo (não altere!)

**Configurações de Construção:**

- `CanBuildAnywhere`: Boolean
  - `0`: Construir segue limitações vanilla
  - `1`: Pode construir em qualquer lugar sem restrições

- `AllowBuildingWithoutATerritory`: Boolean
  - `0`: Obrigado a construir dentro de território
  - `1`: Pode construir fora de território

- `DeployableOutsideATerritory`: Array de strings. Lista de classnames que podem ser colocados fora de território (usado se AllowBuildingWithoutATerritory = 0)
```json
"DeployableOutsideATerritory": [
    "Fireplace",
    "BearTrap",
    "TerritoryFlagKit"
]
```

- `DeployableInsideAEnemyTerritory`: Array de strings. Itens que podem ser colocados em território inimigo (para raid)
```json
"DeployableInsideAEnemyTerritory": [
    "ExpansionSatchel",
    "LandMineTrap",
    "BearTrap"
]
```

**Crafting:**

- `CanCraftVanillaBasebuilding`: Boolean
  - `0`: Não pode craftar cerca/torre vanilla
  - `1`: Pode craftar cerca/torre vanilla

- `CanCraftExpansionBasebuilding`: Boolean
  - `0`: Não pode craftar kits Expansion (parede, piso, rampa, escada)
  - `1`: Pode craftar kits Expansion

**Desmontagem:**

- `DestroyFlagOnDismantle`: Boolean
  - `0`: Recebe kit de volta ao desmontar bandeira
  - `1`: Não recebe kit de volta

- `DismantleOutsideTerritory`: Boolean
  - `0`: Não pode desmontar fora do próprio território
  - `1`: Pode desmontar tudo exceto em território alheio

- `DismantleInsideTerritory`: Boolean
  - `0`: Não pode desmontar em territórios que não possui
  - `1`: Pode desmontar em qualquer território

- `DismantleAnywhere`: Boolean
  - `0`: Precisa estar no lado macio para desmontar
  - `1`: Ação de desmontar disponível de qualquer lado

- `DismantleFlagMode`: Integer
  - `-1`: Só membros do território podem desmontar com mãos nuas
  - `0`: Qualquer um pode desmontar com mãos nuas
  - `1`: Qualquer um pode desmontar mas só com ferramentas específicas

**Codelocks:**

- `CodelockActionsAnywhere`: Boolean
  - `0`: Precisa olhar para o codelock para interagir (vanilla)
  - `1`: Pode olhar para parede/porta/portão ou codelock para interagir

- `CodeLockLength`: Integer. Tamanho da senha (ex: 4 = senha de 4 dígitos)

- `DoDamageWhenEnterWrongCodeLock`: Boolean
  - `0`: Não recebe dano ao errar senha
  - `1`: Recebe dano ao errar senha

- `DamageWhenEnterWrongCodeLock`: Float. Quantidade de dano ao errar senha (0-100)

- `CodelockAttachMode`: Integer
  - `0`: Expansion BaseBuilding apenas
  - `1`: Expansion BaseBuilding + Cerca
  - `2`: Expansion BaseBuilding + Cerca + Tendas
  - `3`: Expansion BaseBuilding + Tendas

**Território:**

- `CanCraftTerritoryFlagKit`: Boolean
  - `0`: Não pode craftar bandeira de território
  - `1`: Pode craftar bandeira (3 gravetos + 1 corda)

- `SimpleTerritory`: Boolean
  - `0`: Precisa construir bandeira como vanilla
  - `1`: Bandeira é construída automaticamente ao ser colocada

- `AutomaticFlagOnCreation`: Boolean
  - `0`: Jogador precisa adicionar bandeira manualmente
  - `1`: Bandeira é adicionada automaticamente ao mastro

- `GetTerritoryFlagKitAfterBuild`: Boolean
  - `0`: Não recebe kit de volta após construir
  - `1`: Recebe kit de volta após primeiro estágio

- `FlagMenuMode`: Integer
  - `0`: Não pode criar território
  - `1`: Pode criar território e customizar bandeira
  - `2`: Pode criar território mas não customizar bandeira

**Zonas de Construção:**

- `BuildZoneRequiredCustomMessage`: String. Mensagem exibida ao tentar construir em zona proibida

- `Zones`: Array de zonas de construção/não-construção
```json
"Zones": [
    {
        "Name": "Green Mountain Trader Camp",
        "Center": [3728.27, 403.0, 6003.60],
        "Radius": 600.0,
        "Items": [
            "Fireplace",
            "LandMineTrap",
            "BearTrap"
        ],
        "IsWhitelist": 1,
        "CustomMessage": ""
    }
]
```
  - `Name`: Nome da zona
  - `Center`: Coordenadas [X, Y, Z] do centro
  - `Radius`: Raio em metros
  - `Items`: Lista de itens permitidos (se IsWhitelist = 1) ou proibidos (se IsWhitelist = 0)
  - `IsWhitelist`: Boolean. Se 1, apenas Items listados são permitidos; se 0, Items listados são proibidos
  - `CustomMessage`: Mensagem customizada para esta zona

- `ZonesAreNoBuildZones`: Boolean
  - `0`: Zonas são áreas de construção (só pode construir dentro delas)
  - `1`: Zonas são áreas proibidas (não pode construir dentro delas)

**Armazenamento Virtual:**

- `EnableVirtualStorage`: Boolean. Itens são salvos em armazenamento virtual e removidos do mundo quando container fecha (melhora performance)

- `VirtualStorageExcludedContainers`: Array de strings. Containers excluídos do armazenamento virtual
```json
"VirtualStorageExcludedContainers": [
    "ExpansionAirdropContainerBase"
]
```

**Exemplo de Configuração para The LionZ:**
```json
{
    "m_Version": 5,
    "CanBuildAnywhere": 1,
    "AllowBuildingWithoutATerritory": 1,
    "CanCraftVanillaBasebuilding": 0,
    "CanCraftExpansionBasebuilding": 1,
    "DestroyFlagOnDismantle": 1,
    "DismantleOutsideTerritory": 0,
    "DismantleInsideTerritory": 0,
    "CodeLockLength": 4,
    "DoDamageWhenEnterWrongCodeLock": 1,
    "DamageWhenEnterWrongCodeLock": 10.0,
    "SimpleTerritory": 1,
    "AutomaticFlagOnCreation": 1,
    "Zones": [
        {
            "Name": "Green Mountain Trader Camp",
            "Center": [3728.27, 403.0, 6003.60],
            "Radius": 600.0,
            "Items": ["Fireplace", "LandMineTrap", "BearTrap"],
            "IsWhitelist": 1,
            "CustomMessage": ""
        }
    ],
    "ZonesAreNoBuildZones": 1,
    "EnableVirtualStorage": 0
}
```

**Dicas para Zonas de Não-Construção:**
- Use para proteger áreas de trader
- Defina raio apropriado (500-1000m para traders)
- Permita apenas itens essenciais (fogueira, armadilhas)
- Bloqueie explosivos em zonas seguras

#### 6. RaidSettings.json

**Localização:** `mpmissions/dayzOffline.<mapname>/expansion/settings/RaidSettings.json`

**Parâmetros Principais:**

- `m_Version`: Integer. Versão do arquivo (não altere!)

**Configurações de Explosivos:**

- `ExplosionTime`: Integer. Tempo em segundos para ExpansionSatchel (C4) explodir

- `ExplosiveDamageWhitelist`: Array de strings. Classnames de explosões permitidas para raid
  - ⚠️ **Importante**: Use classname da EXPLOSÃO, não do item
  - Exemplo: "Expansion_RPG_Explosion" (não "RPG_Ammo")
```json
"ExplosiveDamageWhitelist": [
    "Explosion_M67",
    "Expansion_C4_Explosion",
    "Expansion_RPG_Explosion"
]
```

- `EnableExplosiveWhitelist`: Boolean
  - `0`: Todos explosivos podem raidar (ignora whitelist)
  - `1`: Apenas explosivos da whitelist podem raidar

**Multiplicadores de Dano:**

- `ExplosionDamageMultiplier`: Float. Multiplicador de dano explosivo em paredes Expansion
  - Fórmula: `Dano Final = Dano Base × Multiplicador`
  - Exemplo: Granada (50 dano) × 50 = 2500 dano
  - Referência de dano base:
    - Granada vanilla: 50
    - Foguete Expansion: 300
    - C4 Expansion: 600
  - 🛡️ HP de Paredes: 30,000
  - Valores < 1 funcionam (0.5 = metade do dano, 0 = sem dano)

- `ProjectileDamageMultiplier`: Float. Multiplicador de dano de balas em paredes Expansion
  - Fórmula: `Dano Final = Dano Base × Multiplicador`
  - Exemplo: Bala (65 dano) × 2 = 130 dano
  - 🛡️ HP de Paredes: 30,000
  - Valores < 1 funcionam (0 = desabilita dano de balas)

**Raid de Cofres:**

- `CanRaidSafes`: Boolean
  - `0`: Cofres Expansion não podem ser destruídos
  - `1`: Permite raidar cofres Expansion

- `SafeExplosionDamageMultiplier`: Float. Multiplicador de dano explosivo em cofres
  - Fórmula: `Dano Final = Dano Base × Multiplicador`
  - 🛡️ HP de Cofres:
    - Large: 20,000
    - Medium: 15,000
    - Small: 10,000

- `SafeProjectileDamageMultiplier`: Float. Multiplicador de dano de balas em cofres

- `SafeRaidTools`: Array de strings. Ferramentas permitidas para raidar cofres
```json
"SafeRaidTools": [
    "Hacksaw",
    "HandSaw"
]
```

- `SafeRaidToolTimeSeconds`: Integer. Tempo necessário para raidar cofre com ferramenta

- `SafeRaidToolCycles`: Integer. Número de ciclos necessários para raidar cofre

- `SafeRaidToolDamagePercent`: Integer. Dano total causado à ferramenta (100 = arruinada após todos ciclos)

**Raid de Arame Farpado:**

- `BarbedWireRaidTools`: Array de strings. Ferramentas para cortar arame farpado
```json
"BarbedWireRaidTools": [
    "Pliers",
    "CombinationPliers"
]
```

- `BarbedWireRaidToolTimeSeconds`: Integer. Tempo para cortar arame

- `BarbedWireRaidToolCycles`: Integer. Número de ciclos necessários

- `BarbedWireRaidToolDamagePercent`: Integer. Dano à ferramenta (0-100)

**Raid de Codelocks:**

- `CanRaidLocksOnWalls`: Integer
  - `0`: Não pode raidar codelocks em paredes
  - `1`: Pode raidar codelocks em paredes, portas E portões
  - `2`: Pode raidar codelocks apenas em portas
  - `3`: Pode raidar codelocks apenas em portões

- `CanRaidLocksOnFences`: Boolean
  - `0`: Não pode raidar codelocks em cercas
  - `1`: Pode raidar codelocks em cercas

- `CanRaidLocksOnTents`: Boolean
  - `0`: Não pode raidar codelocks em tendas
  - `1`: Pode raidar codelocks em tendas

- `LockRaidTools`: Array de strings. Ferramentas para raidar codelocks
```json
"LockRaidTools": [
    "Hacksaw",
    "HandSaw",
    "Pliers"
]
```

- `LockOnWallRaidToolTimeSeconds`: Integer. Tempo para raidar lock em parede

- `LockOnFenceRaidToolTimeSeconds`: Integer. Tempo para raidar lock em cerca

- `LockOnTentRaidToolTimeSeconds`: Integer. Tempo para raidar lock em tenda

- `LockRaidToolCycles`: Integer. Número de ciclos necessários

- `LockRaidToolDamagePercent`: Integer. Dano à ferramenta (0-100)

**Modo de Raid de BaseBuilding:**

- `BaseBuildingRaidMode`: Integer
  - `-1`: Elementos Expansion BaseBuilding NÃO podem ser raidados
  - `0`: TODOS elementos podem ser raidados
  - `1`: Apenas portas/portões podem ser raidados
  - `2`: Apenas portas/portões/janelas podem ser raidados

**Exemplo de Configuração Balanceada:**
```json
{
    "m_Version": 10,
    "ExplosionTime": 30,
    "ExplosiveDamageWhitelist": [
        "Explosion_M67",
        "Expansion_C4_Explosion",
        "Expansion_RPG_Explosion"
    ],
    "EnableExplosiveWhitelist": 1,
    "ExplosionDamageMultiplier": 50.0,
    "ProjectileDamageMultiplier": 2.0,
    "CanRaidSafes": 1,
    "SafeExplosionDamageMultiplier": 50.0,
    "SafeProjectileDamageMultiplier": 2.0,
    "SafeRaidTools": ["Hacksaw"],
    "SafeRaidToolTimeSeconds": 300,
    "SafeRaidToolCycles": 5,
    "SafeRaidToolDamagePercent": 100,
    "BarbedWireRaidTools": ["Pliers", "CombinationPliers"],
    "BarbedWireRaidToolTimeSeconds": 30,
    "BarbedWireRaidToolCycles": 1,
    "BarbedWireRaidToolDamagePercent": 10,
    "CanRaidLocksOnWalls": 1,
    "CanRaidLocksOnFences": 1,
    "CanRaidLocksOnTents": 1,
    "LockRaidTools": ["Hacksaw", "Pliers"],
    "LockOnWallRaidToolTimeSeconds": 180,
    "LockOnFenceRaidToolTimeSeconds": 120,
    "LockOnTentRaidToolTimeSeconds": 60,
    "LockRaidToolCycles": 3,
    "LockRaidToolDamagePercent": 50,
    "BaseBuildingRaidMode": 0
}
```

**Cálculos de Raid:**

**Exemplo 1: Raidar Parede com C4**
- HP da Parede: 30,000
- Dano do C4: 600
- Multiplicador: 50
- Dano por C4: 600 × 50 = 30,000
- **Resultado: 1 C4 destrói 1 parede**

**Exemplo 2: Raidar Parede com Granadas**
- HP da Parede: 30,000
- Dano da Granada: 50
- Multiplicador: 50
- Dano por Granada: 50 × 50 = 2,500
- **Resultado: 12 granadas para destruir 1 parede**

**Exemplo 3: Raidar Cofre Grande com C4**
- HP do Cofre: 20,000
- Dano do C4: 600
- Multiplicador: 50
- Dano por C4: 600 × 50 = 30,000
- **Resultado: 1 C4 destrói cofre grande**

**Dicas de Balanceamento:**
- Multiplicador alto (50+): Raid rápido, favorece atacantes
- Multiplicador médio (20-50): Raid balanceado
- Multiplicador baixo (1-20): Raid difícil, favorece defensores
- Multiplicador 0: Desabilita raid por aquele método

**Dicas para Servidor PvP:**
- Habilite whitelist de explosivos para controlar métodos de raid
- Configure tempo de C4 apropriado (30-60s)
- Permita raid de codelocks com ferramentas (adiciona gameplay)
- Ajuste ciclos e tempo baseado na dificuldade desejada
- Considere dano à ferramenta para balancear economia

#### 7. SpawnSettings.json

**Localização:** `mpmissions/dayzOffline.<mapname>/expansion/settings/SpawnSettings.json`

⚠️ **Nota:** Este arquivo é específico por mapa, diferente da maioria das outras configurações.

**Parâmetros Principais:**

- `m_Version`: Integer. Versão do arquivo (não altere!)

##### Starting Clothing (Roupas Iniciais)

**StartingClothing** (Object):

- `EnableCustomClothing`: Boolean
  - `0`: Jogador spawna com roupas vanilla padrão
  - `1`: Jogador spawna com roupas configuradas neste arquivo

- `SetRandomHealth`: Boolean
  - `0`: Todas as roupas spawnam em condição pristine
  - `1`: Roupas spawnam em condição aleatória

**Arrays de Roupas:**

Cada array pode conter múltiplos classnames. Se houver apenas um item, jogador sempre spawna com ele. Se houver múltiplos, um é selecionado aleatoriamente.

- `Headgear`: Array. Chapéus, capacetes, gorros
- `Glasses`: Array. Óculos e óculos de sol
- `Masks`: Array. Máscaras faciais
- `Tops`: Array. Camisas, jaquetas, casacos
- `Vests`: Array. Coletes
- `Gloves`: Array. Luvas
- `Pants`: Array. Calças e shorts
- `Belts`: Array. Cintos
- `Shoes`: Array. Sapatos e botas
- `Armbands`: Array. Braçadeiras
- `Backpacks`: Array. Mochilas

**Exemplo:**
```json
"StartingClothing": {
    "EnableCustomClothing": 1,
    "SetRandomHealth": 1,
    "Headgear": ["BaseballCap_Blue", "BaseballCap_Red"],
    "Tops": ["TShirt_Blue", "TShirt_Red", "TShirt_Green"],
    "Pants": ["Jeans_Blue", "Jeans_Black"],
    "Shoes": ["AthleticShoes_Blue", "AthleticShoes_Black"],
    "Backpacks": ["TaloonBag_Blue", "TaloonBag_Orange"]
}
```

##### Spawn Selection (Seleção de Spawn)

- `EnableSpawnSelection`: Boolean
  - `0`: Jogadores spawnam aleatoriamente no mapa (vanilla)
  - `1`: Jogadores podem escolher onde spawnar

- `SpawnOnTerritory`: Boolean
  - `0`: Jogadores não podem respawnar em seus territórios
  - `1`: Pode respawnar no próprio território

**SpawnLocations** (Array):

Lista de localizações de spawn exibidas no menu de seleção.

```json
"SpawnLocations": [
    {
        "Name": "Elektrozavodsk",
        "Positions": [
            [10400.0, 2.0, 2200.0],
            [10500.0, 2.0, 2300.0],
            [10600.0, 2.0, 2400.0]
        ],
        "UseCooldown": 1
    }
]
```

- `Name`: String. Nome da localização exibido no menu
- `Positions`: Array de coordenadas [X, Y, Z]
  - Se apenas uma posição, jogador sempre spawna ali
  - Se múltiplas, uma é escolhida aleatoriamente
  - ⚠️ **Primeira posição é usada para criar marcador no mapa**
- `UseCooldown`: Boolean. Aplica cooldown nesta localização (requer `EnableRespawnCooldowns: 1`)

##### Starting Gear (Equipamento Inicial)

**StartingGear** (Object):

- `EnableStartingGear`: Boolean
  - `0`: Jogador spawna com gear vanilla padrão
  - `1`: Jogador spawna com gear configurado

**Configurações de Inventário:**

- `UseUpperGear`: Boolean. Usa itens de `UpperGear` (inventário da camisa)
- `UsePantsGear`: Boolean. Usa itens de `PantsGear` (inventário da calça)
- `UseBackpackGear`: Boolean. Usa itens de `BackpackGear` (inventário da mochila)
- `UseVestGear`: Boolean. Usa itens de `VestGear` (inventário do colete)
- `UsePrimaryWeapon`: Boolean. Adiciona arma primária
- `UseSecondaryWeapon`: Boolean. Adiciona arma secundária

**Formato de Itens:**

```json
"UpperGear": [
    {
        "ClassName": "Rag",
        "Quantity": 4,
        "Attachments": []
    },
    {
        "ClassName": "FNX45",
        "Quantity": 1,
        "Attachments": [
            "Mag_FNX45_15Rnd",
            "PistolSuppressor"
        ]
    }
]
```

- `ClassName`: String. Nome da classe do item
- `Quantity`: Integer. Quantidade (para stackables) ou `-1` para quantidade padrão
- `Attachments`: Array. Attachments para o item

**Armas:**

```json
"PrimaryWeapon": {
    "ClassName": "AKM",
    "Quantity": -1,
    "Attachments": ["AK_WoodBttstck", "Mag_AKM_30Rnd"]
},
"SecondaryWeapon": {
    "ClassName": "Glock19",
    "Quantity": -1,
    "Attachments": ["Mag_Glock_15Rnd"]
}
```

⚠️ **Importante**: Armas devem ser de fogo ou corpo-a-corpo (machado, faca, etc.)

**Outras Configurações:**

- `ApplyEnergySources`: Boolean
  - `0`: Nada acontece
  - `1`: Todos itens que precisam de bateria V9 recebem uma automaticamente

- `SetRandomHealth`: Boolean
  - `0`: Todo gear spawna em condição pristine
  - `1`: Gear spawna em condição aleatória

##### Loadouts (Conjuntos de Equipamento)

- `UseLoadouts`: Boolean
  - `0`: Sistema de loadouts desabilitado
  - `1`: Usa loadouts ao respawnar

⚠️ **Nota**: Você pode combinar starting gear/clothing com loadouts. Loadouts podem escolher outfit aleatório enquanto starting gear dá itens genéricos.

**MaleLoadouts** (Array):
```json
"MaleLoadouts": [
    ["SoldierLoadout", 0.5],
    ["CivilianLoadout", 0.5]
]
```

**FemaleLoadouts** (Array):
```json
"FemaleLoadouts": [
    ["SoldierLoadout", 0.5],
    ["CivilianLoadout", 0.5]
]
```

- Primeiro valor: String. Nome do loadout
- Segundo valor: Float. Chance de 0.0 a 1.0 de ser escolhido

##### Status Inicial do Jogador

- `SpawnHealthValue`: Float. Vida inicial (100.0 = máximo)
- `SpawnEnergyValue`: Float. Energia/comida inicial (máximo ~20000)
- `SpawnWaterValue`: Float. Água/sede inicial (máximo ~5000)

**Valores Recomendados:**
- Fácil: Health 100, Energy 1000, Water 1000
- Normal: Health 100, Energy 500, Water 500
- Difícil: Health 75, Energy 300, Water 300
- Hardcore: Health 50, Energy 100, Water 100

##### Respawn Cooldowns (Tempo de Recarga)

- `EnableRespawnCooldowns`: Boolean
  - `0`: Sistema de cooldown desabilitado
  - `1`: Ativa cooldown para spawn locations com `UseCooldown: 1`

- `RespawnCooldown`: Integer. Tempo em segundos de cooldown após spawnar em uma localização

- `RespawnUTCTime`: Boolean
  - `0`: Cooldowns calculados com horário local do servidor
  - `1`: Cooldowns calculados com horário UTC

**Punição por Multi-Spawn:**

- `PunishMultispawn`: Boolean
  - `0`: Feature desabilitada
  - `1`: Pune jogador com cooldown adicional ao usar mesma localização repetidamente

- `PunishCooldown`: Integer. Cooldown adicional em segundos (somado ao `RespawnCooldown`)

- `PunishTimeframe`: Integer. Tempo em segundos entre respawns na mesma localização para não ativar punição

**Exemplo:**
```json
"EnableRespawnCooldowns": 1,
"RespawnCooldown": 1800,
"PunishMultispawn": 1,
"PunishCooldown": 3600,
"PunishTimeframe": 7200
```

Significa:
- Cooldown normal: 30 minutos
- Se respawnar no mesmo local em menos de 2 horas: cooldown de 1 hora adicional (total 1h30min)

##### Death Marker (Marcador de Morte)

- `CreateDeathMarker`: Boolean
  - `0`: Feature desabilitada
  - `1`: Cria marcador no mapa mostrando última localização de morte no menu de spawn

##### Exemplo Completo para The LionZ

**Configuração Survival/PvP Balanceada:**
```json
{
    "m_Version": 7,
    "EnableSpawnSelection": 1,
    "SpawnOnTerritory": 0,
    "SpawnLocations": [
        {
            "Name": "Elektrozavodsk",
            "Positions": [
                [10400.0, 2.0, 2200.0],
                [10500.0, 2.0, 2300.0]
            ],
            "UseCooldown": 1
        },
        {
            "Name": "Chernogorsk",
            "Positions": [
                [6600.0, 2.0, 2500.0],
                [6700.0, 2.0, 2600.0]
            ],
            "UseCooldown": 1
        }
    ],
    "StartingClothing": {
        "EnableCustomClothing": 1,
        "SetRandomHealth": 1,
        "Headgear": [],
        "Tops": ["TShirt_Blue", "TShirt_Red", "TShirt_Green"],
        "Pants": ["Jeans_Blue", "Jeans_Black"],
        "Shoes": ["AthleticShoes_Blue"],
        "Backpacks": []
    },
    "StartingGear": {
        "EnableStartingGear": 1,
        "ApplyEnergySources": 1,
        "SetRandomHealth": 1,
        "UpperGear": [
            {
                "ClassName": "Rag",
                "Quantity": 2,
                "Attachments": []
            }
        ],
        "PantsGear": [],
        "BackpackGear": [],
        "VestGear": [],
        "PrimaryWeapon": {
            "ClassName": "StoneKnife",
            "Quantity": -1,
            "Attachments": []
        },
        "SecondaryWeapon": {}
    },
    "UseLoadouts": 0,
    "MaleLoadouts": [],
    "FemaleLoadouts": [],
    "SpawnHealthValue": 100.0,
    "SpawnEnergyValue": 500.0,
    "SpawnWaterValue": 500.0,
    "EnableRespawnCooldowns": 1,
    "RespawnCooldown": 1800,
    "RespawnUTCTime": 0,
    "PunishMultispawn": 1,
    "PunishCooldown": 3600,
    "PunishTimeframe": 7200,
    "CreateDeathMarker": 1
}
```

**Dicas de Configuração:**

**Para Servidor PvP:**
- Cooldowns moderados (15-30 min) para evitar spawn rush
- Starting gear mínimo (faca de pedra, alguns rags)
- Múltiplas localizações de spawn espalhadas
- `CreateDeathMarker: 1` para facilitar recuperação de loot

**Para Servidor PvE/RP:**
- Cooldowns baixos ou desabilitados
- Starting gear mais generoso (comida, água, ferramentas)
- Spawn em cidades seguras
- `SpawnOnTerritory: 1` para facilitar retorno à base

**Para Servidor Hardcore:**
- Cooldowns altos (1+ hora)
- Sem starting gear ou apenas faca
- Status inicial baixo (Energy 300, Water 300)
- Poucas localizações de spawn
- `PunishMultispawn: 1` com cooldown alto

**Localizações Populares em Chernarus:**
- Costa Sul: Elektro, Cherno, Kamyshovo
- Costa Leste: Berezino, Solnichniy, Svetloyarsk
- Interior: Stary Sobor, Novy Sobor, Gorka
- Oeste: Zelenogorsk, Vybor, Lopatino

#### 8. Outros Arquivos de Configuração Expansion

**DamageSystemSettings.json**: Sistema de dano
**DebugSettings.json**: Configurações de debug
**GeneralSettings.json**: Configurações gerais do mod
**HardlineSettings.json**: Configurações de dificuldade
**LogSettings.json**: Sistema de logs
**MapSettings.json**: Configurações do mapa
**MissionSettings.json**: Configurações de missões
**MonitoringSettings.json**: Monitoramento do servidor
**PartySettings.json**: Sistema de grupos
**SafeZoneSettings.json**: Zonas seguras
**TerritorySettings.json**: Sistema de territórios
**VehicleSettings.json**: Configurações de veículos

## 🔧 Boas Práticas

### Performance
- Ajuste `MaxPatrols` baseado no número de jogadores
- Use `LoadBalancingCategories` para otimizar spawns
- Configure `DespawnRadius` adequadamente para evitar sobrecarga

### Balanceamento
- `DamageMultiplier`: 1.0 = dano normal, >1.0 = mais dano, <1.0 = menos dano
- `AccuracyMin/Max`: Controla a dificuldade dos combates
- `ThreatDistanceLimit`: Distância que IA detecta ameaças

### Imersão
- Use `Behaviour` variado para patrulhas diferentes
- Configure `Speed` apropriada para cada tipo de patrulha
- Defina `Loadout` temático para cada facção

## 💡 Dicas Específicas para The LionZ

### Configuração Atual
- Sistema de balanceamento por jogadores ativo
- Máximo de 10 patrulhas com 0-10 jogadores
- Redução progressiva até 0 patrulhas com 51+ jogadores
- 3 patrulhas em destroços de helicóptero
- 5 patrulhas em objetos
- 2 patrulhas em áreas contaminadas

### Recomendações
1. Mantenha patrulhas em pontos estratégicos (Green Mountain, bases militares)
2. Use facções diferentes para criar conflitos interessantes
3. Configure loadouts temáticos (Police, Military, Bandit)
4. Ajuste dificuldade baseado no feedback da comunidade

## 🐛 Troubleshooting

### IA não spawna
- Verifique `Enabled: 1`
- Confirme coordenadas dos Waypoints
- Verifique `MaxPatrols` na categoria apropriada

### Performance ruim
- Reduza `MaxPatrols` nas categorias
- Aumente `DespawnTime`
- Ajuste `MaxDistRadius`

### IA muito fácil/difícil
- Ajuste `AccuracyMin/Max`
- Modifique `DamageMultiplier`
- Configure `ThreatDistanceLimit`

## 📖 Valores Especiais

- `-1` ou `-1.0`: Usa valor padrão do sistema
- `-2.0` (RespawnTime): Não respawna automaticamente
- `0`: Desabilitado
- `1`: Habilitado

## 🔗 Links Úteis

- Wiki Oficial: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki
- Discord Expansion: https://discord.gg/expansionproject
- Documentação DayZ: https://community.bistudio.com/wiki/DayZ

---

**Nota**: Este guia é baseado na wiki oficial do DayZ Expansion. Para informações mais detalhadas e atualizadas, sempre consulte a documentação oficial.

*Criado para The LionZ Server* 🦁
