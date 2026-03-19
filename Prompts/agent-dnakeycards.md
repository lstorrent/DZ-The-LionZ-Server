# DNA Keycards - Documentação do Mod

## Conteúdo do Mod

### Strongroom
Salas com uma grande porta de cofre que requer um keycard do tier correspondente para abrir. Atrás da porta há um espaço vazio; ao usar o cartão, um crate de loot spawna automaticamente antes do cofre abrir.

### Keycard Crates
Crates (`DNA_Crate_*tier`) que requerem um keycard do tier correspondente para abrir. Sem loot até o cartão ser usado. Ao usar, o crate abre lentamente revelando o conteúdo.

### Wooden Crates
Crates (`DNA_WoodCrate_*tier`) que requerem uma chave básica (dimple key) para abrir. Compartilham configs de loot e timer com Keycard Crates, mas precisam ser spawnados manualmente.

### Smol Crates
Crates menores (`DNA_Crate_Smol_*tier`) que NÃO requerem keycard para abrir. Sem loot até serem abertos.

### Smol Wooden Crates
Crates menores (`DNA_WoodCrate_Smol_*tier`) que NÃO requerem keycard. Compartilham configs de loot e timer com Smol Crates, mas precisam ser spawnados manualmente.

### Steel Lockouts
Portas de aço que bloqueiam entrada a uma área. Requerem chave básica (dimple key) para entrar.

### Lockouts
Portas básicas para bloquear entrada a áreas. Variantes com e sem keycard. Uma vez destrancada, funciona como qualquer porta normal.

### One Way Doors
Portas de sentido único. Não abrem fisicamente - teleportam o jogador para o outro lado. Variantes com e sem keycard.

### Warp Doors
Portas de fast travel. Existem variantes A e B de cada tier. Teleportam para a porta pareada. Ao destrancar uma, a pareada também destranca. **IMPORTANTE: Colocar apenas 1 par (A+B) de cada tier!** Variantes keyed e non-keyed podem ser usadas juntas sem interferência.

### Keycards
- Todos exceto Orange são multi-uso (configurável no main config)
- Orange é uso único e não tem variante Inactive
- Spawnar variantes Inactive ou cards para uso correto

### Keys (Dimple Keys)
Todas são uso único e permanecem no crate/porta onde foram usadas.

### Workbench
- **Workbench Kit**: Usado para colocar holograma para montagem. Requer Soldering Kit e Helping Hands Kit
- **Workbench**: Espaço para re-chip e programar keycards mortos. Requer vários itens para craft
- **DNA_Workbench_Perm**: Versão estática para editor, precisa ser spawnada a cada restart (não salva no database)
- **40V Battery**: Alimenta o workbench
- **Soldering Kit / Helping Hands Kit**: Componentes de craft do workbench kit
- **Laptop / Card Reader / Bolts**: Componentes de craft do workbench

### Walls
Paredes variadas para encaixar em prédios ou montar estruturas customizadas. A maioria são frames para portas. Algumas bloqueiam portas, janelas e escotilhas.

---

## Arquivos de Configuração

### Main Config
**Caminho:** `DNA_Keycards/System/Main/KeyCard_Main_System_Config.json`

#### Opções de Spawn (Crates e Strongrooms)
- `(0)` Use DNA To Spawn Crates: `0` = off, `1` = random, `2` = static
- `(1)` Use DNA To Spawn Strongrooms: `0` = off, `1` = random, `2` = static
- `(2-6)` Spawn Count por tier (Yellow, Green, Blue, Purple, Red) para Crates
- `(7-11)` Spawn Count por tier para Strongrooms

#### Card Usage Allotment
- `(12-16)` Quantas vezes cada tier de cartão pode ser usado

#### Separação de Loot por Tier
- `(17)` Separate Sidearms by tier (1 = Yes, 0 = No)
- `(18)` Separate Food and Drink by tier
- `(19)` Separate Tools by tier
- `(20)` Separate Meds by tier
- `(21)` Separate Materials by tier
- `(22)` Separate Miscellaneous by tier

> Quando `0`, todos os itens da categoria podem spawnar em qualquer tier. Quando `1`, só spawnam no tier designado. Não se aplica a Smol Crates.

#### Mob Spawns em Strongrooms (por tier)
Mobs só spawnam em **Strongrooms**. Cada tier tem 3 opções:

| Tier | Wolves | Bears | Infected |
|------|--------|-------|----------|
| Yellow | (23) max 10 | (24) max 6 | (25) max 40 |
| Green | (28) max 10 | (29) max 6 | (30) max 40 |
| Blue | (33) max 10 | (34) max 6 | (35) max 40 |
| Purple | (38) max 10 | (39) max 6 | (40) max 40 |
| Red | (43) max 10 | (44) max 6 | (45) max 40 |

`0` = desligado para todos.

#### Alarme e Notificação em Strongrooms (por tier)
Cada tier tem alarm toggle e notification range:

| Tier | Alarm Toggle | Notification Range |
|------|-------------|-------------------|
| Yellow | (26) | (27) |
| Green | (31) | (32) |
| Blue | (36) | (37) |
| Purple | (41) | (42) |
| Red | (46) | (47) |

#### Alarme e Notificação em Crates (por tier)
| Tier | Alarm Toggle | Notification Range |
|------|-------------|-------------------|
| Yellow | (48) | (49) |
| Green | (50) | (51) |
| Blue | (52) | (53) |
| Purple | (54) | (55) |
| Red | (56) | (57) |

#### Alarme e Notificação em Lockout Doors (por tier)
| Tier | Alarm Toggle | Notification Range |
|------|-------------|-------------------|
| Yellow | (58) | (59) |
| Green | (60) | (61) |
| Blue | (62) | (63) |
| Purple | (64) | (65) |
| Red | (66) | (67) |

#### Regras de Alarme e Notificação
- Alarm: `0` = OFF, `1` = ON
- Notification Range: `0` = OFF, `10-2000` = range em metros, `2001+` = mapa inteiro
- Jogadores dentro de 10m não recebem notificação (eles já sabem o que está acontecendo)

---

### Mob Config
**Caminho:** `DNA_Keycards/System/Mobs/KeyCard_Mob_System_Config.json`

Define os tipos de mobs que spawnam. Estrutura:

```json
{
    "dna_DefaultMob": "wolf",       // NÃO ALTERAR - tipo padrão
    "dna_MobType": "Animal_CanisLupus_Grey"  // Pode trocar por outro mob (NÃO pode ser AI)
},
{
    "dna_DefaultMob": "infected",
    "dna_MobType": "ZmbM_CitizenASkinny_Brown"  // Pode trocar por outro zombie
},
{
    "dna_DefaultMob": "bear",
    "dna_MobType": "Animal_UrsusArctos"  // Pode trocar por outro mob
}
```

#### Boss Mobs (por tier)
Reservados para mobs adicionais considerados "boss". Também NÃO podem ser AI.

```json
{
    "dna_DefaultMob": "bossYellow",
    "dna_MobType": ""   // Adicionar typename aqui
},
{
    "dna_DefaultMob": "bossGreen",
    "dna_MobType": ""
},
{
    "dna_DefaultMob": "bossBlue",
    "dna_MobType": ""
},
{
    "dna_DefaultMob": "bossPurple",
    "dna_MobType": ""
},
{
    "dna_DefaultMob": "bossRed",
    "dna_MobType": ""
}
```

Para adicionar múltiplos bosses do mesmo tier, repetir a entrada:
```json
{
    "dna_DefaultMob": "bossYellow",
    "dna_MobType": "MobType1"
},
{
    "dna_DefaultMob": "bossYellow",
    "dna_MobType": "MobType2"
}
```

---

### Alarm and Notification Config
**Caminho:** `DNA_Keycards/System/Other/DoorAlarmAndNotifications_Config.json`

Configurações adicionais de alarme/notificação para Lockouts, OneWay Doors e Warp Doors. Cada tipo tem enable (0/1) e range (metros).

```json
{
    "dna_SoundAlarmOrangeLockout": 0,
    "dna_NotificationRangeOrangeLockout": 0,
    "dna_SoundAlarmOrangeOneWay": 0,
    "dna_NotificationRangeOrangeOneWay": 0,
    "dna_SoundAlarmOrangeWarp": 0,
    "dna_NotificationRangeOrangeWarp": 0
    // ... repete para Yellow, Green, Blue, Purple, Red
}
```

---

### Reset Timer Config
**Caminho:** `DNA_Keycards/System/Other/ResetTimer_Config.json`

Controla quando crates/strongrooms/portas resetam após serem abertos. Tempo em **minutos inteiros**. Distância em **metros**.

```json
{
    "dna_UseResetTimer": 1,                          // Master toggle (0 = off, 1 = on)
    "dna_TimeBetweenChecks": 1,                      // Frequência de checagem em minutos
    "dna_Min_Distance_Between_Nearest_Player": 1.0,  // Distância mínima do jogador para resetar

    "dna_ResetCrates": 1,                            // Toggle para crates
    "dna_TimeUntilYellowCrateResets": 1,
    "dna_TimeUntilGreenCrateResets": 1,
    "dna_TimeUntilBlueCrateResets": 1,
    "dna_TimeUntilPurpleCrateResets": 1,
    "dna_TimeUntilRedCrateResets": 1,

    "dna_ResetStrongrooms": 1,
    "dna_TimeUntilYellowSRoomResets": 1,
    "dna_TimeUntilGreenSRoomResets": 1,
    "dna_TimeUntilBlueSRoomResets": 1,
    "dna_TimeUntilPurpleSRoomResets": 1,
    "dna_TimeUntilRedSRoomResets": 1,

    "dna_ResetLockouts": 1,
    "dna_TimeUntilYellowLockoutResets": 1,
    // ... repete por tier

    "dna_ResetOneWayDoors": 1,
    // ... repete por tier (inclui Orange)

    "dna_ResetWarpDoors": 1
    // ... repete por tier (inclui Orange)
}
```

### Smol Crates Timer
**Caminho:** `DNA_Keycards/System/Other/SmolCrates_Config.json`

Só funciona se `dna_UseResetTimer` estiver ativo no ResetTimer_Config.

```json
{
    "dna_ResetSmolCrates": 0,
    "dna_TimeUntilYellowSmolCrateResets": 1,
    "dna_TimeUntilGreenSmolCrateResets": 1,
    "dna_TimeUntilBlueSmolCrateResets": 1,
    "dna_TimeUntilPurpleSmolCrateResets": 1,
    "dna_TimeUntilRedSmolCrateResets": 1
}
```

---

## Placement Config

### Crates e Strongrooms
**Caminho:** `DNA_Keycards/System/Main/KeyCard_Main_System_Config.json`

3 modos de spawn:
- `0` = OFF (colocar manualmente via editor)
- `1` = Random (escolhe X posições aleatórias da lista)
- `2` = Static (spawna em TODAS as posições da lista)

#### Random Placement
1. Setar opção (0) ou (1) para `1`
2. Definir quantidade em (2-6) para crates ou (7-11) para strongrooms
3. Fornecer posições no array de locations correspondente

```json
"m_DNAYellow_Crate_Locations": [
    {
        "dna_Location": "3328.848389 198.472443 13084.715820",
        "dna_Rotation": "49.643105 0.0 0.0"
    }
]
```

**IMPORTANTE:** Ter mais posições do que o número de spawns escolhido.

#### Static Placement
1. Setar opção para `2`
2. Não precisa definir quantidade - spawna TODAS as posições
3. Remover posições `0.0 0.0 0.0` mas manter o array vazio:

```json
"m_DNAYellow_Crate_Locations": [
]
```

**NUNCA** remover o array principal de um tier - causa crash.

### Smol Crates
**Caminho:** `DNA_Keycards/System/Other/SmolCrates_Config.json`

Só spawnam em modo static. Array único para todos os tiers:

```json
{
    "dna_Tier": "Yellow",
    "dna_Location": "13249.240234 4.267279 9916.133789",
    "dna_Rotation": "0.0 0.0 0.0"
}
```

Setar `dna_SpawnSmolCrates` para `1` ou `true` para ativar.

### Outros Assets
Todos os outros assets (walls, doors, etc.) devem ser colocados com um **map editor**.

> **Nota VPP:** Ao usar VPP para colocar objetos, marcar a opção "filter by scope" ou os itens não aparecerão na busca.

---

## Workbench - Como Usar

O workbench é usado para trocar chip e reprogramar keycards. Pode ser craftado por jogadores ou colocado pelo dono do servidor.

### Craft do Workbench Kit
- **Materiais:** 4 Sticks + 1 Metal Wire
- Craftar como qualquer outro kit do jogo

### Colocando o Kit (Holograma)
- Colocar no inventário do kit: **Soldering Kit** + **Helping Hands Kit**
- Usar o kit para posicionar o holograma

### Montando o Workbench
Inserir no holograma:
- 1 Metal Wire
- 16 Bolts
- 5 Metal Sheets
- 13 Planks
- 1 Laptop
- 1 Card Reader

Usar um **Hammer** para montar a mesa.

### Desmontando
- Usar **Hatchet** para desmontar (funciona no holograma ou mesa montada)
- A versão `DNA_Workbench_Perm` **NÃO** pode ser desmontada

### Versão Estática
`DNA_Workbench_Perm` pode ser colocada pelo dono do servidor em locais remotos via editor. Precisa ser spawnada a cada restart.

### Usando o Workbench

**Requisito:** Instalar uma **40V Battery** no compartimento superior esquerdo da mesa.

**Remover chip de um keycard ruim:**
1. Colocar o card no Helping Hands (olhar para ele com o card na mão)
2. Olhar para o Soldering Iron → opção de remover chip

**Instalar novo chip:**
1. Abrir a gaveta superior esquerda do workbench (olhar para ela)
2. Colocar **Solder** e **Flux** dentro da gaveta
3. Colocar o **chip novo** dentro também
4. Olhar para o Soldering Iron → opção de instalar chip

**Programar um card:**
1. Colocar o card Unprogrammed no Card Reader
2. Olhar para o Laptop → opção de programar

---

## Tiers (do mais comum ao mais raro)

| Tier | Cor | Keycard Inactive | Nominal |
|------|-----|-----------------|---------|
| 1 | Yellow | DNA_KeyCard_Yellow_Inactive | 12 |
| 2 | Green | DNA_KeyCard_Green_Inactive | 10 |
| 3 | Blue | DNA_KeyCard_Blue_Inactive | 8 |
| 4 | Purple | DNA_KeyCard_Purple_Inactive | 4 |
| 5 | Red | DNA_KeyCard_Red_Inactive | 2 |
| Especial | Orange | (sem Inactive, uso único) | - |
