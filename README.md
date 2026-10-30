# CURIE — Mobile Application Development, Sprint 1

Aplicativo educacional da turma 2TDSPB para o FIAP Challenge 2026, no contexto CTMSP / Marinha do Brasil. O CURIE aproxima estudantes do ensino médio da ciência nuclear por atividades interativas.

## Integrantes

- Matheus Carneiro Maciel — RM a informar.
- Murilo Marques — RM a informar.
- Paulo Henrique da Silva Kian — RM a informar.

O desenvolvimento principal do aplicativo é centralizado em Paulo. O vídeo demonstrativo será gravado por outro integrante; link a adicionar após a publicação.

## Funcionalidades

- Boas-vindas e identidade CURIE em Material 3.
- Home com pontuação e progresso.
- Catálogo de três missões educativas.
- Medição local simulada, identificada como fictícia.
- Mapa ilustrativo com registros demonstrativos.
- Marie com respostas locais predefinidas, sem IA generativa.
- Conquistas atualizadas conforme as missões concluídas.
- Formulário de observação com validação e feedback.
- Pontuação em memória, com proteção contra conclusão duplicada.

Todos os dados são demonstrativos. Esta Sprint não integra ESP32, sensor Geiger-Müller, NFC, backend, banco de dados, nuvem nem IA generativa. O progresso não persiste ao fechar o aplicativo.

## Tecnologias e estrutura

- Flutter 3.47.9 stable / Dart 3.13.7.
- Material 3, widgets nativos e `setState()`.
- `lib/screens/`: telas e fluxos.
- `lib/models/`: modelo de missão.
- `lib/data/`: conteúdo simulado e respostas da Marie.
- `lib/widgets/`: componentes reutilizáveis.
- `test/`: testes de widgets para boas-vindas, missões, formulário, mapa, Marie e viewport compacto.
- `android/`: configuração Android.

## Preparar e executar

O SDK Flutter local fica em `.tools/flutter` e é ignorado pelo Git. `tools/flutter.ps1` usa configuração local isolada, sem modificar preferências globais do Flutter. No PowerShell:

```powershell
.\tools\flutter.ps1 pub get
.\tools\flutter.ps1 analyze
.\tools\flutter.ps1 test
.\tools\flutter.ps1 run
```

O APK debug compila em `build/app/outputs/flutter-apk/app-debug.apk`. `flutter doctor --verbose` confirmou que as licenças Android estão aceitas, mas ainda não foi possível executar em Android: não há imagem de sistema instalada nem aparelho conectado. A tentativa de instalar a imagem configurada para `Medium_Phone` falhou por espaço insuficiente no disco. O SDK Manager também reporta `platform-tools` em `platform-tools-2`, local inconsistente que requer revisão.

## Vídeo

Consulte [o checklist de gravação](docs/VIDEO_CHECKLIST.md). Link do YouTube não listado: pendente.

## Auditoria e andamento

Consulte [a auditoria dos critérios da Sprint](docs/FIAP_AUDIT.md) e [o registro de progresso](docs/SPRINT1_PROGRESS.md). A pontuação não é estimada como máxima sem evidências da demonstração final.
