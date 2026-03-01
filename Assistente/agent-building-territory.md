# 🏗️ Guia de Configuração - Territory & Building System

## 📋 Índice
- [Territory Settings](#territory-settings)
- [Raid Settings](#raid-settings)
- [Base Building Settings](#base-building-settings)

---

## 🏴 Territory Settings

### Configurações Básicas

**`m_Version`** (Integer)
- Versão atual das configurações
- ⚠️ Nunca altere este valor manualmente

**`EnableTerritories`** (Bool)
- `0` = Bandeira de território com funcionalidade vanilla apenas
- `1` = Ativa o sistema de território Expansion

**`UseWholeMapForInviteList`** (Bool)
- `0` = Jogador só pode convidar players próximos para o território
- `1` = Jogador pode convidar qualquer um no mapa para o território

### Dimensões do Território

**`TerritorySize`** (Float)
- Raio do território em metros

**`TerritoryPerimterSize`** (Float)
- Perímetro ao redor do território para prevenir sobreposição
- Se igual ou maior que `TerritorySize`, previne territórios sobrepostos
- ![Diagrama de Perímetro](perimeter sheet)

### Limites

**`MaxMembersInTerritory`** (Integer)
- Máximo de membros permitidos por território
- Se `<= 0`, tamanho ilimitado

**`MaxTerritoryPerPlayer`** (Integer)
- Máximo de territórios permitidos por jogador
- Se `<= 0`, territórios ilimitados

**`TerritoryAuthenticationRadius`** (Float)
- Raio de onde o jogador pode aceitar convite de território

---

## 💣 Raid Settings

### Configurações de Explosivos

**`ExplosionTime`** (Integer)
- Tempo em segundos para ExpansionSatchel explodir

**`ExplosiveDamageWhitelist`** (Array)
- Lista de classnames de explosivos permitidos para raid
- ⚠️ Use o classname da explosão, não do item
- Exemplo: `"Expansion_RPG_Explosion"` para desabilitar RPG

```json
"ExplosiveDamageWhitelist": [
    "classname01_withaCommaAtTheEnd",
    "classname02_withoutCommaAtTheEndBecauseItsTheLastOne"
]
```

**`EnableExplosiveWhitelist`** (Bool)
- `0` = Todos os itens podem raidar elementos de base
- `1` = Apenas itens da whitelist podem raidar

### Multiplicadores de Dano

**`ExplosionDamageMultiplier`** (Float)
- Multiplicador de dano de explosão para partes Expansion
- Padrão: `50`
- Exemplo: Granada (50 dano) × 50 = 2500 dano
- Referência: Paredes têm 30.000 HP
- Valores de dano base:
  - Granada vanilla: 50
  - Foguete Expansion: 300
  - C4: 600

**`ProjectileDamageMultiplier`** (Float)
- Multiplicador de dano de projétil para partes Expansion
- Padrão: `2`
- Exemplo: Bala (65 dano) × 2 = 130 dano
- Referência: Paredes têm 30.000 HP

### Raid de Cofres

**`CanRaidSafes`** (Bool)
- `0` = Cofres Expansion não podem ser destruídos
- `1` = Permite raid de cofres Expansion

**`SafeExplosionDamageMultiplier`** (Float)
- Multiplicador de dano de explosão para cofres
- Referência: Cofres têm 20.000, 15.000 e 10.000 HP

**`SafeProjectileDamageMultiplier`** (Float)
- Multiplicador de dano de projétil para cofres

**`SafeRaidTools`** (Array)
- Lista de ferramentas permitidas para raidar cofres

**`SafeRaidToolTimeSeconds`** (Integer)
- Tempo necessário para raidar cofre com ferramenta

**`SafeRaidToolCycles`** (Integer)
- Número de ciclos necessários para raidar cofre

**`SafeRaidToolDamagePercent`** (Integer)
- Dano total causado à ferramenta (100 = ferramenta arruinada)

### Raid de Arame Farpado

**`BarbedWireRaidTools`** (Array)
- Lista de ferramentas para raidar arame farpado

**`BarbedWireRaidToolTimeSeconds`** (Integer)
- Tempo necessário para raidar arame farpado

**`BarbedWireRaidToolCycles`** (Integer)
- Número de ciclos necessários

**`BarbedWireRaidToolDamagePercent`** (Integer)
- Dano à ferramenta durante o processo

### Raid de Fechaduras

**`CanRaidLocksOnWalls`** (Integer)
- `0` = Não pode raidar codelocks em tendas
- `1` = Fechaduras raidáveis em portas e portões de paredes
- `2` = Fechaduras raidáveis apenas em portas de paredes
- `3` = Fechaduras raidáveis apenas em portões de paredes

**`CanRaidLocksOnFences`** (Bool)
- `0` = Não pode raidar codelocks em cercas
- `1` = Fechaduras raidáveis em cercas

**`CanRaidLocksOnTents`** (Bool)
- `0` = Não pode raidar codelocks em tendas
- `1` = Fechaduras raidáveis em tendas

**`LockRaidTools`** (Array)
- Lista de ferramentas para raidar fechaduras

**`LockOnWallRaidToolTimeSeconds`** (Integer)
- Tempo para raidar fechadura em parede

**`LockOnFenceRaidToolTimeSeconds`** (Integer)
- Tempo para raidar fechadura em cerca

**`LockOnTentRaidToolTimeSeconds`** (Integer)
- Tempo para raidar fechadura em tenda

**`LockRaidToolCycles`** (Integer)
- Número de ciclos necessários

**`LockRaidToolDamagePercent`** (Integer)
- Dano à ferramenta durante o processo

### Modo de Raid de Base

**`BaseBuildingRaidMode`** (Integer)
- `-1` = Elementos Expansion não podem ser raidados
- `0` = Todos os elementos podem ser raidados
- `1` = Apenas portas/portões
- `2` = Apenas portas/portões/janelas

---

## 🏠 Base Building Settings

📍 **Localização:** `mpmissions\dayzOffline.<mapname>\expansion\settings\BaseBuildingSettings.json`

### Restrições de Construção

**`CanBuildAnywhere`** (Bool)
- `0` = Segue limitações vanilla para construção
- `1` = Pode construir em qualquer lugar sem restrições

**`AllowBuildingWithoutATerritory`** (Bool)
- `0` = Forçado a construir/deployar dentro de território
- `1` = Não restrito a construir apenas em território

**`DeployableOutsideATerritory`** (Array)
- Usado apenas se `AllowBuildingWithoutATerritory = 0`
- Lista de classnames deployáveis fora de territórios

```json
"DeployableOutsideATerritory": [
    "classname01_withaCommaAtTheEnd",
    "classname02_withaCommaAtTheEnd",
    "classname03_withoutCommaAtTheEndBecauseItsTheLastOne"
]
```

**`DeployableInsideAEnemyTerritory`** (Array)
- Lista para propósitos de raid
- Classnames deployáveis em território inimigo
- Recomendado: apenas dispositivos de raid ou armadilhas

### Crafting

**`CanCraftVanillaBasebuilding`** (Bool)
- `0` = Não pode craftar kit de cerca e torre de vigia
- `1` = Pode craftar kit de cerca e torre de vigia

**`CanCraftExpansionBasebuilding`** (Bool)
- `0` = Não pode craftar kits Expansion (parede, piso, rampa, escadas)
- `1` = Pode craftar todos os kits Expansion

### Bandeira de Território

**`DestroyFlagOnDismantle`** (Bool)
- `0` = Recebe o kit de volta ao desmontar
- `1` = Não recebe o kit de volta

**`CanCraftTerritoryFlagKit`** (Bool)
- `0` = Não pode craftar bandeira de território
- `1` = Pode craftar (3 gravetos + 1 corda)

**`SimpleTerritory`** (Bool)
- `0` = Precisa construir o mastro como no vanilla
- `1` = Mastro construído automaticamente após deploy

**`AutomaticFlagOnCreation`** (Bool)
- `0` = Precisa adicionar bandeira manualmente
- `1` = Bandeira adicionada automaticamente ao mastro

**`GetTerritoryFlagKitAfterBuild`** (Bool)
- `0` = Não recebe kit de volta após construir
- `1` = Recebe kit de volta após primeiro estágio

### Desmontagem

**`DismantleOutsideTerritory`** (Bool)
- `0` = Não pode desmontar fora do próprio território
- `1` = Pode desmontar tudo exceto em território alheio

**`DismantleInsideTerritory`** (Bool)
- `0` = Não pode desmontar em territórios que não possui
- `1` = Pode desmontar em território de qualquer um

**`DismantleAnywhere`** (Bool)
- `0` = Precisa estar no lado macio do objeto para desmontar
- `1` = Ação de desmontar disponível de qualquer lugar

**`DismantleFlagMode`** (Integer)
- `-1` = Apenas membros podem desmontar com mãos vazias
- `0` = Qualquer um pode desmontar com mãos vazias
- `1` = Qualquer um pode desmontar mas apenas com ferramentas específicas

### Cadeados

**`CodelockActionsAnywhere`** (Bool)
- `0` = Precisa olhar para o cadeado para interagir (vanilla)
- `1` = Pode olhar para parede/porta/portão ou cadeado (mod codelock)

**`CodeLockLength`** (Integer)
- Comprimento das senhas dos cadeados
- Exemplo: `6` = apenas senhas de 6 dígitos

**`DoDamageWhenEnterWrongCodeLock`** (Bool)
- `0` = Senha errada não causa dano
- `1` = Senha errada causa dano definido em `DamageWhenEnterWrongCodeLock`

**`DamageWhenEnterWrongCodeLock`** (Float)
- Dano ao digitar senha errada
- `0` = sem dano, `100` = mata o jogador

**`CodelockAttachMode`** (Integer)
- `0` = Apenas BaseBuilding Expansion
- `1` = BaseBuilding Expansion + Cerca
- `2` = BaseBuilding Expansion + Cerca + Tendas
- `3` = BaseBuilding Expansion + Tendas

### Zonas de Construção

**`BuildZoneRequiredCustomMessage`** (String)
- Mensagem exibida ao tentar construir em zona proibida

**`Zones`** (Array)
- Array de zonas de não-construção

```json
"Zones": [
    {
        "Name": "Airstrip Trader",
        "Center": [6305.0, 26.0, 9521.0],
        "Radius": 4000.0,
        "Items": [],
        "IsWhitelist": 1,
        "CustomMessage": ""
    }
]
```

**`ZonesAreNoBuildZones`** (Bool)
- `0` = Zonas são áreas de construção (só pode construir nelas)
- `1` = Zonas são áreas proibidas (não pode construir nelas)

### Menu de Bandeira

**`FlagMenuMode`** (Integer)
- `0` = Não pode criar território
- `1` = Pode criar território para proteger base
- `2` = Pode criar território mas não customizar bandeira

### Armazenamento Virtual

**`EnableVirtualStorage`** (Bool)
- Itens salvos em armazenamento virtual e removidos do mundo
- Pode melhorar performance do servidor
- ⚠️ Loot com `count_in_cargo="1"` poderá respawnar
- Suporta: barris, caixas de madeira, baú marítimo, cofres Expansion, tendas vanilla

**`VirtualStorageExcludedContainers`** (Array)
- Lista de classnames excluídos do armazenamento virtual

```json
"VirtualStorageExcludedContainers": [
    "classname01_withaCommaAtTheEnd",
    "classname02_withoutCommaAtTheEndBecauseItsTheLastOne"
]
```

---

## 📊 Referências Rápidas

### Valores de HP
- **Paredes Expansion:** 30.000 HP
- **Cofres Expansion:** 20.000 / 15.000 / 10.000 HP

### Valores de Dano Base
- **Granada Vanilla:** 50
- **Foguete Expansion:** 300
- **C4:** 600

### Fórmulas de Dano
- **Dano Explosivo:** `Dano Base × ExplosionDamageMultiplier`
- **Dano Projétil:** `Dano Base × ProjectileDamageMultiplier`

---

**🦁 The LionZ Server - Configurações de Territory & Building**

*Documentação baseada nas configurações oficiais do DayZ Expansion*
