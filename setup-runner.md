# Setup GitHub Self-Hosted Runner

## Passo 1: No GitHub
1. Vá para seu repositório no GitHub
2. Settings → Actions → Runners
3. Clique "New self-hosted runner"
4. Escolha "Windows x64"
5. Copie os comandos gerados

## Passo 2: No seu servidor (onde está o DayZ)
Execute os comandos do GitHub no PowerShell como Administrador:

```powershell
# Exemplo (use os comandos do seu GitHub):
mkdir actions-runner; cd actions-runner
Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-win-x64-2.311.0.zip -OutFile actions-runner-win-x64-2.311.0.zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.311.0.zip", "$PWD")

# Configure (use seu token do GitHub)
./config.cmd --url https://github.com/SEU_USUARIO/DZ-The-LionZ-Server --token SEU_TOKEN

# Instale como serviço
./svc.cmd install
./svc.cmd start
```

## Passo 3: Teste
Faça um commit e veja o deploy automático funcionando!