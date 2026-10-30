# CURIE Sprint 1 - registro de progresso

Atualizado em 2026-10-30.

## Estado atual

- Etapa em execucao: fundacao funcional implementada; validacao Android e revisao final pendentes.
- Concluido: SDK Flutter 3.47.9 stable e Dart 3.13.7; projeto `curie_mobile`; tema Material 3; oito telas/fluxos; dados demonstrativos; navegacao; estado de missoes e pontuacao; formulario validado; README; wrapper local do Flutter.
- Ultima verificacao: `flutter analyze` limpo; `flutter test` com 4 testes aprovados; `flutter build apk --debug` compilou APK em 2026-10-30.
- Commits locais: `0a6ac38` prototipo funcional; `55b989c` registro inicial; `b685a8e` ajuste da busca Marie. Autor verificado: PhKian <paulohkian@gmail.com>.
- Problemas conhecidos: instalacao global/config do Flutter tem caminho Android SDK incorreto (`D:\Android\Sdk`); configuracao isolada em `.tools/flutter-config` aponta para SDK existente em `%LOCALAPPDATA%\Android\Sdk`; Command-line Tools oficiais instaladas e validadas por SHA-256; `flutter doctor --android-licenses` informa 7 de 8 licencas pendentes, sem aceite automatico; Gradle instalou API 36, NDK 28.2.13676358 e CMake para compilar; AVDs nao tem imagens de sistema; `adb devices` vazio. APK debug compilado, execucao Android pendente. SDK Manager reporta `platform-tools` na pasta inconsistente `platform-tools-2`.
- Remoto GitHub, video e RMs: pendentes de informacao/acao do grupo; nao impedem implementacao local.

## Plano de execucao

| Marco | Estado | Evidencia |
| --- | --- | --- |
| 1. Ambiente Flutter | EM ANDAMENTO | Flutter e Dart funcionais; configuracao Android incompleta. |
| 2. Fundacao Flutter | CONCLUIDO | `main.dart`, Material 3, modelo, dados e widgets. |
| 3. Boas-vindas, Home e missoes | CONCLUIDO | Navegacao principal e catalogo. |
| 4. Medicao e estado | CONCLUIDO | `StatefulWidget`, `setState`, pontos e conclusao unica. |
| 5. Formulario | CONCLUIDO | Validadores e feedback de sucesso. |
| 6. Mapa, Marie e conquistas | CONCLUIDO | Conteudo local e progresso integrado. |
| 7. Interface | EM ANDAMENTO | Identidade aplicada; falta inspecao visual em dispositivo. |
| 8. Testes | CONCLUIDO | Analyze limpo, 4 testes aprovados e APK debug compilado; execucao em Android pendente. |
| 9. Documentacao | CONCLUIDO | README e este registro. |
| 10. Revisao final | PENDENTE | Auditoria de diff, estado Git, execucao Android e roteiro final. |

## Proxima acao

Continuar com o diagnostico Android e auditoria; o commit inicial local ja foi criado e a validacao Android segue pendente.

## Decisoes tecnicas

- Flutter fica em `.tools/flutter` por conveniencia local; o diretorio `.tools/` inteiro esta excluido pelo `.gitignore`.
- `tools/flutter.ps1` aponta o Flutter para configuracao isolada em `.tools/flutter-config` e para o Android SDK instalado; nao altera configuracoes globais.
- A Sprint usa dados locais ficticios, sem integracoes externas ou persistencia.
- `CurieShell` mantem pontuacao em estado local e usa `IndexedStack` para as abas.
- A conclusao de uma missao e idempotente na sessao: cada id pontua uma vez.
- Nao aceitar licencas Android em nome do usuario. O aceite deve ser feito por Paulo apos revisar os termos.
- Nenhum remoto foi criado e nenhum push executado.

## Retomada

1. Ler este arquivo e conferir `git status`.
2. Usar `tools/flutter.ps1 doctor -v`, `tools/flutter.ps1 analyze` e `tools/flutter.ps1 test`.
3. Para Android, Paulo deve revisar e aceitar as 7 licencas pendentes usando `tools/flutter.ps1 doctor --android-licenses`; depois instalar a imagem `system-images;android-37.2;google_apis_playstore_ps16k;x86_64` para o AVD existente `Medium_Phone` ou conectar um dispositivo. Corrigir/revisar o local duplicado de platform-tools se `doctor` continuar alertando.
4. Executar `tools/flutter.ps1 devices`, `adb devices` e validar `tools/flutter.ps1 run`.
