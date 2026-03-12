# 🚗 Vehicle Settings - DayZ Expansion Mod

## 📍 Localização do Arquivo
`profiles\ExpansionMod\Settings\VehicleSettings.json`

---

## ⚙️ Configurações Principais

### 🔑 Sistema de Chaves

**`VehicleRequireKeyToStart`** (Integer)
- `0` = Não precisa de chave para ligar o veículo
- `1` = Precisa da chave no inventário do veículo ou do jogador
- `2` = Precisa ter a chave nas mãos para ligar

**`VehicleRequireAllDoors`** (Bool)
- `0` = Pode trancar o veículo mesmo sem todas as portas
- `1` = Precisa de todas as portas para trancar

**`VehicleLockedAllowInventoryAccess`** (Bool)
- `0` = Precisa destrancar para acessar inventário
- `1` = Pode acessar inventário mesmo com veículo trancado

**`MasterKeyPairingMode`** (Integer)
- `-1` = Usos infinitos da chave mestra
- `0` = Desabilitado (pode parear qualquer chave)
- `1` = Usos limitados antes de virar chave normal
- `2` = Renovável com electronicalrepairkit ou keygrinder
- `3` = Renovável apenas com keygrinder

**`MasterKeyUses`** (Integer)
- Quantidade de vezes que a chave mestra pode parear chaves não pareadas

---

### 🔓 Lockpicking (Arrombamento)

**`CanPickLock`** (Bool)
- `0` = Não pode arrombar veículos
- `1` = Permite arrombar veículos

**`PickLockTools`** (Array)
- Lista de itens permitidos para arrombar
- Exemplo: `["Lockpick"]`

**`PickLockChancePercent`** (Integer)
- Porcentagem de chance de sucesso (0-100)

**`PickLockTimeSeconds`** (Integer)
- Tempo em segundos para completar o arrombamento

**`PickLockToolDamagePercent`** (Integer)
- Dano que a ferramenta recebe ao completar ação (0-100%)

---

### 🔧 Troca de Fechadura

**`CanChangeLock`** (Bool)
- `0` = Não pode trocar a fechadura
- `1` = Pode trocar a fechadura do veículo

**`ChangeLockTools`** (Array)
- Lista de ferramentas para trocar fechadura
- Exemplo: `["Screwdriver"]`

**`ChangeLockTimeSeconds`** (Integer)
- Tempo para trocar a fechadura (segundos)

**`ChangeLockToolDamagePercent`** (Float)
- Dano na ferramenta ao executar ação (0-100%)

---

### 🚁 Helicópteros

**`EnableWindAerodynamics`** (Bool)
- `0` = Sem simulação de vento
- `1` = Ativa simulação de vento para helicópteros

**`EnableTailRotorDamage`** (Bool)
- `0` = Rotores não podem ser danificados
- `1` = Rotores podem ser danificados e girar se destruídos

**`EnableHelicopterExplosions`** (Bool)
- `0` = Helicópteros não explodem
- `1` = Helicópteros podem explodir

---

### 🔗 Reboque (Towing)

**`Towing`** (Bool)
- `0` = Reboque desabilitado
- `1` = Carros podem rebocar outros carros; helicópteros podem rebocar qualquer veículo

**Requisitos para Rebocar:**
- Veículo não pode estar trancado
- Veículo não pode já estar rebocando ou sendo rebocado
- Veículo a ser rebocado não pode ter ninguém a bordo

---

### 💥 Dano e Colisões

**`DisableVehicleDamage`** (Bool)
- `0` = Veículos podem receber dano
- `1` = Veículos são indestrutíveis (à prova de colisão e balas)

**`VehicleCrewDamageMultiplier`** (Float)
- Multiplicador de dano de colisão para tripulação
- `0` = sem dano | `1` = dano vanilla | `>1` = mais forte que vanilla

**`VehicleSpeedDamageMultiplier`** (Float)
- Multiplicador de dano de colisão para velocidade do veículo

**`VehicleRoadKillDamageMultiplier`** (Float)
- Multiplicador de dano para pedestres atropelados

**`CollisionDamageIfEngineOff`** (Bool)
- `0` = Sem dano de colisão com motor desligado
- `1` = Dano de colisão mesmo com motor desligado

**`CollisionDamageMinSpeedKmh`** (Float)
- Velocidade mínima (km/h) para causar dano de colisão

**`RevvingOverMaxRPMRuinsEngineInstantly`** (Bool)
- `0` = Motor não é danificado por RPM alto
- `1` = Passar da barra vermelha do RPM destrói o motor (vanilla)

**`VehicleDropsRuinedDoors`** (Bool)
- `0` = Desabilitado (vanilla)
- `1` = Portas destruídas se soltam e caem do veículo

**`ExplodingVehicleDropsAttachments`** (Bool)
- `0` = Desabilitado (vanilla)
- `1` = Todos os acessórios se soltam e caem ao explodir

---

### ⛽ **COMBUSTÍVEL**

**`FuelConsumptionPercent`** (Float)
- **Controla o consumo de combustível de TODOS os veículos**
- `100.0` = Consumo padrão (vanilla)
- `50.0` = Metade do consumo (veículos gastam menos)
- `200.0` = Dobro do consumo (veículos gastam mais)
- `0.0` = Sem consumo (combustível infinito)

**💡 Exemplo:**
```json
"FuelConsumptionPercent": 75.0
```
*Veículos consumirão 75% do combustível normal (25% de economia)*

---

### 🎯 Motor e Inicialização

**`DamagedEngineStartupChancePercent`** (Float)
- Chance de ligar um motor danificado (50% de vida)
- Gradualmente se aproxima deste valor quando motor não está 100%
- Gradualmente se aproxima de zero quando motor está abaixo de 50%

**`DesyncInvulnerabilityTimeoutSeconds`** (Float)
- Janela de invulnerabilidade durante desync (segundos)

---

### 🎪 Cobertura de Veículos (Camo Net)

**`EnableVehicleCovers`** (Bool)
- `0` = Desabilitado
- `1` = Permite cobrir veículos com camo net (bom para performance)

**`AllowCoveringDEVehicles`** (Bool)
- Permite cobrir veículos spawned por eventos dinâmicos (events.xml)
- **Nota:** Configure nominal e min para zero no events.xml antes de ativar

**`CanCoverWithCargo`** (Bool)
- `0` = Precisa esvaziar inventário antes de cobrir
- `1` = Pode cobrir com itens no inventário

**`UseVirtualStorageForCoverCargo`** (Bool)
- `0` = Itens ficam no veículo coberto
- `1` = Itens vão para armazenamento virtual (melhor performance)

**`VehicleAutoCoverTimeSeconds`** (Float)
- Tempo em segundos até veículo sem motor ligado e sem passageiros ser coberto automaticamente
- `0.0` = Desabilitado

**`VehicleAutoCoverRequireCamonet`** (Bool)
- `0` = Não precisa de camo net para auto-cover
- `1` = Requer camo net anexada para auto-cover

**`EnableAutoCoveringDEVehicles`** (Bool)
- Permite auto-cover em veículos de eventos dinâmicos

---

### 🔄 Reconexão

**`PlacePlayerOnGroundOnReconnectInVehicle`** (Integer)
- `0` = Desabilitado
- `1` = Sempre coloca jogador no chão ao reconectar
- `2` = Apenas em reinícios de servidor

---

### 👥 Player Attachment (Ficar em pé no veículo)

**`VehiclesConfig`** → **`CanPlayerAttach`** (Bool)
- `0` = Jogadores não podem se anexar ao veículo em movimento
- `1` = Jogadores podem ficar em pé no veículo em movimento

---

### 🔐 Complexidade de Fechadura

**`VehiclesConfig`** → **`LockComplexity`** (Float)
- Afeta a chance de lockpick (valor maior = chance menor)
- Exemplo: `1.0` = fácil | `3.0` = difícil | `100.0` = quase impossível

---

## 📋 Exemplo de Configuração de Veículo

```json
{
    "ClassName": "ExpansionUAZ",
    "CanPlayerAttach": 0,
    "LockComplexity": 1.0
}
```

---

## 🎥 Vídeos Tutoriais

- **Car Keys:** https://www.youtube.com/watch?v=2e_Afz2NIiU
- **Towing:** https://www.youtube.com/watch?v=wkWsDXuGnMU

---

## 🦁 Dicas para The LionZ Server

### Configuração Recomendada para Hardcore:
```json
"FuelConsumptionPercent": 150.0,
"VehicleCrewDamageMultiplier": 1.5,
"VehicleSpeedDamageMultiplier": 1.2,
"DamagedEngineStartupChancePercent": 30.0,
"CanPickLock": 1,
"PickLockChancePercent": 25.0
```

### Configuração Mais Casual:
```json
"FuelConsumptionPercent": 50.0,
"VehicleCrewDamageMultiplier": 0.5,
"DisableVehicleDamage": 0,
"DamagedEngineStartupChancePercent": 100.0
```

---

**Versão do Documento:** 1.0  
**Última Atualização:** 2025  
**Compatível com:** DayZ Expansion Mod
