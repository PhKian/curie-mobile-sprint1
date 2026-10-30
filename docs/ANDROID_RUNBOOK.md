# Execução Android — CURIE Sprint 1

## Ambiente validado em 2026-10-30

- Flutter 3.47.9 stable e Dart 3.13.7, instalados em `.tools/flutter` (ignorado pelo Git).
- SDK de desenvolvimento Android existente: `C:\Users\paulo\AppData\Local\Android\Sdk`.
- Android 16 / API 36, imagem `system-images;android-36;google_apis;x86_64`, instalada em `D:\Android\Sdk`.
- AVD `Curie_API_36`, dados em `D:\Android\AVDs\Curie_API_36.avd`; WHPX disponível.
- O emulador foi iniciado, `adb devices -l` listou `emulator-5554` como `device`, `flutter devices` o reconheceu como Android 16/API 36, e o app foi instalado e aberto.
- O app foi navegado no emulador: boas-vindas, Home, missões/detalhes, medição simulada, mapa, Marie, conquistas e validação do formulário.

## Organização dos diretórios

O SDK Android já instalado em C: foi preservado; ferramentas como `adb` continuam sendo usadas dali. A imagem API 36 e o armazenamento do novo AVD foram colocados em D:, que tinha espaço livre suficiente. O Emulator 37.2.13 ficou em `D:\Android\Sdk\emulator` como dependência instalada pelo SDK Manager junto à imagem. Nenhum AVD existente foi movido ou removido.

Foi criada uma junction local para que o AVD Manager (que continua usando o SDK registrado em C:) encontre a imagem mantida em D::

`C:\Users\paulo\AppData\Local\Android\Sdk\system-images\android-36` → `D:\Android\Sdk\system-images\android-36`

As licenças já aceitas foram copiadas para a raiz do SDK em D:. O SDK parcial em D: não contém `platform-tools`; por isso o emulador D é iniciado mantendo `ANDROID_HOME`/`ANDROID_SDK_ROOT` no SDK completo em C:. A mensagem preexistente do SDK Manager sobre `platform-tools-2` permanece sem alteração; `adb.exe` do diretório `platform-tools` foi validado.

## Iniciar e executar

No PowerShell, na pasta do projeto:

```powershell
$sdk = Join-Path $env:LOCALAPPDATA 'Android\Sdk'
$env:ANDROID_HOME = $sdk
$env:ANDROID_SDK_ROOT = $sdk
$env:ANDROID_AVD_HOME = 'D:\Android\AVDs'
& 'D:\Android\Sdk\emulator\emulator.exe' -avd Curie_API_36 -no-snapshot -no-boot-anim -datadir 'D:\Android\AVDs\Curie_API_36.avd'
```

Em outro terminal:

```powershell
$adb = Join-Path $env:LOCALAPPDATA 'Android\Sdk\platform-tools\adb.exe'
& $adb devices -l
.\tools\flutter.ps1 devices
.\tools\flutter.ps1 run --device-id emulator-5554
```

O wrapper `tools/flutter.ps1` é o caminho recomendado para Flutter no PowerShell: prepara configuração local isolada e seleciona o SDK Android. Use a opção longa `--device-id`; `-d` pode ser interpretado pelo PowerShell como alias/parâmetro comum do script. `--no-resident` pode ser acrescentado para instalar, iniciar e devolver o terminal.

## Doctor

`flutter doctor -v` confirmou Flutter/Dart estáveis, Android toolchain e licenças aceitas. O aviso de Visual Studio se refere ao alvo Windows desktop, que não faz parte desta Sprint. Android ficou confirmado após a criação do AVD e execução real do app. Execute novamente `.\tools\flutter.ps1 doctor --verbose` para obter um diagnóstico atualizado.
