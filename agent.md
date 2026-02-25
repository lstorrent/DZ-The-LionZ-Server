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

##### 4.2.1. Action Objective - Lista Completa de Actions

**Estrutura do Action Objective:**
```json
{
    "ConfigVersion": 28,
    "ID": 1,
    "ObjectiveType": 10,
    "ObjectiveText": "Descrição do objetivo",
    "TimeLimit": -1,
    "Active": 1,
    "ActionNames": ["ActionName"],
    "AllowedClassNames": [],
    "ExcludedClassNames": [],
    "ExecutionAmount": 1
}
```

**Parâmetros:**
- `ActionNames`: Array com nome(s) da(s) ação(ões) que contam para o objetivo
- `AllowedClassNames`: Array de itens específicos permitidos (vazio = qualquer item)
- `ExcludedClassNames`: Array de itens excluídos
- `ExecutionAmount`: Quantas vezes a ação deve ser executada

**📋 ACTIONS DO DAYZ POR CATEGORIA:**

**🩹 MÉDICO / PRIMEIROS SOCORROS:**
- `ActionBandageSelf` / `ActionBandageTarget` - Enfaixar
- `ActionSplintSelf` / `ActionSplintTarget` - Aplicar tala
- `ActionDisinfectSelf` / `ActionDisinfectTarget` - Desinfetar feridas
- `ActionSewSelf` / `ActionSewTarget` - Costurar feridas
- `ActionBurnSewSelf` / `ActionBurnSewTarget` - Cauterizar feridas
- `ActionInjectSelf` / `ActionInjectTarget` - Injetar medicamento
- `ActionInjectEpinephrineSelf` / `ActionInjectEpinephrineTarget` - Injetar epinefrina
- `ActionInjectMorphineSelf` / `ActionInjectMorphineTarget` - Injetar morfina
- `ActionGiveBloodSelf` / `ActionGiveBloodTarget` - Transfusão de sangue
- `ActionGiveSalineSelf` / `ActionGiveSalineTarget` - Dar soro
- `ActionCollectBloodSelf` / `ActionCollectBloodTarget` - Coletar sangue
- `ActionTestBloodSelf` / `ActionTestBloodTarget` - Testar tipo sanguíneo
- `ActionCheckPulse` - Checar pulso
- `ActionCPR` - Fazer RCP
- `ActionDefibrilateSelf` / `ActionDefibrilateTarget` - Usar desfibrilador
- `ActionMeasureTemperatureSelf` / `ActionMeasureTemperatureTarget` - Medir temperatura

**💊 CONSUMIR MEDICAMENTOS:**
- `ActionBiteCharcoalTablets` / `ActionEatCharcoalTablets` - Carvão ativado
- `ActionBitePainkillerTablets` / `ActionEatPainkillerTablets` - Analgésico
- `ActionBitePurificationTablets` / `ActionEatPurificationTablets` - Purificador
- `ActionBiteTetracyclineAntibiotics` / `ActionEatTetracyclineAntibiotics` - Antibiótico
- `ActionBiteVitaminBottle` / `ActionEatVitaminBottle` - Vitamina

**🍖 COMIDA E BEBIDA:**
- `ActionEat` - Comer (genérico)
- `ActionEatCan` - Comer lata
- `ActionEatMeat` - Comer carne
- `ActionEatFruit` - Comer fruta
- `ActionEatSmall` - Comer item pequeno
- `ActionDrink` - Beber
- `ActionDrinkCan` - Beber de lata
- `ActionDrinkAlcohol` - Beber álcool
- `ActionDrinkCookingPot` - Beber de panela
- `ActionDrinkPondContinuous` - Beber de lagoa
- `ActionDrinkWellContinuous` - Beber de poço
- `ActionTakeABite` / `ActionTakeABiteCan` - Dar mordida
- `ActionTakeASip` - Dar gole
- `ActionCookOnStick` - Cozinhar no espeto

**🏗️ CONSTRUÇÃO:**
- `ActionBuildPart` - Construir parte
- `ActionDismantlePart` - Desmontar parte
- `ActionDestroyPart` - Destruir parte
- `ActionRepairPart` - Reparar parte
- `ActionAttachToConstruction` - Anexar à construção
- `ActionBuildShelter` - Construir abrigo
- `ActionDeconstructShelter` - Desconstruir abrigo
- `ActionRepairShelter` - Reparar abrigo
- `ActionBuildOvenCB` - Construir forno
- `ActionDismantleOvenCB` - Desmontar forno
- `ActionBuildStoneCircleCB` - Construir círculo de pedras
- `ActionMountBarbedWire` - Montar arame farpado
- `ActionUnmountBarbedWire` - Desmontar arame farpado

**🔥 FOGUEIRA:**
- `ActionIgniteFireplaceByAir` - Acender fogueira
- `ActionExtinguishFireplaceByExtinguisher` - Apagar com extintor
- `ActionExtinguishFireplaceByLiquid` - Apagar com líquido
- `ActionCreateIndoorFireplace` - Criar fogueira indoor
- `ActionPlaceFireplaceIndoor` - Colocar fogueira indoor
- `ActionPlaceFireplaceIntoBarrel` - Colocar em barril
- `ActionTurnOnChemlight` - Ligar chemlight
- `ActionTurnOnHeatpack` - Ativar heatpack

**🌳 COLETA DE RECURSOS:**
- `ActionMineBush` / `ActionMineBushByHand` - Coletar gravetos
- `ActionMineTree` - Cortar árvore
- `ActionMineTreeBark` - Tirar casca
- `ActionMineRock` / `ActionMineRock1H` - Minerar pedra
- `ActionDigWorms` - Cavar minhocas
- `ActionPickBerry` - Colher frutas
- `ActionSkinning` - Esfolar animal
- `ActionFishingNew` - Pescar

**🌱 AGRICULTURA:**
- `ActionPlantSeed` - Plantar semente
- `ActionWaterPlant` / `ActionWaterGardenSlot` - Regar
- `ActionFertilizeSlot` - Fertilizar
- `ActionDisinfectPlant` - Desinfetar planta
- `ActionHarvestCrops` - Colher plantação
- `ActionRemovePlant` - Remover planta
- `ActionDigGardenPlot` - Cavar canteiro
- `ActionDismantleGardenPlot` - Desmontar canteiro

**🔧 CRAFTING:**
- `ActionCraft` - Craftar
- `ActionWorldCraft` - Craftar no mundo
- `ActionSawPlanks` - Serrar tábuas
- `ActionBreakLongWoodenStick` - Quebrar graveto
- `ActionSortAmmoPile` - Organizar munição

**🚗 VEÍCULOS:**
- `ActionCarDoors` / `ActionCarDoorsOutside` - Porta de carro
- `ActionOpenCarDoors` / `ActionCloseCarDoors` - Abrir/fechar porta
- `ActionLockDoors` / `ActionUnlockDoors` - Trancar/destrancar
- `ActionStartEngine` / `ActionStopEngine` - Ligar/desligar motor
- `ActionSwitchSeats` - Trocar assento
- `ActionGetInTransport` - Entrar em veículo
- `ActionFillFuel` - Abastecer
- `ActionFillOil` - Adicionar óleo
- `ActionFillCoolant` - Adicionar líquido arrefecimento
- `ActionFillBrakes` - Adicionar fluido freio
- `ActionRepairCarPart` - Reparar peça
- `ActionRepairCarEngine` - Reparar motor
- `ActionRepairCarChassis` - Reparar chassi
- `ActionAttachWheels` - Anexar rodas
- `ActionInsertSparkplug` - Inserir vela
- `ActionSwitchLights` - Ligar/desligar faróis

**🔒 SEGURANÇA:**
- `ActionHandcuffTarget` - Algemar
- `ActionRestrainSelf` / `ActionRestrainTarget` - Amarrar
- `ActionUnrestrainSelf` / `ActionUnrestrainTarget` - Desamarrar
- `ActionGagSelf` / `ActionGagTarget` - Amordaçar
- `ActionUngagSelf` / `ActionUngagTarget` - Desamordaçar
- `ActionDestroyCombinationLock` - Destruir cadeado
- `ActionDialCombinationLockCB` - Discar código

**🚪 PORTAS E CONTAINERS:**
- `ActionOpenDoors` / `ActionCloseDoors` - Portas
- `ActionOpenFence` / `ActionCloseFence` - Cerca
- `ActionOpenBarrel` / `ActionCloseBarrel` - Barril
- `ActionLockedDoors` - Tentar porta trancada

**🎒 ITENS:**
- `ActionDropItem` - Soltar item
- `ActionTakeItem` / `ActionTakeItemToHands` - Pegar item
- `ActionSwapItemToHands` - Trocar para mãos
- `ActionDeployObject` - Colocar objeto
- `ActionPlaceObject` / `ActionPlaceOnGround` - Posicionar
- `ActionFoldObject` / `ActionUnfoldEntity` - Dobrar/desdobrar
- `ActionUnpackBox` - Desempacotar

**🔦 ILUMINAÇÃO:**
- `ActionTurnOnHeadtorch` / `ActionTurnOffHeadtorch` - Lanterna cabeça
- `ActionTurnOnHelmetFlashlight` / `ActionTurnOffHelmetFlashlight` - Luz capacete
- `ActionTurnOnWeaponFlashlight` / `ActionTurnOffWeaponFlashlight` - Lanterna arma
- `ActionTurnOnWhileInHands` / `ActionTurnOffWhileInHands` - Ligar/desligar nas mãos
- `ActionSwitchLights` - Alternar luzes

**🔋 ENERGIA:**
- `ActionTurnOnPowerGenerator` / `ActionTurnOffPowerGenerator` - Gerador
- `ActionFillGeneratorTank` - Abastecer gerador
- `ActionAttachPowerSourceToPanel` - Conectar energia
- `ActionPlugIn` / `ActionPullOutPlug` - Conectar/desconectar
- `ActionMeasureBattery` - Medir bateria

**📻 COMUNICAÇÃO:**
- `ActionTuneFrequencyCB` - Sintonizar frequência
- `ActionTuneRadioStationCB` - Sintonizar rádio
- `ActionTurnOnTransmitterCB` / `ActionTurnOffTransmitterCB` - Transmissor
- `ActionRaiseMegaphoneCB` - Levantar megafone

**🔭 ÓTICA:**
- `ActionViewBinoculars` - Ver binóculos
- `ActionViewOptics` - Ver mira
- `ActionViewCompass` - Ver bússola
- `ActionUseRangefinder` - Usar telêmetro
- `ActionToggleNVG` - Alternar visão noturna
- `ActionZoomIn` / `ActionZoomOut` - Zoom

**🏴 BANDEIRAS:**
- `ActionRaiseFlag` / `ActionLowerFlag` - Levantar/baixar bandeira
- `ActionManipulateFlagCB` - Manipular bandeira

**🧥 ROUPAS:**
- `ActionStripCarrierVest` - Remover colete
- `ActionShaveSelf` / `ActionShaveTarget` - Barbear
- `ActionCoverHeadSelf` / `ActionCoverHeadTarget` - Cobrir cabeça
- `ActionUncoverHeadSelf` / `ActionUncoverHeadTarget` - Descobrir cabeça
- `ActionFoldBandanaToHead` / `ActionFoldBandanaToMask` - Dobrar bandana
- `ActionWringClothes` - Torcer roupas

**🧼 HIGIENE:**
- `ActionWashHandsWater` - Lavar mãos
- `ActionWashHandsWell` - Lavar mãos no poço

**💀 CORPO:**
- `ActionBuryBody` - Enterrar corpo
- `ActionBuryAshesCB` - Enterrar cinzas
- `ActionPullBodyFromTransport` - Puxar corpo

**🏕️ TENDAS:**
- `ActionToggleTentOpen` - Abrir/fechar tenda
- `ActionPackTentCB` / `ActionRepackTent` - Empacotar tenda
- `ActionRepairTent` / `ActionRepairTentPart` - Reparar tenda

**🪜 ESCADAS:**
- `ActionEnterLadder` / `ActionExitLadder` - Entrar/sair escada

**🔫 ARMAS:**
- `ActionLoadMagazine` / `ActionLoadMagazineQuick` - Carregar magazine
- `ActionEmptyMagazine` - Esvaziar magazine

**💧 LÍQUIDOS:**
- `ActionFillBottleBase` - Encher garrafa
- `ActionEmptyBottleBase` - Esvaziar garrafa
- `ActionEmptyCookingPot` - Esvaziar panela
- `ActionTransferLiquid` - Transferir líquido

**🪤 ARMADILHAS:**
- `ActionActivateTrap` - Ativar armadilha
- `ActionClapBearTrapWithThisItem` - Desarmar armadilha

**📄 LEITURA:**
- `ActionReadPaper` / `ActionWritePaper` - Ler/escrever papel
- `ActionUnfoldMapCB` - Desdobrar mapa

**💡 EXEMPLOS DE USO:**

```json
// Comer 3 latas de comida
{
    "ActionNames": ["ActionEatCan"],
    "AllowedClassNames": [],
    "ExecutionAmount": 3
}

// Plantar 5 sementes de abóbora
{
    "ActionNames": ["ActionPlantSeed"],
    "AllowedClassNames": ["PumpkinSeeds"],
    "ExecutionAmount": 5
}

// Reparar 2 peças de carro
{
    "ActionNames": ["ActionRepairCarPart"],
    "AllowedClassNames": [],
    "ExecutionAmount": 2
}

// Pescar 10 vezes
{
    "ActionNames": ["ActionFishingNew"],
    "AllowedClassNames": [],
    "ExecutionAmount": 10
}

// Construir 1 parte de base
{
    "ActionNames": ["ActionBuildPart"],
    "AllowedClassNames": [],
    "ExecutionAmount": 1
}
```

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

#### 7. PartySettings.json

**Localização:** `profiles/ExpansionMod/Settings/PartySettings.json`

Configura o sistema de grupos/party do servidor, permitindo jogadores formarem equipes com marcadores, HUD compartilhado e comunicação.

**Parâmetros Principais:**

- `m_Version`: Integer. Versão do arquivo (não altere!)

**Configurações Gerais:**

- `EnableParties`: Boolean
  - `0`: Jogadores não podem criar grupos
  - `1`: Permite criação de grupos (abrir livro com B e ir na aba party)

- `MaxMembersInParty`: Integer
  - Máximo de jogadores permitidos em um único grupo
  - Se <= 0, tamanho ilimitado
  - Recomendado: 5-10 para servidores PvP

- `UseWholeMapForInviteList`: Boolean
  - `0`: Só pode convidar jogadores próximos
  - `1`: Pode convidar qualquer jogador de qualquer distância

**Marcadores 3D (Acima da Cabeça):**

- `ShowPartyMember3DMarkers`: Boolean
  - `0`: Não exibe marcadores acima da cabeça dos membros
  - `1`: Exibe marcador estilo "The Sims" acima da cabeça dos membros do grupo

- `ShowDistanceUnderPartyMembersMarkers`: Boolean (requer ShowPartyMember3DMarkers = 1)
  - `0`: Não exibe distância sob o marcador
  - `1`: Exibe distância em metros sob cada marcador de membro

- `ShowNameOnPartyMembersMarkers`: Boolean (requer ShowPartyMember3DMarkers = 1)
  - `0`: Não exibe nome sob o marcador
  - `1`: Exibe nome do jogador sob cada marcador de membro

**Quick Markers (Marcadores Rápidos):**

- `EnableQuickMarker`: Boolean
  - `0`: Não pode criar quickmarkers
  - `1`: Pode criar quickmarker (só funciona se estiver em grupo)
  - Uso: Tecla H para criar, H ou Delete olhando para o marcador para remover
  - Dica: Olhe para o céu e pressione H para criar marcador aéreo

- `ShowDistanceUnderQuickMarkers`: Boolean (requer EnableQuickMarker = 1)
  - `0`: Não exibe distância sob quickmarker
  - `1`: Exibe distância sob cada quickmarker

- `ShowNameOnQuickMarkers`: Boolean (requer EnableQuickMarker = 1)
  - `0`: Não exibe nome do criador do quickmarker
  - `1`: Exibe nome do criador sob o quickmarker

**Party Markers (Marcadores de Grupo):**

- `CanCreatePartyMarkers`: Boolean
  - `0`: Não pode criar marcadores de grupo
  - `1`: Pode criar marcadores de grupo no mapa
  - Marcadores são visíveis por todos do grupo

- `ShowPartyMemberMapMarkers`: Boolean
  - `0`: Não exibe membros do grupo no mapa
  - `1`: Exibe posição dos membros do grupo no mapa

**HUD de Grupo:**

- `ShowPartyMemberHUD`: Boolean
  - `0`: Desabilita HUD de status dos membros
  - `1`: Membros do grupo podem ver status dos companheiros (saúde, condição)

- `ShowHUDMemberBlood`: Boolean (requer ShowPartyMemberHUD = 1)
  - `0`: Não exibe nível de sangue no HUD
  - `1`: Exibe nível de sangue dos membros

- `ShowHUDMemberStates`: Boolean (requer ShowPartyMemberHUD = 1)
  - `0`: Não exibe estados (fome, sede, etc.) no HUD
  - `1`: Exibe estados dos membros (ícones de status)

- `ShowHUDMemberStance`: Boolean (requer ShowPartyMemberHUD = 1)
  - `0`: Não exibe postura no HUD
  - `1`: Exibe postura dos membros (em pé, agachado, deitado)

- `ShowHUDMemberDistance`: Boolean (requer ShowPartyMemberHUD = 1)
  - `0`: Não exibe distância no HUD
  - `1`: Exibe distância até cada membro no HUD

**Tags e Cooldowns:**

- `ForcePartyToHaveTags`: Boolean
  - `0`: Grupos não precisam ter tag
  - `1`: Força grupos a terem uma tag/nome

- `DisplayPartyTag`: Boolean
  - `0`: Não exibe tag do grupo
  - `1`: Exibe tag do grupo nos marcadores e HUD

- `InviteCooldown`: Integer
  - Tempo em segundos de cooldown entre convites
  - `0`: Sem cooldown
  - Recomendado: 5-10 para evitar spam

**Exemplo de Configuração PvP Balanceada:**
```json
{
    "m_Version": 8,
    "EnableParties": 1,
    "MaxMembersInParty": 6,
    "UseWholeMapForInviteList": 0,
    "ShowPartyMember3DMarkers": 1,
    "ShowDistanceUnderPartyMembersMarkers": 1,
    "ShowNameOnPartyMembersMarkers": 1,
    "EnableQuickMarker": 1,
    "ShowDistanceUnderQuickMarkers": 1,
    "ShowNameOnQuickMarkers": 1,
    "CanCreatePartyMarkers": 1,
    "ShowPartyMemberMapMarkers": 1,
    "ShowPartyMemberHUD": 1,
    "ShowHUDMemberBlood": 1,
    "ShowHUDMemberStates": 1,
    "ShowHUDMemberDistance": 1,
    "ForcePartyToHaveTags": 0,
    "DisplayPartyTag": 1,
    "InviteCooldown": 5
}
```

#### 8. Market System (Sistema de Trader)

**Localização dos Arquivos:**
```
profiles/ExpansionMod/Settings/
├── MarketSettings.json          # Configurações gerais do market
├── TraderZones.json            # Zonas de trader (safezones)
profiles/ExpansionMod/Market/
├── Items/                      # Configuração de itens vendidos
├── Categories/                 # Categorias do market
└── Traders/                    # Configuração de traders/NPCs
```

**Visão Geral:**

O Expansion Market é um sistema de mercado baseado em estoque onde jogadores podem comprar e vender itens em troca de moeda. Tudo é configurável: preços, estoque, itens disponíveis por trader, categorias, etc.

**Características:**
- Sistema baseado em estoque (itens podem esgotar)
- Preços dinâmicos ou estáticos
- Múltiplos traders com inventários diferentes
- Categorias customizáveis
- Moeda customizável
- ATMs para armazenamento de dinheiro
- Zonas de trader (safezones)

##### 8.1. MarketSettings.json

**Localização:** `mpmissions/dayzOffline.<mapname>/expansion/settings/MarketSettings.json`

⚠️ **Importante:** Diferente de outras configurações do Expansion, MarketSettings.json é específico por mapa e fica na pasta da missão.

**Parâmetros Principais:**

- `m_Version`: Integer
  - Versão do arquivo de configuração (não altere!)
  - Usado internamente para conversão automática de configurações antigas

**Configurações Gerais:**

- `MarketSystemEnabled`: Boolean
  - `0`: Desabilita todo o sistema de market
  - `1`: Habilita sistema de market

**Veículos - Distâncias e Spawn:**

- `MaxVehicleDistanceToTrader`: Float
  - Distância máxima de veículos normais (carro/heli/barco) para aparecer como vendável
  - Também define distância máxima da zona de spawn de veículos
  - Valor em metros
  - Recomendado: 100-200m

- `MaxLargeVehicleDistanceToTrader`: Float
  - Distância máxima de veículos grandes (ex: porta-aviões)
  - Também define distância máxima da zona de spawn
  - Valor em metros
  - Recomendado: 500-1000m

- `LargeVehicles`: Array [String]
  - Classnames de veículos que devem usar MaxLargeVehicleDistanceToTrader
  - Exemplo:
```json
"LargeVehicles": [
    "ExpansionAircraftCarrier",
    "ExpansionCargoShip"
]
```

**Zonas de Spawn de Veículos:**

- `LandSpawnPositions`: Array de objetos
  - Posições e orientações para spawn de veículos terrestres (carros)
  - Precisa ter pelo menos uma entrada dentro do raio de MaxVehicleDistanceToTrader do trader
  - Estrutura:
```json
"LandSpawnPositions": [
    {
        "Position": [11903.400390625, 140.0, 12455.099609375],
        "Orientation": [24.0, 0.0, 0.0]
    },
    {
        "Position": [1513, 120, 1045],
        "Orientation": [24, 0, 0]
    }
]
```
  - `Position`: Vector [X, Y, Z] - Coordenadas do spawn
  - `Orientation`: Vector [Yaw, Pitch, Roll] - Rotação do veículo

- `AirSpawnPositions`: Array de objetos
  - Posições e orientações para spawn de veículos aéreos (helicópteros, aviões)
  - Mesma estrutura que LandSpawnPositions
  - Exemplo:
```json
"AirSpawnPositions": [
    {
        "Position": [11903.400390625, 140.0, 12455.099609375],
        "Orientation": [24.0, 0.0, 0.0]
    }
]
```

- `WaterSpawnPositions`: Array de objetos
  - Posições e orientações para spawn de veículos aquáticos (barcos)
  - Mesma estrutura que LandSpawnPositions
  - Exemplo:
```json
"WaterSpawnPositions": [
    {
        "Position": [11903.400390625, 140.0, 12455.099609375],
        "Orientation": [24.0, 0.0, 0.0]
    }
]
```

**Sistema ATM:**

- `ATMSystemEnabled`: Boolean
  - `0`: Desabilita ATMs (caixas eletrônicos)
  - `1`: Habilita ATMs

- `MaxDepositMoney`: Integer
  - Quantidade máxima de dinheiro que jogadores podem depositar no ATM
  - `-1`: Sem limite
  - Valor positivo: Limite específico
  - Exemplo: `10000000` (10 milhões)

- `DefaultDepositMoney`: Integer
  - Dinheiro padrão que jogador recebe na conta ATM ao entrar pela primeira vez
  - `0`: Sem dinheiro inicial
  - Valor positivo: Dinheiro inicial
  - Exemplo: `5000` (5 mil de início)

- `ATMPlayerTransferEnabled`: Boolean
  - `0`: Não pode transferir dinheiro entre jogadores via ATM
  - `1`: Permite transferências entre jogadores

- `ATMPartyLockerEnabled`: Boolean
  - `0`: Não há cofre compartilhado de grupo
  - `1`: Grupos podem ter cofre compartilhado no ATM

- `MaxPartyDepositMoney`: Integer
  - Quantidade máxima de dinheiro que pode ser depositada na conta de grupo
  - `-1`: Sem limite
  - Valor positivo: Limite específico

**Preços e Moeda:**

- `SellPricePercent`: Float
  - Controla diferença de preço de venda GLOBAL de todos itens do market
  - Valor padrão: `75.0` (75% do preço de compra)
  - Pode ser sobrescrito individualmente por zona ou item
  - Exemplos:
    - `75.0`: Trader paga 75% do preço de compra
    - `50.0`: Trader paga 50% do preço de compra
    - `100.0`: Trader paga preço cheio (sem lucro)

- `Currencies`: Array [String]
  - Lista de moedas que podem ser armazenadas na conta bancária do ATM
  - Classnames dos itens de moeda
  - Exemplo:
```json
"Currencies": [
    "expansionbanknotehryvnia",
    "expansionbanknote1",
    "expansionbanknote5",
    "expansionbanknote10",
    "expansionbanknote20",
    "expansionbanknote50",
    "expansionbanknote100",
    "expansionbanknote200",
    "expansionbanknote500"
]
```

**Customização Visual do Menu:**

- `MarketMenuColors`: Objeto
  - Cores usadas para o menu do market
  - Formato: Hexadecimal RRGGBBAA, RGBA, ou decimal R G B A (0-255)
  - Alpha (transparência) é opcional
  - Gerador de cores: https://color.adobe.com/create/color-wheel

**Cores Disponíveis:**

- `BaseColorVignette`: Cor de fundo vinheta do menu
- `BaseColorHeaders`: Cor para todos elementos de cabeçalho
- `BaseColorLabels`: Cor para todos fundos de labels
- `BaseColorText`: Cor para todos elementos de texto no menu
- `BaseColorInfoSectionBackground`: Cor de fundo da seção de info do item
- `BaseColorTooltipsCorners`: Cor dos cantos dos tooltips
- `BaseColorTooltipsSeperatorLine`: Cor da linha separadora dos tooltips
- `BaseColorTooltipsBackground`: Cor de fundo dos tooltips
- `ColorDecreaseQuantityButton`: Cor do botão de diminuir quantidade
- `ColorSetQuantityButton`: Cor do botão de definir quantidade
- `ColorIncreaseQuantityButton`: Cor do botão de aumentar quantidade
- `ColorSellPanel`: Cor de fundo do painel de venda
- `ColorSellButton`: Cor do botão de vender
- `ColorBuyPanel`: Cor de fundo do painel de compra
- `ColorBuyButton`: Cor do botão de comprar
- `ColorMarketIcon`: Cor do ícone principal do trader (canto superior esquerdo)
- `ColorFilterOptionsButton`: Cor ao passar mouse sobre botão de filtro de armas
- `ColorFilterOptionsIcon`: Cor do ícone do botão de filtro de armas
- `ColorSearchFilterButton`: Cor do botão de filtro de busca ao passar mouse
- `ColorCategoryButton`: Cor dos botões de categoria ao passar mouse
- `ColorCategoryCollapseIcon`: Cor do ícone de seta quando categoria está colapsada
- `ColorItemButton`: Cor do botão de item ao passar mouse
- `ColorItemInfoIcon`: Cor do ícone de info quando item tem condição especial
- `ColorItemInfoHasContainerItems`: Cor do texto quando item tem outros itens no container
- `ColorItemInfoHasAttachments`: Cor do texto quando item tem attachments
- `ColorItemInfoHasBullets`: Cor do texto quando magazine tem balas
- `ColorItemInfoIsAttachment`: Cor do texto quando item está anexado a outro
- `ColorItemInfoIsEquipped`: Cor do texto quando item está equipado
- `ColorItemInfoAttachments`: Cor do texto de attachments padrão na view detalhada
- `ColorToggleCategoriesText`: Cor do texto do botão de toggle de categorias
- `ColorCategoryCorners`: Cor dos cantos dos elementos de categoria
- `ColorCategoryBackground`: Cor de fundo dos elementos de categoria

**Ícone de Moeda:**

- `CurrencyIcon`: String
  - Caminho para o ícone usado como ícone de moeda no menu
  - Padrão: `"DayZExpansion/Market/GUI/icons/coinstack2_64x64.edds"`
  - Formato: Arquivo .edds (DayZ texture format)

**Configuração Interna:**

- `NetworkCategories`: Array
  - Usado apenas internamente
  - ⚠️ **NÃO ALTERE**: Gerado automaticamente e será sobrescrito

**Exemplo de Configuração Completa:**

```json
{
    "m_Version": 15,
    "MarketSystemEnabled": 1,
    "MaxVehicleDistanceToTrader": 150.0,
    "MaxLargeVehicleDistanceToTrader": 1000.0,
    "LargeVehicles": [],
    "LandSpawnPositions": [
        {
            "Position": [3700.0, 403.0, 6000.0],
            "Orientation": [0.0, 0.0, 0.0]
        },
        {
            "Position": [3710.0, 403.0, 6000.0],
            "Orientation": [0.0, 0.0, 0.0]
        }
    ],
    "AirSpawnPositions": [
        {
            "Position": [3750.0, 403.0, 6050.0],
            "Orientation": [0.0, 0.0, 0.0]
        }
    ],
    "WaterSpawnPositions": [],
    "ATMSystemEnabled": 1,
    "MaxDepositMoney": 10000000,
    "DefaultDepositMoney": 5000,
    "ATMPlayerTransferEnabled": 1,
    "ATMPartyLockerEnabled": 1,
    "MaxPartyDepositMoney": 50000000,
    "SellPricePercent": 75.0,
    "Currencies": [
        "expansionbanknotehryvnia",
        "expansionbanknote1",
        "expansionbanknote5",
        "expansionbanknote10",
        "expansionbanknote20",
        "expansionbanknote50",
        "expansionbanknote100"
    ],
    "CurrencyIcon": "DayZExpansion/Market/GUI/icons/coinstack2_64x64.edds",
    "MarketMenuColors": {
        "BaseColorVignette": "000000AA",
        "BaseColorHeaders": "1E1E1EFF",
        "BaseColorLabels": "2D2D2DFF",
        "BaseColorText": "FFFFFFFF",
        "BaseColorInfoSectionBackground": "1A1A1AFF",
        "ColorBuyButton": "00FF00FF",
        "ColorSellButton": "FF0000FF"
    },
    "NetworkCategories": []
}
```

**Dicas e Boas Práticas:**

1. **Zonas de Spawn de Veículos:**
   - Coloque múltiplas posições para evitar colisões
   - Espaçamento recomendado: 10-15m entre posições
   - Certifique-se que estão dentro do raio do trader
   - Use terreno plano para spawn terrestre
   - Use área aberta para spawn aéreo

2. **Sistema ATM:**
   - Habilite transferências para economia player-driven
   - Configure limite de depósito para evitar inflação
   - Dinheiro inicial ajuda novos jogadores
   - Party locker incentiva trabalho em equipe

3. **Preços:**
   - SellPricePercent 50-75% é balanceado
   - Valores muito altos causam inflação
   - Valores muito baixos desestimulam venda

4. **Moedas:**
   - Use notas de valores variados (1, 5, 10, 20, 50, 100)
   - Facilita transações de valores diferentes
   - Evite muitas denominações (confuso)

5. **Customização Visual:**
   - Use cores que combinem com tema do servidor
   - Mantenha contraste para legibilidade
   - Teste cores antes de aplicar
   - Use alpha para transparência sutil

6. **Veículos Grandes:**
   - Adicione apenas se tiver veículos muito grandes
   - Aumenta raio de detecção e spawn
   - Evite usar para veículos normais

**Formatos de Cor Aceitos:**

1. **Hexadecimal RRGGBBAA:**
   - `"FF0000FF"` = Vermelho opaco
   - `"00FF0080"` = Verde semi-transparente

2. **Hexadecimal RGBA:**
   - `"F00F"` = Vermelho opaco (formato curto)

3. **Decimal R G B A:**
   - `"255 0 0 255"` = Vermelho opaco
   - `"0 255 0 128"` = Verde semi-transparente

**Obtendo Coordenadas para Spawn:**

1. Use DayZeEditor para obter posições exatas
2. Entre no jogo e use comando de debug (se habilitado)
3. Use ferramentas online de mapas DayZ
4. Copie coordenadas de objetos existentes

**Exemplo de Setup para The LionZ:**

```json
{
    "m_Version": 15,
    "MarketSystemEnabled": 1,
    "MaxVehicleDistanceToTrader": 150.0,
    "LandSpawnPositions": [
        {"Position": [3700.0, 403.0, 6000.0], "Orientation": [0.0, 0.0, 0.0]},
        {"Position": [3710.0, 403.0, 6000.0], "Orientation": [90.0, 0.0, 0.0]},
        {"Position": [3720.0, 403.0, 6000.0], "Orientation": [180.0, 0.0, 0.0]}
    ],
    "ATMSystemEnabled": 1,
    "MaxDepositMoney": 5000000,
    "DefaultDepositMoney": 10000,
    "ATMPlayerTransferEnabled": 1,
    "ATMPartyLockerEnabled": 1,
    "SellPricePercent": 60.0,
    "Currencies": [
        "expansionbanknotehryvnia"
    ]
}
```

##### 8.2. Configuração de Categorias

**Localização:** `profiles/ExpansionMod/Market/Categories/`

Categorias organizam itens no menu do trader. Cada arquivo `.json` representa uma categoria.

**Estrutura:**
```json
{
    "m_Version": 12,
    "DisplayName": "Weapons",
    "Icon": "Deliver",
    "Color": "FBFCFEFF",
    "IsExchange": 0,
    "InitStockPercent": 75.0,
    "Items": []
}
```

**Parâmetros:**

- `m_Version`: Integer
  - Versão do arquivo de configuração (não altere!)
  - Usado internamente para conversão automática de configurações antigas

- `DisplayName`: String
  - Nome de exibição da categoria usado no menu do market
  - Suporta strings localizadas ou texto direto
  - Exemplos:
    - `"DisplayName": "#STR_EXPANSION_MARKET_CATEGORY_AMMOBOXES"` (localizado)
    - `"DisplayName": "Ammo Boxes"` (texto direto)
    - `"DisplayName": "Caixas de Munição"` (texto em português)

- `Icon`: String
  - Ícone da categoria que será exibido
  - Lista completa de ícones: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-List-of-default-icon-names
  - Exemplos: `"Weapon"`, `"Food"`, `"Medical"`, `"Vehicle"`, `"Deliver"`

- `Color`: String
  - Código de cor hexadecimal para esta categoria
  - Formato: RRGGBBAA (Red, Green, Blue, Alpha) sem o `#`
  - Ferramentas online: https://www.color-hex.com/
  - Exemplos:
    - `"FBFCFEFF"`: Branco
    - `"FF0000FF"`: Vermelho
    - `"00FF00FF"`: Verde
    - `"0000FFFF"`: Azul
    - `"FFFF00FF"`: Amarelo

- `IsExchange`: Boolean
  - Define se esta categoria é usada para moedas/currency
  - `0`: Categoria normal de itens
  - `1`: Categoria de moeda (todos itens neste arquivo são moedas)
  - ⚠️ **Importante**: Se habilitado (1), TODOS os itens neste arquivo serão marcados como moeda
  - Certifique-se que o arquivo contém APENAS itens de moeda

- `InitStockPercent`: Float
  - Porcentagem do estoque máximo que cada item será inicializado
  - Aplica-se no primeiro start do servidor ou para novos itens
  - Valor: 0.0 a 100.0
  - Padrão recomendado: `75.0` (75% do estoque máximo)
  - Exemplos:
    - `100.0`: Inicia com estoque cheio
    - `75.0`: Inicia com 75% do estoque
    - `50.0`: Inicia com metade do estoque
    - `0.0`: Inicia sem estoque (player-driven)

- `Items`: Array de objetos
  - Contém todos os itens e informações associadas para controle de preço e estoque
  - Veja seção "Configuração de Itens" abaixo

**Ícones Disponíveis:**
- `Weapon`, `Ammo`, `Clothing`, `Food`, `Medical`, `Tools`
- `Vehicle`, `Parts`, `Building`, `Misc`, `Deliver`
- `Gas`, `Helicopter`, `Boat`, `Plane`
- Lista completa: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Market-Settings-Items-&-Categories

**Exemplos de Categorias:**

`Weapons.json`:
```json
{
    "m_Version": 12,
    "DisplayName": "Armas",
    "Icon": "Weapon",
    "Color": "FF5733FF",
    "IsExchange": 0,
    "InitStockPercent": 75.0,
    "Items": []
}
```

`Food.json`:
```json
{
    "m_Version": 12,
    "DisplayName": "Comida",
    "Icon": "Food",
    "Color": "33FF57FF",
    "IsExchange": 0,
    "InitStockPercent": 100.0,
    "Items": []
}
```

`Currency.json` (Categoria de Moeda):
```json
{
    "m_Version": 12,
    "DisplayName": "Moedas",
    "Icon": "Deliver",
    "Color": "FFD700FF",
    "IsExchange": 1,
    "InitStockPercent": 0.0,
    "Items": []
}
```

##### 8.3. Configuração de Itens

**Localização:** Dentro do array `Items` de cada arquivo de categoria em `profiles/ExpansionMod/Market/Categories/`

Cada item no array contém configurações de preço, estoque, attachments e variantes.

**Estrutura de Item:**
```json
{
    "ClassName": "AKM",
    "MaxPriceThreshold": 50000,
    "MinPriceThreshold": 25000,
    "SellPricePercent": -1.0,
    "MaxStockThreshold": 10,
    "MinStockThreshold": 1,
    "QuantityPercent": -1,
    "SpawnAttachments": [],
    "Variants": []
}
```

**Parâmetros:**

- `ClassName`: String
  - Nome da classe do item/objeto
  - Deve ser o classname exato do DayZ
  - Geralmente em minúsculo
  - Exemplo: `"akm"`, `"m4a1"`, `"apple"`

- `MaxPriceThreshold`: Integer
  - Preço máximo que o item pode ter
  - Ocorre quando estoque está no mínimo
  - Fórmula: Preço aumenta quando estoque diminui

- `MinPriceThreshold`: Integer
  - Preço mínimo que o item pode ter
  - Ocorre quando estoque está no máximo
  - Fórmula: Preço diminui quando estoque aumenta

- `SellPricePercent`: Float
  - Porcentagem do preço de compra ao vender para trader
  - `-1.0`: Usa configuração da zona (padrão)
  - `0.0 a 100.0`: Porcentagem específica
  - ⚠️ **Nota**: Usa encoding bfloat16 (precisão limitada a 2-3 dígitos decimais)
  - Exemplos:
    - `-1.0`: Usa valor da zona
    - `50.0`: Trader paga 50% do preço de compra
    - `75.0`: Trader paga 75% do preço de compra

- `MaxStockThreshold`: Integer
  - Estoque máximo que o item pode ter no market
  - Valor especial: `-1` = estoque infinito (estático)
  - Para estoque estático: `MaxStockThreshold = MinStockThreshold = -1`

- `MinStockThreshold`: Integer
  - Estoque mínimo que o item pode ter no market
  - Valor especial: `-1` = estoque infinito (estático)
  - Para estoque estático: `MaxStockThreshold = MinStockThreshold = -1`

- `QuantityPercent`: Integer
  - Porcentagem da quantidade do item (magazines, líquidos, munição, etc.)
  - `-1`: Padrão 100% (cheio)
  - `0 a 100`: Porcentagem específica
  - Exemplos:
    - `-1`: Magazine cheio, garrafa cheia
    - `100`: 100% cheio
    - `50`: Metade cheio
    - `0`: Vazio

- `SpawnAttachments`: Array [String]
  - Classnames de itens que serão anexados por padrão
  - Funciona com armas (criar loadouts padrão)
  - Funciona com roupas, mochilas, coletes
  - Jogador pode comprar item com attachments padrão
  - Exemplo:
```json
"SpawnAttachments": [
    "ak_woodbttstck",
    "ak_woodhndgrd",
    "mag_akm_30rnd"
]
```

- `Variants`: Array [String]
  - Classnames de itens que serão exibidos como variantes
  - Útil para variações de cor do mesmo item
  - Exibidos em dropdown no menu detalhado do market
  - Variante herda configuração do item base por padrão
  - Para configuração diferente, variante precisa de entrada própria em `Items`
  - Exemplo:
```json
"Variants": [
    "tacticalshirt_black",
    "tacticalshirt_olive",
    "tacticalshirt_tan"
]
```

**Configurações Especiais:**

**Estoque Estático (Infinito):**
```json
{
    "ClassName": "apple",
    "MaxPriceThreshold": 100,
    "MinPriceThreshold": 100,
    "MaxStockThreshold": -1,
    "MinStockThreshold": -1
}
```

**Preço Estático (Fixo):**
```json
{
    "ClassName": "bandage",
    "MaxPriceThreshold": 500,
    "MinPriceThreshold": 500,
    "MaxStockThreshold": 50,
    "MinStockThreshold": 10
}
```

**Sistema de Preço Dinâmico:**

O preço varia baseado no estoque:
- Estoque alto → Preço baixo (MinPriceThreshold)
- Estoque baixo → Preço alto (MaxPriceThreshold)
- Fórmula: `Preço = MinPrice + ((MaxPrice - MinPrice) × (1 - EstoqueAtual/MaxEstoque))`

**Exemplos Práticos:**

**Exemplo 1: Munição Básica**
```json
{
    "ClassName": "ammobox_00buck_10rnd",
    "MaxPriceThreshold": 80,
    "MinPriceThreshold": 40,
    "SellPricePercent": -1.0,
    "MaxStockThreshold": 250,
    "MinStockThreshold": 1,
    "QuantityPercent": -1,
    "SpawnAttachments": [],
    "Variants": []
}
```

**Exemplo 2: Mochila com Variantes**
```json
{
    "ClassName": "childbag_red",
    "MaxPriceThreshold": 40,
    "MinPriceThreshold": 20,
    "SellPricePercent": -1.0,
    "MaxStockThreshold": 100,
    "MinStockThreshold": 1,
    "QuantityPercent": -1,
    "SpawnAttachments": [],
    "Variants": [
        "childbag_blue",
        "childbag_green"
    ]
}
```

**Exemplo 3: Variante com Preço Diferente**
```json
{
    "ClassName": "childbag_green",
    "MaxPriceThreshold": 50,
    "MinPriceThreshold": 25,
    "SellPricePercent": -1.0,
    "MaxStockThreshold": 100,
    "MinStockThreshold": 1,
    "QuantityPercent": -1,
    "SpawnAttachments": [],
    "Variants": []
}
```
*Nota: childbag_green tem preço diferente do item base (childbag_red)*

**Exemplo 4: Arma com Loadout Padrão**
```json
{
    "ClassName": "fal",
    "MaxPriceThreshold": 2000,
    "MinPriceThreshold": 1700,
    "SellPricePercent": -1.0,
    "MaxStockThreshold": 100,
    "MinStockThreshold": 1,
    "QuantityPercent": -1,
    "SpawnAttachments": [
        "fal_oebttstck",
        "mag_fal_20rnd"
    ],
    "Variants": []
}
```

**Exemplo 5: Magazine com 50% de Munição**
```json
{
    "ClassName": "mag_akm_30rnd",
    "MaxPriceThreshold": 5000,
    "MinPriceThreshold": 2500,
    "SellPricePercent": -1.0,
    "MaxStockThreshold": 50,
    "MinStockThreshold": 10,
    "QuantityPercent": 50,
    "SpawnAttachments": [],
    "Variants": []
}
```

**Exemplo 6: Item com Estoque Infinito**
```json
{
    "ClassName": "apple",
    "MaxPriceThreshold": 100,
    "MinPriceThreshold": 100,
    "SellPricePercent": -1.0,
    "MaxStockThreshold": -1,
    "MinStockThreshold": -1,
    "QuantityPercent": -1,
    "SpawnAttachments": [],
    "Variants": []
}
```

**Exemplo 7: Roupa com Variantes de Cor**
```json
{
    "ClassName": "tacticalshirt_grey",
    "MaxPriceThreshold": 1000,
    "MinPriceThreshold": 500,
    "SellPricePercent": -1.0,
    "MaxStockThreshold": 20,
    "MinStockThreshold": 5,
    "QuantityPercent": -1,
    "SpawnAttachments": [],
    "Variants": [
        "tacticalshirt_black",
        "tacticalshirt_olive",
        "tacticalshirt_tan"
    ]
}
```

**Exemplo 8: Veículo com Peças**
```json
{
    "ClassName": "expansionuaz",
    "MaxPriceThreshold": 150000,
    "MinPriceThreshold": 100000,
    "SellPricePercent": 50.0,
    "MaxStockThreshold": 5,
    "MinStockThreshold": 1,
    "QuantityPercent": -1,
    "SpawnAttachments": [
        "expansionuazdriversdoor",
        "expansionuazcodriver_door",
        "expansionuazcargo1door",
        "expansionuazcargo2door",
        "expansionuazhood",
        "expansionuaztrunk",
        "expansionuazwheel",
        "expansionuazwheel",
        "expansionuazwheel",
        "expansionuazwheel",
        "carradiator",
        "carbattery",
        "sparkplug"
    ],
    "Variants": []
}
```

**Arquivo Completo de Categoria:**

`Weapons.json`:
```json
{
    "m_Version": 12,
    "DisplayName": "Armas",
    "Icon": "Weapon",
    "Color": "FF5733FF",
    "IsExchange": 0,
    "InitStockPercent": 75.0,
    "Items": [
        {
            "ClassName": "akm",
            "MaxPriceThreshold": 50000,
            "MinPriceThreshold": 25000,
            "SellPricePercent": -1.0,
            "MaxStockThreshold": 10,
            "MinStockThreshold": 1,
            "QuantityPercent": -1,
            "SpawnAttachments": [
                "ak_woodbttstck",
                "ak_woodhndgrd"
            ],
            "Variants": []
        },
        {
            "ClassName": "mag_akm_30rnd",
            "MaxPriceThreshold": 5000,
            "MinPriceThreshold": 2500,
            "SellPricePercent": -1.0,
            "MaxStockThreshold": 50,
            "MinStockThreshold": 10,
            "QuantityPercent": 100,
            "SpawnAttachments": [],
            "Variants": []
        }
    ]
}
```

**Dicas e Boas Práticas:**

1. **Balanceamento de Preços:**
   - Armas básicas: 10,000 - 25,000
   - Armas militares: 25,000 - 75,000
   - Armas raras: 75,000 - 150,000
   - Munição: 500 - 5,000 por magazine
   - Comida: 100 - 1,000
   - Médicos: 500 - 5,000
   - Veículos: 100,000 - 500,000

2. **Balanceamento de Estoque:**
   - Itens comuns: 20-50 estoque
   - Itens raros: 5-10 estoque
   - Itens muito raros: 1-3 estoque
   - Munição: 50-100 estoque

3. **Uso de Variantes:**
   - Use para cores diferentes do mesmo item
   - Item base aparece no menu, variantes em dropdown
   - Variante herda config do base (exceto se tiver entrada própria)

4. **SpawnAttachments:**
   - Útil para vender armas "prontas para uso"
   - Pode incluir magazines, optics, attachments
   - Jogador paga pelo pacote completo

5. **QuantityPercent:**
   - Use `-1` para itens que não têm quantidade
   - Use `50-75` para magazines parcialmente cheios (mais barato)
   - Use `100` para itens completamente cheios

6. **Estoque Estático:**
   - Use `-1` em ambos thresholds para estoque infinito
   - Útil para itens básicos (comida, bandagens)
   - Evita escassez de itens essenciais

7. **Preço Estático:**
   - Use mesmo valor em Min e Max para preço fixo
   - Útil para itens de preço padrão
   - Simplifica economia

8. **InitStockPercent:**
   - `75-100`: Bom para itens comuns
   - `25-50`: Bom para itens raros
   - `0`: Bom para economia player-driven

9. **SellPricePercent:**
   - `-1.0`: Usa configuração da zona (recomendado)
   - `50.0`: Padrão balanceado
   - `25.0`: Trader "avarento"
   - `75.0`: Trader "generoso"

##### 8.4. Configuração de Traders

**Localização:** `profiles/ExpansionMod/Market/Traders/`

⚠️ **Importante:** Traders só funcionam como traders se estiverem dentro do raio de uma traderzone. Veja seção 8.5 TraderZones.

Cada arquivo `.json` representa um trader/NPC.

**Estrutura:**
```json
{
    "m_Version": 5,
    "DisplayName": "Weapon Dealer",
    "MinRequiredReputation": 0,
    "MaxRequiredReputation": 2147483647,
    "TraderIcon": "Weapon",
    "Currencies": [
        "expansionbanknotehryvnia",
        "expansionbanknoteeuro"
    ],
    "Categories": [
        "Weapons:1",
        "Ammo:1",
        "Attachments:3"
    ],
    "Items": {
        "expansioncarkey": 0,
        "engineoil": 2
    }
}
```

**Parâmetros:**

- `m_Version`: Integer
  - Versão do arquivo de configuração (não altere!)
  - Usado internamente para conversão automática de configurações antigas

- `DisplayName`: String
  - Nome do trader exibido no topo do menu de mercado
  - Suporta strings localizadas ou texto direto
  - Exemplos:
    - `"DisplayName": "#STR_EXPANSION_MARKET_TRADER_VEHICLE_PARTS"` (localizado)
    - `"DisplayName": "Vendedor de Armas"` (texto direto)
    - `"DisplayName": "Vehicle Parts"` (texto em inglês)

- `MinRequiredReputation`: Integer (requer Expansion Hardline)
  - Reputação mínima necessária para interagir com este trader
  - Padrão: `0` (sem requisito)
  - Valores negativos: Jogador precisa ter reputação negativa
  - Valores positivos: Jogador precisa ter reputação positiva
  - Exemplo: `1000` = jogador precisa ter pelo menos 1000 de reputação

- `MaxRequiredReputation`: Integer (requer Expansion Hardline)
  - Reputação máxima permitida para interagir com este trader
  - Padrão: `2147483647` (sem limite superior)
  - Útil para criar traders exclusivos para bandidos (reputação baixa)
  - Exemplo: `-1000` = só jogadores com reputação abaixo de -1000 podem usar

- `TraderIcon`: String
  - Ícone do trader exibido no topo do menu de mercado
  - Lista de ícones disponíveis: veja seção "Ícones Disponíveis" abaixo
  - Exemplos: `"Weapon"`, `"Food"`, `"Medical"`, `"Vehicle"`, `"Gas"`

- `Currencies`: Array [String]
  - Classnames das moedas que este trader aceita
  - Moedas devem estar configuradas primeiro no MarketSettings.json
  - Permite traders com moedas diferentes (economia multi-moeda)
  - Exemplo:
```json
"Currencies": [
    "expansionbanknotehryvnia",
    "expansionbanknoteeuro",
    "expansionbanknote1"
]
```
  - Guia de moedas customizadas: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-Setting-up-Custom-Market-Currencies

- `Categories`: Array [String]
  - Nomes de arquivos (sem extensão .json) de categorias do market
  - Categorias devem existir em `ExpansionMod/Market/Categories/`
  - Pode ser usado sozinho ou em combinação com `Items`
  - Suporta modificadores de compra/venda (veja abaixo)
  - Formato: `"NomeCategoria:Valor"`
  - Valores:
    - `:0` = Só pode comprar, não pode vender
    - `:1` = Pode comprar E vender (padrão)
    - `:2` = Só pode vender, não pode comprar
    - `:3` = Não visível mas disponível para customização e attachments
  - Exemplo:
```json
"Categories": [
    "Cars:1",
    "Vehicle_Parts:3",
    "Weapons:0",
    "Scrap:2"
]
```

- `Items`: Map [String, Integer]
  - Lista de itens específicos que o trader pode vender/comprar
  - **Key**: ClassName do item (string em minúsculo)
  - **Value**: Modo de compra/venda (integer)
  - Valores:
    - `0` = Só pode comprar do trader, não pode vender
    - `1` = Pode comprar E vender
    - `2` = Só pode vender ao trader, não pode comprar
    - `3` = Não visível mas disponível como attachment/customização
  - Exemplo:
```json
"Items": {
    "expansioncarkey": 0,
    "engineoil": 2,
    "akm": 1,
    "ak_woodbttstck": 3
}
```

**Ícones Disponíveis:**
- `Weapon`, `Ammo`, `Clothing`, `Food`, `Medical`, `Tools`
- `Vehicle`, `Parts`, `Building`, `Misc`, `Deliver`
- `Gas`, `Helicopter`, `Boat`, `Plane`
- Lista completa: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Market-Settings-Items-&-Categories

**Tipos de Configuração:**

**1. Trader por Categoria (Recomendado):**
```json
{
    "m_Version": 5,
    "DisplayName": "Loja Geral",
    "TraderIcon": "Misc",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [
        "Food:1",
        "Medical:1",
        "Tools:1"
    ],
    "Items": {}
}
```

**2. Trader por Itens Específicos:**
```json
{
    "m_Version": 5,
    "DisplayName": "Black Market",
    "TraderIcon": "Weapon",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [],
    "Items": {
        "akm": 1,
        "m4a1": 1,
        "svd": 1,
        "vss": 0
    }
}
```

**3. Trader Misto (Categorias + Itens):**
```json
{
    "m_Version": 5,
    "DisplayName": "Vendedor de Veículos",
    "TraderIcon": "Vehicle",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [
        "Cars:1",
        "Vehicle_Parts:3"
    ],
    "Items": {
        "expansioncarkey": 0,
        "carradiator": 1,
        "carbattery": 1
    }
}
```

**Exemplos Práticos:**

**Weapon Dealer (Vendedor de Armas):**
```json
{
    "m_Version": 5,
    "DisplayName": "Vendedor de Armas",
    "MinRequiredReputation": 0,
    "MaxRequiredReputation": 2147483647,
    "TraderIcon": "Weapon",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [
        "Weapons:1",
        "Ammo:1",
        "Attachments:3"
    ],
    "Items": {}
}
```

**General Store (Loja Geral):**
```json
{
    "m_Version": 5,
    "DisplayName": "Loja Geral",
    "MinRequiredReputation": 0,
    "MaxRequiredReputation": 2147483647,
    "TraderIcon": "Food",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [
        "Food:1",
        "Medical:1",
        "Tools:1",
        "Clothing:1"
    ],
    "Items": {}
}
```

**Vehicle Dealer (Vendedor de Veículos):**
```json
{
    "m_Version": 5,
    "DisplayName": "Vendedor de Veículos",
    "MinRequiredReputation": 0,
    "MaxRequiredReputation": 2147483647,
    "TraderIcon": "Vehicle",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [
        "Cars:1",
        "Vehicle_Parts:3"
    ],
    "Items": {
        "expansioncarkey": 0
    }
}
```

**Scrap Dealer (Comprador de Sucata):**
```json
{
    "m_Version": 5,
    "DisplayName": "Comprador de Sucata",
    "MinRequiredReputation": 0,
    "MaxRequiredReputation": 2147483647,
    "TraderIcon": "Parts",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [],
    "Items": {
        "metalplate": 2,
        "woodenplank": 2,
        "nails": 2,
        "rope": 2,
        "burlapsack": 2
    }
}
```

**Hero Trader (Trader para Heróis - requer Hardline):**
```json
{
    "m_Version": 5,
    "DisplayName": "Trader dos Heróis",
    "MinRequiredReputation": 5000,
    "MaxRequiredReputation": 2147483647,
    "TraderIcon": "Medical",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [
        "Medical:0",
        "Food:0"
    ],
    "Items": {}
}
```

**Bandit Trader (Trader para Bandidos - requer Hardline):**
```json
{
    "m_Version": 5,
    "DisplayName": "Trader dos Bandidos",
    "MinRequiredReputation": -2147483647,
    "MaxRequiredReputation": -5000,
    "TraderIcon": "Weapon",
    "Currencies": ["expansionbanknotehryvnia"],
    "Categories": [
        "Weapons:0",
        "Explosives:0"
    ],
    "Items": {}
}
```

**Casos de Uso dos Valores 0, 1, 2, 3:**

**Valor 0 (Só Comprar):**
- Itens que jogadores não devem vender de volta
- Exemplos: Chaves de veículos, itens especiais, quest items
```json
"Items": {
    "expansioncarkey": 0,
    "expansionvehiclekey": 0
}
```

**Valor 1 (Comprar e Vender):**
- Itens normais de comércio
- Exemplos: Armas, comida, ferramentas
```json
"Items": {
    "akm": 1,
    "apple": 1,
    "hammer": 1
}
```

**Valor 2 (Só Vender):**
- Itens que trader compra mas não vende
- Útil para "scrap dealers" ou reciclagem
- Exemplos: Sucata, itens danificados
```json
"Items": {
    "metalplate": 2,
    "woodenplank": 2,
    "nails": 2
}
```

**Valor 3 (Oculto/Attachments):**
- Itens não visíveis no menu principal
- Disponíveis apenas como attachments ou customização
- Exemplos: Peças de veículos, attachments de armas
```json
"Categories": [
    "Vehicle_Parts:3"
],
"Items": {
    "ak_woodbttstck": 3,
    "ak_woodhndgrd": 3,
    "pso1optic": 3
}
```

**Dicas e Boas Práticas:**

1. **Especialização**: Crie traders especializados (armas, comida, veículos)
2. **Reputação**: Use requisitos de reputação para traders exclusivos (requer Hardline)
3. **Moedas**: Considere traders com moedas diferentes para economia complexa
4. **Categorias vs Itens**: Use Categories para facilidade, Items para controle preciso
5. **Valor 3**: Use para attachments e peças que não devem aparecer sozinhos
6. **Scrap Dealers**: Crie traders que só compram (valor 2) para economia de reciclagem
7. **Nomes Descritivos**: Use DisplayName claro para jogadores identificarem facilmente
8. **Ícones Apropriados**: Escolha ícone que represente o tipo de trader

**Integração com TraderZones:**

Lembre-se que traders precisam estar dentro de uma TraderZone para funcionar. Configure a zona correspondente em `mpmissions/dayzOffline.<mapname>/expansion/traderzones/`.

**Links Úteis:**
- Setup de Trader Entities/NPCs: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-Setting-up-Trader-Entities-and-NPCs
- Moedas Customizadas: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-Setting-up-Custom-Market-Currencies

##### 8.5. TraderZones (Safezones)

**Localização:** `mpmissions/dayzOffline.<mapname>/expansion/traderzones/`

⚠️ **Importante:** Diferente de outras configurações, TraderZones são específicas por mapa e ficam na pasta da missão.

**Funcionamento:**
- Traders só funcionam como traders se estiverem dentro do raio de uma traderzone
- Zonas são esferas, então a altitude (Y) em Position precisa estar correta
- Cada arquivo `.json` representa uma zona de trader

**Estrutura de Arquivo:**
```json
{
    "m_Version": 13,
    "m_DisplayName": "Green Mountain Trader",
    "Position": [3728.27, 403.0, 6003.60],
    "Radius": 150.0,
    "BuyPricePercent": 100.0,
    "SellPricePercent": -1.0,
    "Stock": {
        "AKM": 5,
        "Mag_AKM_30Rnd": 20,
        "Apple": 0
    }
}
```

**Parâmetros:**

- `m_Version`: Integer
  - Versão do arquivo de configuração (não altere!)
  - Usado internamente para conversão automática de configurações antigas

- `m_DisplayName`: String
  - Nome de exibição da zona de mercado
  - Pode ser qualquer nome desejado
  - Usado para logging e identificação

- `Position`: Vector [X, Y, Z]
  - Posição central da zona no mundo do jogo
  - **X**: Coordenada horizontal (Leste/Oeste)
  - **Y**: Altitude (altura) - **CRÍTICO**: Deve estar correta pois zona é esférica
  - **Z**: Coordenada horizontal (Norte/Sul)
  - Dica: Use DayZeEditor ou coordenadas do mapa para obter posição exata

- `Radius`: Float
  - Define o tamanho da zona de trader no mundo
  - Valor em metros
  - Recomendado: 100-200m para traders normais
  - Zona é esférica (não cilíndrica), então altitude importa

- `BuyPricePercent`: Float
  - Controla o preço de COMPRA para todos itens nesta zona específica
  - Valor padrão: `100.0` (100% do preço calculado)
  - Cálculo: `Preço Final = Preço Base × (BuyPricePercent / 100)`
  - Exemplos:
    - `100.0`: Preço normal
    - `150.0`: 50% mais caro (trader cobra mais)
    - `75.0`: 25% de desconto (trader cobra menos)
    - `200.0`: Dobro do preço
  - Preço base é calculado do estoque, min/max price e thresholds do item

- `SellPricePercent`: Float
  - Controla o preço de VENDA (quando jogador vende para trader) nesta zona
  - Valor padrão: `-1.0` (usa valor global de MarketSettings.json)
  - Se >= 0, sobrescreve o valor global para esta zona
  - Cálculo: `Preço de Venda = Preço de Compra × (SellPricePercent / 100)`
  - Exemplos:
    - `-1.0`: Usa configuração global (padrão)
    - `50.0`: Trader paga 50% do preço de compra
    - `75.0`: Trader paga 75% do preço de compra
    - `25.0`: Trader paga apenas 25% (trader "avarento")

- `Stock`: Map<String, Integer>
  - Mapa de itens disponíveis nesta zona e estoque atual
  - **Key**: ClassName do item (string)
  - **Value**: Quantidade em estoque (integer)
  - Funcionalidade:
    - Define estoque inicial de cada item nesta zona
    - Pode definir estoque individual por item
    - `0`: Trader só começa a vender após jogador vender pelo menos 1 unidade
    - Valor positivo: Estoque inicial disponível
  - ⚠️ **Importante**: Estoque é específico por zona (zonas diferentes = estoques separados)

**Tipos de Marcadores (se usando sistema de mapa):**
- `ExpansionMarkerTrader`: Marcador padrão de trader
- `ExpansionMarkerVehicle`: Marcador de veículos
- `ExpansionMarkerAircraft`: Marcador de aeronaves
- `ExpansionMarkerBoat`: Marcador de barcos

**Exemplos Práticos:**

**Exemplo 1: Trader Geral com Preços Normais**
```json
{
    "m_Version": 13,
    "m_DisplayName": "Green Mountain General Store",
    "Position": [3728.27, 403.0, 6003.60],
    "Radius": 150.0,
    "BuyPricePercent": 100.0,
    "SellPricePercent": -1.0,
    "Stock": {
        "AKM": 5,
        "M4A1": 3,
        "Mag_AKM_30Rnd": 20,
        "Mag_STANAG_30Rnd": 15,
        "Apple": 50,
        "BakedBeansCan": 30,
        "Bandage": 25
    }
}
```

**Exemplo 2: Black Market (Preços Altos, Vende Bem)**
```json
{
    "m_Version": 13,
    "m_DisplayName": "Black Market",
    "Position": [5000.0, 10.0, 8000.0],
    "Radius": 100.0,
    "BuyPricePercent": 200.0,
    "SellPricePercent": 75.0,
    "Stock": {
        "SVD": 1,
        "VSS": 1,
        "ExpansionC4": 2,
        "RGD5Grenade": 5
    }
}
```

**Exemplo 3: Trader de Desconto (Preços Baixos)**
```json
{
    "m_Version": 13,
    "m_DisplayName": "Discount Trader",
    "Position": [7500.0, 5.0, 5500.0],
    "Radius": 120.0,
    "BuyPricePercent": 75.0,
    "SellPricePercent": 40.0,
    "Stock": {
        "TacticalShirt_Grey": 10,
        "CargoPants_Beige": 10,
        "MilitaryBoots_Black": 8,
        "PlateCarrierVest": 5
    }
}
```

**Exemplo 4: Trader com Estoque Zero (Player-Driven)**
```json
{
    "m_Version": 13,
    "m_DisplayName": "Player Market",
    "Position": [4500.0, 15.0, 6500.0],
    "Radius": 100.0,
    "BuyPricePercent": 100.0,
    "SellPricePercent": 60.0,
    "Stock": {
        "AKM": 0,
        "M4A1": 0,
        "SVD": 0,
        "Mag_AKM_30Rnd": 0,
        "Mag_STANAG_30Rnd": 0
    }
}
```
*Neste exemplo, trader só vende itens após jogadores venderem para ele primeiro.*

**Exemplo 5: Vehicle Trader**
```json
{
    "m_Version": 13,
    "m_DisplayName": "Vehicle Dealer",
    "Position": [6000.0, 8.0, 7000.0],
    "Radius": 200.0,
    "BuyPricePercent": 100.0,
    "SellPricePercent": 50.0,
    "Stock": {
        "ExpansionUAZ": 2,
        "ExpansionVodnik": 1,
        "ExpansionBus": 1,
        "ExpansionTractor": 3,
        "CarRadiator": 10,
        "CarBattery": 10,
        "SparkPlug": 15
    }
}
```

**Casos de Uso Avançados:**

**Economia Regional:**
Crie zonas com preços diferentes para simular economia regional:
- Zona militar: Armas caras, comida barata
- Zona rural: Comida cara, ferramentas baratas
- Zona urbana: Preços balanceados

**Estoque Progressivo:**
Configure estoque inicial baixo e deixe economia crescer com vendas de jogadores:
```json
"Stock": {
    "AKM": 1,
    "M4A1": 0,
    "SVD": 0
}
```

**Trader Especializado:**
Crie traders com estoque focado em categoria específica:
```json
"Stock": {
    "Morphine": 10,
    "Epinephrine": 8,
    "Bandage": 30,
    "BloodBagIV": 5,
    "SalineBagIV": 10,
    "Tetracycline": 15
}
```

**Dicas Importantes:**

1. **Altitude Correta**: Sempre verifique a altitude (Y) da posição, pois zona é esférica
2. **Raio Apropriado**: Use raio suficiente para cobrir área de spawn dos NPCs
3. **Estoque Balanceado**: Não coloque estoque muito alto (causa inflação)
4. **Preços Regionais**: Use BuyPricePercent para criar variação econômica
5. **Estoque Zero**: Útil para economia player-driven (jogadores alimentam o mercado)
6. **Logging**: Use m_DisplayName descritivo para facilitar debug nos logs
7. **Múltiplas Zonas**: Estoques são independentes entre zonas

**Cálculos de Preço:**

**Exemplo 1: Trader Normal**
- Preço base do AKM: 50,000
- BuyPricePercent: 100.0
- Preço final: 50,000 × (100/100) = **50,000**

**Exemplo 2: Black Market**
- Preço base do AKM: 50,000
- BuyPricePercent: 200.0
- Preço final: 50,000 × (200/100) = **100,000**

**Exemplo 3: Discount Trader**
- Preço base do AKM: 50,000
- BuyPricePercent: 75.0
- Preço final: 50,000 × (75/100) = **37,500**

**Exemplo 4: Venda ao Trader**
- Preço de compra: 50,000
- SellPricePercent: 50.0
- Jogador recebe: 50,000 × (50/100) = **25,000**

##### 8.6. Adicionando NPCs Traders ao Mapa

Para spawnar NPCs traders no mundo, você precisa criar objetos no mapa.

**Método 1: Via DayZeEditor (Recomendado)**
1. Instale DayZeEditor mod
2. Entre no servidor com admin
3. Abra o editor (tecla configurável)
4. Procure por "ExpansionTrader" + nome do trader
5. Coloque no mapa e salve

**Método 2: Via init.c**

Adicione no arquivo `mpmissions/dayzOffline.chernarusplus/init.c`:

```c
void main()
{
    // ... código existente ...
    
    // Spawn traders
    GetExpansionSettings().GetMarket().SpawnTraders();
}
```

**Método 3: Via mapgrouppos.xml**

Crie arquivo `mpmissions/dayzOffline.chernarusplus/mapgrouppos.xml`:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<map>
    <group name="GreenMountainTraders" pos="3728.27 403.0 6003.60" rpy="0 0 0" a="0">
        <object name="ExpansionTraderNPCMirek" pos="0 0 0" rpy="0 0 0" />
        <object name="ExpansionTraderNPCDenis" pos="5 0 0" rpy="0 90 0" />
        <object name="ExpansionTraderNPCBoris" pos="-5 0 0" rpy="0 -90 0" />
    </group>
</map>
```

##### 8.7. ATMs (Caixas Eletrônicos)

**NPCs ATM Disponíveis:**
- `ExpansionATM`: ATM padrão
- `ExpansionATM_1`: Variante 1
- `ExpansionATM_2`: Variante 2

**Colocando ATMs:**

Mesmo processo dos traders, via editor ou mapgrouppos.xml:

```xml
<group name="GreenMountainATM" pos="3720.0 403.0 6000.0" rpy="0 0 0" a="0">
    <object name="ExpansionATM" pos="0 0 0" rpy="0 0 0" />
</group>
```

##### 8.8. Estoque Estático vs Dinâmico

**Estoque Dinâmico (Padrão):**
- Estoque varia conforme compras/vendas
- Preços flutuam baseado em estoque
- Mais realista e balanceado

**Estoque Estático:**

Para fazer estoque estático, configure no item:

```json
{
    "MaxStockThreshold": -1,
    "MinStockThreshold": -1
}
```

Ou configure todos itens como estáticos em `MarketSettings.json`:

```json
{
    "UseStaticStock": 1
}
```

##### 8.9. Ferramentas Úteis

**Conversores e Editores:**

1. **DayZeEditor** (GUI Tool)
   - Editor visual para market, safezones, AI, basebuilding
   - Link: https://github.com/DayZExpansion/DayZeEditor

2. **CE-Editor** (GUI Tool)
   - Editor para Expansion Market e DrJones Trader
   - Por Henrik Lynge

3. **Types To ExpansionMarket Converter**
   - Converte types.xml para market items
   - Por Ninjin#0487

4. **Classnames To Expansion Market.json**
   - Converte lista de classnames para market
   - Por Buddster124#5168

##### 8.10. Dicas e Boas Práticas

**Balanceamento de Preços:**
- Armas básicas: 10,000 - 25,000
- Armas militares: 25,000 - 75,000
- Armas raras: 75,000 - 150,000
- Munição: 500 - 5,000 por magazine
- Comida: 100 - 1,000
- Médicos: 500 - 5,000
- Veículos: 100,000 - 500,000

**Balanceamento de Estoque:**
- Itens comuns: 20-50 estoque
- Itens raros: 5-10 estoque
- Itens muito raros: 1-3 estoque
- Munição: 50-100 estoque

**Organização:**
- Crie categorias lógicas (Weapons, Ammo, Food, Medical, etc.)
- Separe traders por especialidade
- Use múltiplas zonas de trader no mapa
- Coloque ATMs próximos aos traders

**Safezones:**
- Raio recomendado: 100-200m para traders
- Não coloque muito próximo de áreas militares
- Considere adicionar no BaseBuildingSettings.json como zona de não-construção

**Performance:**
- Não coloque muitos itens em um único trader (máx 200-300)
- Use NetworkBatchSize apropriado (10-20)
- Evite estoque muito alto (causa lag)

**Exemplo de Setup Completo para The LionZ:**

1. Criar categorias: Weapons, Ammo, Clothing, Food, Medical, Tools, Building
2. Criar 3-4 traders especializados
3. Definir 2-3 zonas de trader no mapa
4. Configurar preços balanceados para PvP
5. Usar estoque dinâmico para economia realista
6. Adicionar ATMs nas zonas de trader
7. Proteger zonas com BaseBuildingSettings

**Links Úteis:**
- Wiki Oficial Market: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/The-Market-System
- Configuração de Itens: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Market-Settings-Items-&-Categories
- Configuração de Traders: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Market-Settings-Traders
- Configuração de Zonas: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/Market-Settings-TraderZones
    "ShowDistanceUnderQuickMarkers": 1,
    "ShowNameOnQuickMarkers": 1,
    "CanCreatePartyMarkers": 1,
    "ShowPartyMemberHUD": 1,
    "ShowHUDMemberBlood": 1,
    "ShowHUDMemberStates": 1,
    "ShowHUDMemberStance": 1,
    "ShowPartyMemberMapMarkers": 1,
    "ShowHUDMemberDistance": 1,
    "ForcePartyToHaveTags": 0,
    "InviteCooldown": 5,
    "DisplayPartyTag": 1
}
```

**Exemplo de Configuração Hardcore (Menos Informação):**
```json
{
    "m_Version": 8,
    "EnableParties": 1,
    "MaxMembersInParty": 4,
    "UseWholeMapForInviteList": 0,
    "ShowPartyMember3DMarkers": 1,
    "ShowDistanceUnderPartyMembersMarkers": 0,
    "ShowNameOnPartyMembersMarkers": 1,
    "EnableQuickMarker": 1,
    "ShowDistanceUnderQuickMarkers": 0,
    "ShowNameOnQuickMarkers": 0,
    "CanCreatePartyMarkers": 0,
    "ShowPartyMemberHUD": 1,
    "ShowHUDMemberBlood": 0,
    "ShowHUDMemberStates": 0,
    "ShowHUDMemberStance": 0,
    "ShowPartyMemberMapMarkers": 0,
    "ShowHUDMemberDistance": 0,
    "ForcePartyToHaveTags": 1,
    "InviteCooldown": 10,
    "DisplayPartyTag": 1
}
```

**Dicas de Configuração:**

- **Servidor PvP Casual**: Habilite todos os marcadores e HUD para facilitar coordenação
- **Servidor PvP Hardcore**: Desabilite distâncias e marcadores no mapa para aumentar dificuldade
- **Limite de Membros**: 4-6 para servidores pequenos, 8-10 para servidores grandes
- **UseWholeMapForInviteList**: Mantenha em 0 para forçar encontros presenciais
- **InviteCooldown**: Use 5-10 segundos para evitar spam de convites
- **ForcePartyToHaveTags**: Útil para identificação em eventos e guerras de clãs

**Integração com Outros Sistemas:**

- **BookSettings.json**: `EnablePartyTab` deve estar em 1 para acessar menu de party
- **QuestSettings.json**: `GroupQuestMode` controla como grupos interagem com quests
- **MapSettings.json**: Marcadores de party aparecem no mapa se habilitado

#### 8. SpawnSettings.json

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
