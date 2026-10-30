# CURIE — Mobile Application Development, Sprint 1

Aplicativo educacional da turma 2TDSPB para o FIAP Challenge 2026, no contexto CTMSP / Marinha do Brasil. O CURIE aproxima estudantes do ensino medio da ciencia nuclear por atividades interativas.

## Integrantes

- Matheus Carneiro Maciel — RM a informar.
- Murilo Marques — RM a informar.
- Paulo Henrique da Silva Kian — RM a informar.

O desenvolvimento principal do aplicativo e centralizado em Paulo. Video demonstrativo: link a adicionar apos publicacao pelo integrante responsavel.

## Funcionalidades da versao atual

- Boas-vindas e identidade CURIE em Material 3.
- Home com pontuacao e progresso.
- Catalogo de tres missoes educativas.
- Medicao local simulada, explicitamente identificada como ficticia.
- Mapa ilustrativo com registros e valores demonstrativos.
- Marie com respostas locais predefinidas, sem IA generativa.
- Conquistas atualizadas conforme as missoes concluidas.
- Formulario de observacao com validacao e feedback.
- Pontuacao em memoria, com protecao contra conclusao duplicada.

Todos os dados sao demonstrativos. A Sprint 1 nao integra ESP32, sensor Geiger-Mueller, NFC, backend, banco de dados, nuvem nem IA generativa. O progresso local nao persiste ao fechar o aplicativo.

## Tecnologias e estrutura

- Flutter 3.47.9 stable / Dart 3.13.7.
- Material 3, widgets nativos e `setState()`.
- `lib/screens/`: telas e fluxos.
- `lib/models/`: modelo de missao.
- `lib/data/`: conteudo simulado e respostas da Marie.
- `lib/widgets/`: componentes reutilizaveis.
- `test/`: testes de widgets para navegacao, missao, formulario, mapa e Marie.
- `android/`: configuracao Android.

## Preparar e executar

O SDK Flutter local fica em `.tools/flutter` e e ignorado pelo Git. O script `tools/flutter.ps1` usa uma configuracao local isolada, sem modificar as preferencias globais do Flutter. No PowerShell:

```powershell
.\tools\flutter.ps1 pub get
.\tools\flutter.ps1 analyze
.\tools\flutter.ps1 test
.\tools\flutter.ps1 run
```

Este computador ainda precisa de Android SDK Command-line Tools, verificacao/aceite das licencas pelo usuario, plataforma Android 36, NDK 28.2.13676358 e uma imagem de sistema valida para o emulador. `flutter doctor -v` identificou o SDK existente, mas apontou essas pendencias. `adb devices` nao mostrou dispositivo conectado. Ainda nao foi possivel validar compilacao ou execucao Android.

## Video

Roteiro sugerido para gravacao de ate cinco minutos: apresentar o objetivo do CURIE; abrir no Android; navegar pela Home, missoes, medicao simulada, mapa, Marie e conquistas; concluir uma missao e mostrar os pontos atualizados; enviar formulario invalido e depois valido; encerrar reforcando que leituras e respostas sao demonstrativas. Link do YouTube nao listado: pendente.
