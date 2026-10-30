# CURIE — Mobile Application Development, Sprint 1

Aplicativo educacional da turma 2TDSPB para o FIAP Challenge 2026, no contexto CTMSP / Marinha do Brasil. O CURIE aproxima estudantes do ensino médio da ciência nuclear por atividades interativas.

## Integrantes

- Matheus Carneiro Maciel — RM567753.
- Murilo Marques — RM568224.
- Paulo Henrique da Silva Kian — RM563343.

Paulo é o desenvolvedor principal. Matheus e Murilo podem contribuir pontualmente por commits próprios e legítimos. O vídeo será gravado pelo integrante designado; link a adicionar após publicação.

## Funcionalidades

- Boas-vindas e identidade CURIE em Material 3.
- Home com pontuação e progresso.
- Catálogo de três missões educativas e telas de detalhes.
- Medição local simulada, identificada como fictícia.
- Mapa ilustrativo com registros demonstrativos.
- Marie com respostas locais predefinidas, sem IA generativa.
- Conquistas atualizadas conforme missões concluídas.
- Formulário de observação com validação e feedback.
- Pontuação em memória, protegida contra conclusão duplicada da mesma missão.

Todos os dados são demonstrativos. Esta Sprint não integra ESP32, sensor Geiger-Müller, NFC, backend, banco de dados, nuvem ou IA generativa. O progresso não persiste ao fechar o aplicativo.

## Tecnologias e estrutura

- Flutter 3.47.9 stable / Dart 3.13.7.
- Material 3, widgets nativos e `setState()`.
- `lib/screens/`: telas e fluxos.
- `lib/models/`: modelo de missão.
- `lib/data/`: conteúdo simulado e respostas da Marie.
- `lib/widgets/`: componentes reutilizáveis.
- `test/`: cinco testes de widget para boas-vindas, missões/pontos, formulário, mapa, Marie e viewport compacto.
- `android/`: configuração Android.

## Preparar e executar

O SDK Flutter fica em `.tools/flutter`, fora dos arquivos versionados e ignorado pelo Git. `tools/flutter.ps1` utiliza configuração local isolada. No PowerShell, a partir da pasta do projeto:

```powershell
.\tools\flutter.ps1 pub get
.\tools\flutter.ps1 analyze
.\tools\flutter.ps1 test
```

Para iniciar o Android API 36 preparado fora do disco do projeto, siga [o runbook Android](docs/ANDROID_RUNBOOK.md). Ele preserva o Android SDK existente em C: e mantém imagem/AVD em D:. Depois de iniciar o emulador:

```powershell
.\tools\flutter.ps1 devices
.\tools\flutter.ps1 run --device-id emulator-5554
```

Use `--device-id` no wrapper PowerShell. O APK debug é gerado em `build/app/outputs/flutter-apk/app-debug.apk` (diretório ignorado).

## Entrega e auditoria

- [Auditoria dos critérios FIAP](docs/FIAP_AUDIT.md)
- [Registro de progresso e resultados](docs/SPRINT1_PROGRESS.md)
- [Runbook de execução Android](docs/ANDROID_RUNBOOK.md)
- [Tutorial de preparação do GitHub](docs/GITHUB_HANDOFF.md)
- [Roteiro definitivo do vídeo](docs/VIDEO_CHECKLIST.md)

O repositório local contém o histórico incremental na branch `main`; remoto e push dependem da confirmação do destino de entrega autorizado pela FIAP. A pontuação da banca não é estimada sem a publicação e evidências finais exigidas.
