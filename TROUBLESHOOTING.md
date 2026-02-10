# 🔧 Guia de Solução - The LionZ Server

## ⚠️ PROBLEMAS IDENTIFICADOS

### 1. Reinício Automático a Cada 4 Horas
**Problema:** O servidor estava configurado para reiniciar automaticamente a cada 4 horas (14400 segundos).
**Solução:** Alterado para 6 horas (21600 segundos) no arquivo `start_server_optimized.bat`

### 2. Falta de Parâmetros de Memória
**Problema:** Servidor sem limite de memória definido, podendo causar crashes.
**Solução:** Adicionado `-maxMem=4096` (4GB) e `-limitFPS=200`

### 3. BattlEye Desabilitado
**Problema:** `-noBE` pode causar instabilidade em alguns casos.
**Solução:** Removido do arquivo otimizado. Se precisar desabilitar, adicione novamente.

### 4. Logs Desabilitados
**Problema:** Logs importantes desabilitados dificultam diagnóstico.
**Solução:** Habilitados logs de veículos, eventos dinâmicos e estatísticas.

### 5. Timeout Muito Curto no Reinício
**Problema:** Apenas 10 segundos entre kill e restart.
**Solução:** Aumentado para 30 segundos para garantir limpeza completa.

## 📝 COMO USAR O ARQUIVO OTIMIZADO

1. **Backup do arquivo atual:**
   ```
   copy start_server_pro.bat start_server_pro.bat.backup
   ```

2. **Use o novo arquivo:**
   ```
   start_server_optimized.bat
   ```

3. **Ou atualize o arquivo atual com as mudanças:**
   - Adicione `-maxMem=4096 -limitFPS=200`
   - Remova `-noBE -noFilePatching` (se não precisar)
   - Mude `timeout 14400` para `timeout 21600`
   - Mude `timeout 10` para `timeout 30`

## 🔍 MONITORAMENTO

### Arquivos de Log para Verificar:
```
D:\SteamLibrary\steamapps\common\DayZServer\profiles\script.log
D:\SteamLibrary\steamapps\common\DayZServer\profiles\DayZServer_x64_*.RPT
D:\SteamLibrary\steamapps\common\DayZServer\profiles\DayZServer_x64_*.ADM
```

### Comandos Úteis:
```batch
REM Ver processos do servidor
tasklist | findstr DayZServer

REM Verificar uso de memória
wmic process where name="DayZServer_x64.exe" get WorkingSetSize

REM Matar processo manualmente
taskkill /im DayZServer_x64.exe /F
```

## ⚙️ CONFIGURAÇÕES ADICIONAIS RECOMENDADAS

### serverDZ.cfg
```
maxPlayers = 10;              // OK para testes
serverTimeAcceleration=12;    // OK
loginQueueConcurrentPlayers=5; // Pode aumentar para 10
storageAutoFix = 1;           // ✅ Correto
```

### Otimizações de Performance:
1. **Reduzir ItemCount nos Airdrops** (atualmente 50, recomendado 30-35)
2. **Reduzir InfectedCount** (atualmente 25-50, recomendado 15-20)
3. **Limpar arquivos .log antigos** regularmente

## 🚨 SINAIS DE PROBLEMAS

### Servidor Crashando:
- Verifique `script.log` para erros
- Verifique arquivos `.RPT` para crashes
- Monitore uso de RAM (não deve passar de 4GB)

### Lag/Desempenho Ruim:
- Reduza `ItemCount` nos airdrops
- Reduza número de infectados
- Verifique se há muitos veículos spawned

### Não Inicia:
- Verifique se todos os mods estão instalados
- Verifique permissões das pastas
- Verifique se a porta 2302 está livre

## 📊 CHECKLIST DE MANUTENÇÃO

- [ ] Verificar logs diariamente
- [ ] Limpar arquivos .log antigos semanalmente
- [ ] Backup da pasta `profiles` semanalmente
- [ ] Atualizar mods mensalmente
- [ ] Verificar uso de disco (logs podem crescer muito)

## 🔗 PRÓXIMOS PASSOS

1. **Teste o servidor com o novo arquivo**
2. **Monitore por 24-48 horas**
3. **Verifique os logs para erros**
4. **Ajuste parâmetros conforme necessário**

## 💡 DICAS EXTRAS

- Use `start /high` para prioridade alta do processo
- Considere usar um script de monitoramento automático
- Configure backup automático da pasta `profiles`
- Documente todas as mudanças feitas

---

**Criado em:** ${new Date().toLocaleDateString('pt-BR')}
**Para:** The LionZ Server
**Por:** Amazon Q
