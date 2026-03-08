# 🛒 Agent Market - Sistema de Mercado DayZ Expansion

## 📋 Visão Geral

Este documento contém instruções para configuração do sistema de Market do DayZ Expansion Mod. O arquivo principal de configuração é o `MarketSettings.json` localizado em `mpmission\dayzOffline.<mapname>\expansion\settings`.

---

## ⚙️ Configurações Principais

### `m_Version`
- **Tipo:** Integer
- **Descrição:** Versão atual das configurações. NUNCA altere este valor manualmente.

### `MarketSystemEnabled`
- **Tipo:** Boolean
- **Valores:**
  - `0` = Desabilita o sistema de Market
  - `1` = Habilita o sistema de Market

---

## 🚗 Configurações de Veículos

### `MaxVehicleDistanceToTrader`
Distância máxima de veículos normais (carros/helis/barcos) para aparecerem como vendáveis no trader e distância máxima da zona de spawn.

### `MaxLargeVehicleDistanceToTrader`
Distância máxima de veículos grandes (ex: porta-aviões) para aparecerem como vendáveis e distância máxima da zona de spawn.

### `LargeVehicles`
Array com nomes de classes de veículos que devem usar `MaxLargeVehicleDistanceToTrader` ao invés de `MaxVehicleDistanceToTrader`.

---

## 📍 Posições de Spawn

### `LandSpawnPositions`
Array de posições e orientações para zonas de spawn de veículos terrestres.

**Exemplo:**
```json
{
    "Position": [11903.400390625, 140.0, 12455.099609375],
    "Orientation": [24.0, 0.0, 0.0]
}
```

### `AirSpawnPositions`
Array de posições e orientações para zonas de spawn de veículos aéreos (helicópteros).

### `WaterSpawnPositions`
Array de posições e orientações para zonas de spawn de veículos aquáticos (barcos).

**Nota:** Todas as posições devem estar dentro do raio de `MaxVehicleDistanceToTrader` ou `MaxLargeVehicleDistanceToTrader` de um trader de veículos.

---

## 🎨 Cores do Menu (MarketMenuColors)

Personalize o estilo do menu alterando os valores de cor. Formato aceito:
- Hexadecimal: `RRGGBBAA` ou `RGBA`
- Decimal: `R G B A` (0-255, alpha opcional)

### Principais Configurações de Cor:

- **BaseColorVignette:** Cor de fundo vignette do menu
- **BaseColorHeaders:** Cor dos elementos de cabeçalho
- **BaseColorLabels:** Cor de fundo dos labels
- **BaseColorText:** Cor de todos os textos
- **ColorBuyButton:** Cor do botão de compra
- **ColorSellButton:** Cor do botão de venda
- **ColorMarketIcon:** Cor do ícone principal do trader
- **ColorCategoryButton:** Cor dos botões de categoria ao passar o mouse

🔗 **Ferramenta recomendada:** https://color.adobe.com/de/create/color-wheel

---

## 💰 Sistema de Moeda

### `CurrencyIcon`
- **Tipo:** String
- **Padrão:** `"DayZExpansion/Market/GUI/icons/coinstack2_64x64.edds"`
- **Descrição:** Caminho para o ícone usado como moeda no menu do market.

### `Currencies`
Array de moedas que podem ser armazenadas na conta bancária do jogador via ATM.

**Exemplo:**
```json
"Currencies": [
    "expansiongoldbar",
    "expansiongoldnugget",
    "expansionsilverbar",
    "expansionsilvernugget"
]
```

---

## 🏧 Sistema ATM

### `ATMSystemEnabled`
- **Tipo:** Boolean
- **Valores:**
  - `0` = Desabilita ATM lockers
  - `1` = Habilita ATM lockers

### `MaxDepositMoney`
Quantidade máxima de dinheiro que os jogadores podem depositar no ATM Locker.

### `DefaultDepositMoney`
Dinheiro padrão que o jogador recebe em sua conta ATM ao entrar no servidor pela primeira vez.

### `ATMPlayerTransferEnabled`
- **Tipo:** Boolean
- **Valores:**
  - `0` = Desabilita transferência de dinheiro entre jogadores
  - `1` = Habilita transferência de dinheiro entre jogadores

### `ATMPartyLockerEnabled`
- **Tipo:** Boolean
- **Valores:**
  - `0` = Desabilita conta/depósito de dinheiro do grupo
  - `1` = Habilita conta/depósito de dinheiro do grupo

### `MaxPartyDepositMoney`
Quantidade máxima de dinheiro que pode ser depositada na conta do grupo.

---

## 💵 Preços de Venda

### `SellPricePercent`
- **Tipo:** Float
- **Padrão:** 75% do preço de compra
- **Descrição:** Controla a diferença global do preço de venda de todos os itens do market.

**Nota:** Você pode configurar a porcentagem de preço de venda individualmente para:
- Cada zona de market (ver configurações de zona)
- Itens individuais (ver configurações de categorias e itens)

---

## 🚫 Configurações Internas

### `NetworkCategories`
**NÃO TOQUE NESTA CONFIGURAÇÃO!** É gerada automaticamente e será sobrescrita se alterada.

---

## 📝 Notas Importantes

1. ✅ Sempre faça backup antes de modificar configurações
2. ✅ Respeite o formato JSON ao editar
3. ✅ Posições de spawn devem estar próximas aos traders
4. ✅ Cores podem ser testadas antes de aplicar
5. ⚠️ Nunca altere `m_Version` ou `NetworkCategories`

---

## 📦 Market Categories Settings

### `m_Version`
- **Tipo:** Integer
- **Descrição:** Versão atual das configurações. NUNCA altere este valor manualmente.

### `DisplayName`
- **Tipo:** String
- **Descrição:** Nome de exibição da categoria do market que será usado no menu.

**Exemplos:**
```json
"DisplayName": "#STR_EXPANSION_MARKET_CATEGORY_AMMOBOXES"
"DisplayName": "Ammo Boxes"
```

### `Icon`
- **Tipo:** String
- **Descrição:** Ícone da categoria que será exibido.
- **Lista de ícones:** https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-List-of-default-icon-names

```json
"Icon": "Deliver"
```

### `Color`
- **Tipo:** String
- **Descrição:** Código de cor hexadecimal para esta categoria (sem o #).
- **Ferramenta:** https://www.color-hex.com/

```json
"Color": "FBFCFEFF"
```

### `IsExchange`
- **Tipo:** Boolean
- **Descrição:** Define se esta categoria é usada para moedas.
- **Valores:**
  - `0` = Categoria normal
  - `1` = Categoria de moedas (TODOS os itens serão moedas)

### `InitStockPercent`
- **Tipo:** Float
- **Descrição:** Porcentagem do estoque máximo que cada item será inicializado em cada zona no primeiro start do servidor.

```json
"InitStockPercent": 75.0
```

### `Items` - Array de Itens

Contém todos os itens e informações associadas para controle de preço e estoque.

**Propriedades:**

- **ClassName:** String - Nome da classe do item/objeto
- **MaxPriceThreshold:** Integer - Preço máximo (quando estoque está no mínimo)
- **MinPriceThreshold:** Integer - Preço mínimo (quando estoque está no máximo)
- **SellPricePercent:** Float - Porcentagem do preço para venda. `-1` usa configuração da zona. Precisão limitada a 2-3 dígitos decimais (bfloat16)
- **MaxStockThreshold:** Integer - Estoque máximo do item
- **MinStockThreshold:** Integer - Estoque mínimo do item
- **QuantityPercent:** Integer - De 0 a 100 = porcentagem da quantidade (mag, líquido, munição). `-1` = 100%
- **SpawnAttachments:** Array [String] - Itens que serão anexados por padrão na compra
- **Variants:** Array [String] - Variantes do item (cores, modelos) exibidas em dropdown

**💡 Dicas:**
- Estoque estático (infinito): `MinStockThreshold` e `MaxStockThreshold` = 1
- Preço estático: `MinPriceThreshold` e `MaxPriceThreshold` = mesmo valor

**Exemplos:**

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

---

## 🧑‍💼 Trader Settings

**Nota:** Traders só funcionam como traders se estiverem dentro do raio de uma traderzone.

### `m_Version`
- **Tipo:** Integer
- **Descrição:** Versão atual das configurações. NUNCA altere este valor manualmente.

### `DisplayName`
- **Tipo:** String
- **Descrição:** Nome do trader exibido no topo do menu do market.

**Exemplos:**
```json
"DisplayName": "#STR_EXPANSION_MARKET_TRADER_VEHICLE_PARTS"
"DisplayName": "Vehicle Parts"
```

### `MinRequiredReputation` (Apenas com Expansion Hardline)
- **Tipo:** Integer
- **Descrição:** Reputação mínima necessária para interagir com este trader.

```json
"MinRequiredReputation": 0
```

### `MaxRequiredReputation` (Apenas com Expansion Hardline)
- **Tipo:** Integer
- **Descrição:** Reputação máxima necessária para interagir com este trader.

```json
"MaxRequiredReputation": 2147483647
```

### `TraderIcon`
- **Tipo:** String
- **Descrição:** Ícone do trader exibido no topo do menu.
- **Lista de ícones:** Ver List of default icon names

```json
"TraderIcon": "Gas"
```

### `Currencies`
- **Tipo:** Array [String]
- **Descrição:** Classnames das moedas que este trader aceita.
- **Guia:** https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-Setting-up-Custom-Market-Currencies

```json
"Currencies": [
    "expansionbanknotehryvnia",
    "expansionbanknoteeuro"
]
```

### `Categories`
- **Tipo:** Array [String]
- **Descrição:** Nomes de arquivos (sem extensão .json) das categorias do market que este trader deve mostrar.
- **Formato:** `"CategoryFilename:valor"`

**Valores:**
- `0` = Apenas compra (não pode vender)
- `1` = Compra e venda
- `2` = Apenas venda (não pode comprar)
- `3` = Não visível, mas disponível para customização e attachments

**Exemplo:**
```json
"Categories": [
    "Cars:1",
    "Vehicle_Parts:3"
]
```

### `Items`
- **Tipo:** Map [String, Integer]
- **Descrição:** Lista de itens que o trader pode vender/comprar.

**Valores:**
- `0` = Apenas compra (não pode vender)
- `1` = Compra e venda
- `2` = Apenas venda (não pode comprar)
- `3` = Não visível, apenas como attachment

**Exemplo:**
```json
"Items": {
    "expansioncarkey": 0,
    "engineoil": 2
}
```

**Guia de setup:** https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-Setting-up-Trader-Entities-and-NPCs

---

## 🗺️ Market TraderZones Settings

**Localização:** `mpmission\dayzOffline.<mapname>\expansion\traderzones`

**Nota:** Traders só funcionam dentro do raio de uma traderzone. Zonas são esferas, então a altitude da Position precisa estar correta!

### `m_Version`
- **Tipo:** Integer
- **Descrição:** Versão atual das configurações. NUNCA altere este valor manualmente.

### `m_DisplayName`
- **Tipo:** String
- **Descrição:** Nome de exibição da zona do market. Usado para logging.

### `Position`
- **Tipo:** Vector
- **Descrição:** Posição central da zona do market no mundo do jogo.

```json
"Position": [11903.4, 140.0, 12455.1]
```

### `Radius`
- **Tipo:** Float
- **Descrição:** Define o tamanho da zona do trader no mundo do jogo.

```json
"Radius": 50.0
```

### `BuyPricePercent`
- **Tipo:** Float
- **Descrição:** Controla o preço de compra para todos os itens do market nesta zona específica.
- **Padrão:** 100% do preço de compra calculado

```json
"BuyPricePercent": 100.0
```

### `SellPricePercent`
- **Tipo:** Float
- **Descrição:** Controla o preço de venda para todos os itens do market nesta zona específica.
- **Padrão:** `-1.0` (usa valor global do market settings)

```json
"SellPricePercent": -1.0
```

### `Stock`
- **Tipo:** Map<String, Integer>
- **Descrição:** Contém todos os itens que podem ser comprados nesta zona e o estoque atual de cada item.
- **Valor 0:** Traders só começam a vender após jogadores venderem pelo menos um item

**Exemplo:**
```json
"Stock": {
    "akm": 5,
    "ak74": 0,
    "svd": 3
}
```

---

## 💱 Configurando Moedas Customizadas

Se você planeja usar moedas diferentes das barras e pepitas de ouro/prata padrão do Expansion Core, precisa fazer ajustes nas configurações de Exchange e nos arquivos de Trader.

### Exchange/Currency Settings

**Localização:** `YOUR_SERVER_PROFILE_DIRECTORY/ExpansionMod/Market/Exchange.JSON`

Para marcar um arquivo como Exchange (arquivo de moeda), defina `IsExchange` como `1`.

**Exemplo completo:**

```json
{
    "m_Version": 12,
    "DisplayName": "My Custom Currencies",
    "Icon": "Deliver",
    "Color": "FBFCFEFF",
    "IsExchange": 1,
    "InitStockPercent": 75,
    "Items": [
        {
            "ClassName": "Example_moneyeuro_1000",
            "MaxPriceThreshold": 1000,
            "MinPriceThreshold": 1000,
            "SellPricePercent": -1,
            "MaxStockThreshold": 1,
            "MinStockThreshold": 1,
            "SpawnAttachments": [],
            "Variants": []
        },
        {
            "ClassName": "Example_moneyeuro_100",
            "MaxPriceThreshold": 100,
            "MinPriceThreshold": 100,
            "SellPricePercent": -1,
            "MaxStockThreshold": 1,
            "MinStockThreshold": 1,
            "SpawnAttachments": [],
            "Variants": []
        },
        {
            "ClassName": "Example_moneyeuro_10",
            "MaxPriceThreshold": 10,
            "MinPriceThreshold": 10,
            "SellPricePercent": -1,
            "MaxStockThreshold": 1,
            "MinStockThreshold": 1,
            "SpawnAttachments": [],
            "Variants": []
        },
        {
            "ClassName": "Example_moneyeuro_1",
            "MaxPriceThreshold": 1,
            "MinPriceThreshold": 1,
            "SellPricePercent": -1,
            "MaxStockThreshold": 1,
            "MinStockThreshold": 1,
            "SpawnAttachments": [],
            "Variants": []
        }
    ]
}
```

### Regras Importantes para Moedas:

**ClassName:**
- Nome da classe do item de moeda (case insensitive)

**MaxPriceThreshold e MinPriceThreshold:**
- Define o valor do item
- SEMPRE devem ter o mesmo valor

**MaxStockThreshold e MinStockThreshold:**
- DEVEM ser 1, ou a troca de moeda não funcionará corretamente!

### Configurando Moedas nos Traders

Adicione as moedas desejadas ao array `Currencies` de cada trader.

**Localização:** `YOUR_SERVER_PROFILE_DIRECTORY/ExpansionMod/Traders/`

**Exemplo:**
```json
"Currencies": [
    "Example_moneyeuro_1000",
    "Example_moneyeuro_100",
    "Example_moneyeuro_10",
    "Example_moneyeuro_1"
]
```

### Configurando Moedas no ATM

Adicione as moedas desejadas ao array `Currencies` do MarketSettings.

**Localização:** `mpmissions/dayzoffline.mapname/expansion/settings/MarketSettings.json`

**Exemplo:**
```json
"Currencies": [
    "Example_moneyeuro_1000",
    "Example_moneyeuro_100",
    "Example_moneyeuro_10",
    "Example_moneyeuro_1"
]
```

**📚 Mais informações:**
- Trader Settings: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-Trader-Settings
- Market Settings: https://github.com/salutesh/DayZ-Expansion-Scripts/wiki/%5BServer-Hosting%5D-General-Market-Settings

---

**Feito com ❤️ para The LionZ Server** 🦁
