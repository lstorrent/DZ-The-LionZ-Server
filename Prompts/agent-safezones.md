# Agent - Safe Zones

## Configuração

Arquivo: `mpmissions/dayzOffline.chernarusplus/expansion/settings/SafeZoneSettings.json`

> Diferente da maioria das outras configurações, o SafeZoneSettings.json fica na pasta `mpmission/dayzOffline.<mapname>/expansion/settings`.

---

## Parâmetros

### `m_Version` (Integer)
Contém o número da versão atual da configuração. Nunca altere este valor a menos que saiba o que está fazendo, pois é usado internamente para conversão automática de configurações antigas.

### `Enabled` (Bool)
- `0` = Safezones desativadas.
- `1` = Safezones ativadas (ainda precisam ser configuradas).

### `FrameRateCheckSafeZoneInMs` (Integer)
Frequência (em ms) com que a safezone verifica jogadores, zumbis e veículos. Deixe no padrão `0` (= verifica a cada tick) para melhor responsividade. Granularidade de 25ms.

---

## Tipos de Zonas

### `CircleZones` (Array)
Lista de zonas circulares como safezones.

```json
{
    "Center": [3728.27001953125, 403.0, 6003.60009765625],
    "Radius": 500.0
}
```

- **Center** (Vector): Posição da zona no espaço 3D (X, Y, Z).
- **Radius** (Float): Tamanho da zona em metros.

### `CylinderZones` (Array)
Lista de zonas cilíndricas como safezones.

```json
{
    "Center": [3728.27001953125, 403.0, 6003.60009765625],
    "Radius": 500.0,
    "Height": 120.0
}
```

- **Center** (Vector): Posição da zona no espaço 3D (X, Y, Z).
- **Radius** (Float): Tamanho da zona em metros.
- **Height** (Float): Altura da zona em metros.

### `PolygonZones` (Array)
Lista de zonas poligonais como safezones.

```json
{
    "Positions": [
        [12288.900390625, 142.39999389648438, 12804.400390625],
        [12068.400390625, 139.8000030517578, 12923.400390625],
        [11680.599609375, 141.10000610351563, 12650.599609375],
        [11805.2998046875, 146.3000030517578, 12258.900390625],
        [12327.7001953125, 140.0, 12453.7998046875]
    ]
}
```

- **Positions** (Array of Vectors): Lista de posições no espaço 3D (X, Y, Z).

---

## Configurações Gerais

### `ActorsPerTick` (Integer)
Quantos atores (jogadores, zumbis e veículos combinados) são verificados a cada intervalo (`FrameRateCheckSafeZoneInMs`).

### `DisableVehicleDamageInSafeZone` (Bool)
- `0` = Veículos recebem dano dentro da safezone.
- `1` = Veículos não podem ser danificados dentro da safezone.

### `EnableForceSZCleanup` (Bool)
- `0` = Itens no chão não serão removidos automaticamente na safezone.
- `1` = Itens dropados no chão na safezone serão removidos.

### `ItemLifetimeInSafeZone` (Integer)
Tempo de vida (em segundos) dos itens dropados na safezone, substituindo o lifetime padrão.

### `EnableForceSZCleanupVehicles` (Bool)
- `0` = Veículos não serão removidos da safezone.
- `1` = Veículos serão deletados da safezone quando o lifetime chegar a 0.

### `VehicleLifetimeInSafeZone` (Float)
Tempo (em segundos) que um veículo permanece na safezone antes de ser removido.

### `ForceSZCleanup_ExcludedItems` (Array)
Lista de classnames que não são afetados pelo sistema de limpeza da safezone.

```json
"ForceSZCleanup_ExcludedItems": [
    "ClassName",
    "ClassName"
]
```
