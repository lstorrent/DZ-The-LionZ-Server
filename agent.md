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

#### 5. Outros Arquivos de Configuração Expansion

**BuildingSettings.json**: Configuração de construções
**DamageSystemSettings.json**: Sistema de dano
**DebugSettings.json**: Configurações de debug
**GeneralSettings.json**: Configurações gerais do mod
**HardlineSettings.json**: Configurações de dificuldade
**LogSettings.json**: Sistema de logs
**MapSettings.json**: Configurações do mapa
**MissionSettings.json**: Configurações de missões
**MonitoringSettings.json**: Monitoramento do servidor
**NotificationSettings.json**: Sistema de notificações
**PartySettings.json**: Sistema de grupos
**SafeZoneSettings.json**: Zonas seguras
**SpawnSettings.json**: Configurações de spawn de jogadores
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
