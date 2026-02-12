# 📋 Documentação de Quests - The LionZ Server

> Documentação completa de todas as quests configuradas no servidor DayZ The LionZ

---

## 📑 Índice

- [NPCs do Servidor](#npcs-do-servidor)
- [Quests Principais](#quests-principais)
- [Quests Repetíveis](#quests-repetíveis)
- [Quests Diárias](#quests-diárias)
- [Quests Semanais](#quests-semanais)
- [Conquistas (Achievements)](#conquistas-achievements)
- [Guia de Criação de Quests](#guia-de-criação-de-quests)

---

## 🎭 NPCs do Servidor

| ID | Nome | Tipo | Localização |
|----|------|------|-------------|
| 1 | Peter | Quest Giver | NPC_1 |
| 2 | Steve | Quest Giver | NPC_2 |
| 3 | Quest Board | Quest Giver | NPC_3 |

---

## 🎯 Quests Principais

### Quest 1: "A dirty rat's job"
- **ID:** 1
- **Tipo:** História Principal
- **NPC Inicial:** Peter (ID: 1)
- **NPC Entrega:** Steve (ID: 2)
- **Repetível:** ❌ Não
- **Objetivo:** Entregar uma nota de Peter para Steve
- **Tipo de Objetivo:** DELIVERY (Entrega)
- **Recompensa:** Nenhuma (leva à Quest 2)
- **Quest Seguinte:** Quest 2
- **Descrição:** Peter pede para você levar uma nota para Steve na vila ao noroeste

---

### Quest 2: "A favor for Steve..."
- **ID:** 2
- **Tipo:** História Principal
- **NPC Inicial:** Steve (ID: 2)
- **NPC Entrega:** Steve (ID: 2)
- **Repetível:** ❌ Não
- **Pré-requisito:** Quest 1
- **Objetivos:**
  1. Viajar até local marcado (TRAVEL - Objective_T_2)
  2. Matar 10 infectados civis com martelo (TARGET - Objective_TA_1)
- **Item de Quest:** SledgeHammer (Marreta)
- **Recompensas:**
  - 1x WaterBottle (Garrafa de Água)
  - 1x TunaCan (Lata de Atum)
- **Quest Seguinte:** Quest 3
- **Descrição:** Steve pede para limpar a vila de infectados usando uma marreta

---

### Quest 3: "Peter's package"
- **ID:** 3
- **Tipo:** História Principal
- **NPC Inicial:** Steve (ID: 2)
- **NPC Entrega:** Peter (ID: 1)
- **Repetível:** ❌ Não
- **Pré-requisito:** Quest 2
- **Objetivo:** Entregar pacote de Steve para Peter (DELIVERY)
- **Recompensa:** Escolher 1 mochila:
  - TaloonBag_Blue
  - TaloonBag_Green
  - TaloonBag_Orange
  - TaloonBag_Violet
- **Descrição:** Levar o pacote de Steve de volta para Peter

---

### Quest 14: "Welcome to Hell"
- **ID:** 14
- **Tipo:** Auto-Start (Inicia automaticamente)
- **NPC Entrega:** Peter (ID: 1)
- **Repetível:** ❌ Não
- **Objetivo:** Visitar o acampamento marcado (TRAVEL - Objective_T_3)
- **Recompensa:** Nenhuma
- **Auto-Complete:** ✅ Sim
- **Descrição:** Quest de introdução que guia o jogador até o acampamento

---

## 🔄 Quests Repetíveis

### Quest 5: "Clear Patrol - Bandits"
- **ID:** 5
- **NPC:** Quest Board (ID: 3)
- **Repetível:** ✅ Sim
- **Objetivos:**
  1. Viajar até local (TRAVEL - Objective_T_4)
  2. Eliminar patrulha de bandidos (AIPATROL - Objective_AIP_1)
- **Recompensa:** 500 Hryvnia
- **Cor:** Vermelho (-930200403)

---

### Quest 6: "Clear Village - Bandits"
- **ID:** 6
- **NPC:** Quest Board (ID: 3)
- **Repetível:** ✅ Sim
- **Objetivos:**
  1. Viajar até local (TRAVEL - Objective_T_1)
  2. Eliminar acampamento de bandidos (AICAMP - Objective_AIC_1)
- **Recompensa:** 500 Hryvnia
- **Cor:** Vermelho (-930200403)

---

### Quest 25: "Clear Another Village"
- **ID:** 25
- **NPC:** Quest Board (ID: 3)
- **Repetível:** ✅ Sim
- **Objetivos:**
  1. Viajar até vila (TRAVEL - Objective_T_8)
  2. Eliminar bandidos (AICAMP - Objective_AIC_2)
- **Recompensa:** Escolher 1 pistola:
  - Glock19 + Mag_Glock_15Rnd
  - FNX45 + Mag_FNX45_15Rnd
  - Deagle + Mag_Deagle_9rnd
- **Cor:** Vermelho (-930200403)

---

### Quest 20: "For the Honor"
- **ID:** 20
- **NPC:** Peter (ID: 1)
- **Repetível:** ✅ Sim
- **Objetivo:** Matar infectados (TARGET - Objective_TA_3)
- **Recompensa:** 100 Reputação (sem dinheiro)

---

### Quest 21: "You need the Honor"
- **ID:** 21
- **NPC:** Peter (ID: 1)
- **Repetível:** ✅ Sim
- **Requisito:** 100 Reputação
- **Objetivo:** Matar infectados (TARGET - Objective_TA_3)
- **Recompensa:** 100 Reputação

---

## 📅 Quests Diárias

### Quest 4: "Treasure Hunt - Currency"
- **ID:** 4
- **NPC:** Quest Board (ID: 3)
- **Repetível:** ✅ Sim (Diária)
- **Objetivo:** Encontrar tesouro enterrado (TREASUREHUNT - Objective_TH_1)
- **Item de Quest:** Shovel (Pá)
- **Recompensa:** Definida no objetivo (tesouro)
- **Auto-Complete:** ✅ Sim

---

### Quest 12: "Apple Juice"
- **ID:** 12
- **NPC:** Peter (ID: 1)
- **Repetível:** ✅ Sim (Diária)
- **Objetivo:** Coletar 5 maçãs (COLLECT - Objective_C_1)
- **Recompensa:** 10 Hryvnia

---

## 📆 Quests Semanais

### Quest 7: "Kill - Civilian Infected"
- **ID:** 7
- **NPC:** Quest Board (ID: 3)
- **Repetível:** ✅ Sim (Semanal)
- **Tipo:** Quest de Grupo
- **Objetivo:** Matar 100 infectados civis (TARGET - Objective_TA_2)
- **Recompensa:** 1000 Hryvnia

---

### Quest 17: "In Service of the Yellow King"
- **ID:** 17
- **NPC:** Peter (ID: 1)
- **Repetível:** ✅ Sim (Semanal)
- **Pré-requisito:** Quest 16
- **Objetivo:** Matar alvos específicos (TARGET - Objective_TA_4)
- **Recompensa:** 500 Hryvnia

---

### Quest 18: "The Endless Hunger"
- **ID:** 18
- **NPC:** Peter (ID: 1)
- **Repetível:** ✅ Sim (Semanal)
- **Pré-requisito:** Quest 16
- **Objetivo:** Matar infectados (TARGET - Objective_TA_3)
- **Recompensa:** 100 Hryvnia

---

### Quest 19: "Where Kings Walk"
- **ID:** 19
- **NPC:** Peter (ID: 1)
- **Repetível:** ✅ Sim (Semanal)
- **Pré-requisitos:** Quest 17 E Quest 18
- **Objetivo:** Matar alvos específicos (TARGET - Objective_TA_4)
- **Recompensa:** 500 Hryvnia

---

## 🏆 Conquistas (Achievements)

### Quest 8: "Killed 10 Infected"
- **ID:** 8
- **Tipo:** Conquista Automática
- **Objetivo:** Matar 10 infectados (TARGET - Objective_TA_3)
- **Recompensa:** 100 Hryvnia
- **Auto-Complete:** ✅ Sim
- **Descrição:** Conquista desbloqueada automaticamente ao matar 10 infectados

---

### Quest 9: "Killed 100 civilian Infected"
- **ID:** 9
- **Tipo:** Conquista Automática
- **Objetivo:** Matar 100 infectados civis (TARGET - Objective_TA_2)
- **Recompensa:** 500 Hryvnia
- **Auto-Complete:** ✅ Sim

---

### Quest 11: "Lockpick your first vehicle"
- **ID:** 11
- **Tipo:** Conquista Automática
- **Objetivo:** Arrombar primeiro veículo (ACTION - Objective_A_1)
- **Recompensa:** 500 Hryvnia
- **Auto-Complete:** ✅ Sim

---

## 🎓 Quests de Tutorial/Exemplo

### Quest 13: "Catch a Fish"
- **ID:** 13
- **NPC:** Peter (ID: 1)
- **Repetível:** ❌ Não
- **Objetivos:**
  1. Craftar vara de pesca improvisada (CRAFTING - Objective_CR_1)
  2. Coletar peixe (COLLECT - Objective_C_2)
- **Recompensas:**
  - 10 Hryvnia
  - 1x ImprovisedFishingRod

---

### Quest 15: "Plant a Pumpkin"
- **ID:** 15
- **NPC:** Peter (ID: 1)
- **Repetível:** ❌ Não
- **Objetivo:** Plantar semente de abóbora (ACTION - Objective_A_2)
- **Recompensa:** 500 Hryvnia

---

### Quest 16: "For the Lich... I mean Yellow King!"
- **ID:** 16
- **NPC:** Peter (ID: 1)
- **Repetível:** ❌ Não
- **Objetivo:** Encontrar capacete do Yellow King (COLLECT - Objective_C_3)
- **Recompensa:** 500 Hryvnia

---

## 🔗 Cadeia de Quests (Quest Chain)

### Quest 22-24: Exemplo de Quest Chain

#### Quest 22: "Quest chain example [Part 1]"
- **ID:** 22
- **NPC Inicial:** Peter (ID: 1)
- **Objetivo:** Ir para localização A (TRAVEL - Objective_T_5)
- **Quest Seguinte:** Quest 23
- **Sem NPC de Entrega** (auto-completa e inicia próxima)

#### Quest 23: "Quest chain example [Part 2]"
- **ID:** 23
- **Pré-requisito:** Quest 22
- **Objetivo:** Ir para localização B (TRAVEL - Objective_T_6)
- **Quest Seguinte:** Quest 24
- **Sem NPCs** (pode ser cancelada e reaceitada no log)

#### Quest 24: "Quest chain example [Part 3]"
- **ID:** 24
- **Pré-requisito:** Quest 23
- **NPC Entrega:** Steve (ID: 2)
- **Objetivo:** Ir para localização C (TRAVEL - Objective_T_7)
- **Fim da cadeia**

---

## 🔧 Quests Inativas/Em Desenvolvimento

### Quest 10: "[VIP] Test quest"
- **ID:** 10
- **Status:** PLACEHOLDER
- **Tipo:** VIP/AIESCORT
- **Objetivo:** Escolta de AI (AIVIP - Objective_AIESCORT_1)

---

## 📚 Guia de Criação de Quests

### Tipos de Objetivos

| Tipo | ID | Descrição |
|------|----|-----------| 
| TARGET | 2 | Matar alvos específicos |
| TRAVEL | 3 | Viajar até localização |
| COLLECT | 4 | Coletar itens |
| DELIVERY | 5 | Entregar itens |
| TREASUREHUNT | 6 | Caça ao tesouro |
| AIPATROL | 7 | Eliminar patrulha AI |
| AICAMP | 8 | Eliminar acampamento AI |
| AIVIP | 9 | Escoltar AI |
| ACTION | 10 | Executar ação |
| CRAFTING | 11 | Craftar item |

---

### Tipos de Quests

#### Quest Normal
```json
"Repeatable": 0,
"IsDailyQuest": 0,
"IsWeeklyQuest": 0,
"IsAchievement": 0,
"QuestGiverIDs": [1],
"QuestTurnInIDs": [1]
```

#### Quest Repetível
```json
"Repeatable": 1,
"IsDailyQuest": 0,
"IsWeeklyQuest": 0
```

#### Quest Diária
```json
"Repeatable": 1,
"IsDailyQuest": 1,
"IsWeeklyQuest": 0
```

#### Quest Semanal
```json
"Repeatable": 1,
"IsDailyQuest": 0,
"IsWeeklyQuest": 1
```

#### Conquista (Achievement)
```json
"IsAchievement": 1,
"Autocomplete": 1,
"QuestGiverIDs": [],
"QuestTurnInIDs": []
```

#### Auto-Start Quest
```json
"QuestGiverIDs": [],
"IsAchievement": 0,
"IsGroupQuest": 0,
"PreQuestIDs": []
```

---

### Configuração de Recompensas

#### Recompensa Fixa
```json
"Rewards": [
    {
        "ClassName": "ExpansionBanknoteHryvnia",
        "Amount": 500,
        "Attachments": [],
        "DamagePercent": 0,
        "HealthPercent": 0,
        "QuestID": -1,
        "Chance": 1.0
    }
],
"NeedToSelectReward": 0,
"RandomReward": 0
```

#### Escolha do Jogador
```json
"Rewards": [
    {"ClassName": "Item1", "Amount": 1, ...},
    {"ClassName": "Item2", "Amount": 1, ...},
    {"ClassName": "Item3", "Amount": 1, ...}
],
"NeedToSelectReward": 1
```

#### Recompensa Aleatória
```json
"Rewards": [
    {"ClassName": "Item1", "Amount": 1, "Chance": 0.5, ...},
    {"ClassName": "Item2", "Amount": 1, "Chance": 0.3, ...},
    {"ClassName": "Item3", "Amount": 1, "Chance": 0.2, ...}
],
"RandomReward": 1,
"RandomRewardAmount": 1
```

#### Arma com Acessórios
```json
{
    "ClassName": "M4A1",
    "Amount": 1,
    "Attachments": ["M4_RISHndgrd", "ACOGOptic", "M4_MPBttstck"],
    "DamagePercent": 0,
    "QuestID": -1,
    "Chance": 1.0
}
```

---

### Cadeia de Quests (Quest Chain)

Para criar uma sequência de quests:

1. **Quest Inicial:** Define `"FollowUpQuest": ID_PROXIMA_QUEST`
2. **Quest Intermediária:** 
   - `"PreQuestIDs": [ID_QUEST_ANTERIOR]`
   - `"FollowUpQuest": ID_PROXIMA_QUEST`
   - `"QuestGiverIDs": []` (sem NPC, auto-inicia)
3. **Quest Final:**
   - `"PreQuestIDs": [ID_QUEST_ANTERIOR]`
   - `"FollowUpQuest": -1`

---

### Objetivos Sequenciais vs Paralelos

#### Sequencial (um após o outro)
```json
"SequentialObjectives": 1,
"Objectives": [
    {"ID": 1, "ObjectiveType": 3},  // Primeiro: Viajar
    {"ID": 2, "ObjectiveType": 8}   // Depois: Matar
]
```

#### Paralelo (todos ao mesmo tempo)
```json
"SequentialObjectives": 0,
"Objectives": [
    {"ID": 1, "ObjectiveType": 4},  // Coletar itens
    {"ID": 2, "ObjectiveType": 2}   // Matar alvos
]
```

---

### Cores de Quest

```json
"QuestColor": 0              // Padrão
"QuestColor": -930200403     // Vermelho (combate)
```

---

## 📊 Estatísticas do Servidor

- **Total de Quests:** 25
- **Quests Principais:** 4
- **Quests Repetíveis:** 7
- **Quests Diárias:** 2
- **Quests Semanais:** 4
- **Conquistas:** 3
- **Quests de Tutorial:** 3
- **Quest Chains:** 1 (3 partes)
- **NPCs Ativos:** 3

---

## 🎯 Dicas para Criar Novas Quests

1. **ID Único:** Sempre use um ID que não existe
2. **Descriptions:** Preencha os 3 textos (início, progresso, entrega)
3. **ObjectiveText:** Texto curto e claro do objetivo
4. **Teste os Objectives:** Verifique se os arquivos de objetivos existem
5. **Recompensas Balanceadas:** Considere dificuldade vs recompensa
6. **NPCs:** Confirme que os IDs de NPCs existem
7. **PreQuests:** Use para criar progressão
8. **FollowUpQuest:** Crie histórias conectadas
9. **Active: 1:** Não esqueça de ativar a quest!

---

**Última Atualização:** Quest 25 configurada com escolha de pistolas
**Mantido por:** Lion - The LionZ Server
