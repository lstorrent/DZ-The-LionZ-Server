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

#### 4. Outros Arquivos de Configuração Expansion

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
