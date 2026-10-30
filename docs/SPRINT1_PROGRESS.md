# CURIE Sprint 1 — registro de progresso

Atualizado em 2026-10-30.

## Estado atual

- Etapa em execucao: fundacao funcional implementada; validacao Android e revisao final pendentes.
- Concluido: SDK Flutter 3.47.9 stable e Dart 3.13.7; projeto `curie_mobile`; tema Material 3; oito telas/fluxos; dados demonstrativos; navegacao; estado de missoes e pontuacao; formulario validado; README; wrapper local do Flutter.
- Ultima verificacao: `flutter analyze` sem problemas; `flutter test` com 4 testes aprovados em 2026-10-30.
- Ultimo commit local: ainda nao criado nesta retomada.
- Problemas conhecidos: instalacao global/config do Flutter tem caminho Android SDK incorreto (`D:\Android\Sdk`); configuracao isolada em `.tools/flutter-config` aponta para SDK existente em `%LOCALAPPDATA%\Android\Sdk`; faltam Android SDK Command-line Tools; status de licencas desconhecido; API 36 e NDK 28.2.13676358 ausentes; AVDs nao tem imagens de sistema; nenhum dispositivo Android conectado. A execucao Android nao foi verificada.
- Remoto GitHub, video e RMs: pendentes de informacao/acao do grupo; nao impedem implementacao local.

## Plano de execucao

| Marco | Estado | Evidencia |
| --- | --- | --- |
| 1. Ambiente Flutter | CONCLUIDO | Flutter 3.47.9 stable, Dart 3.13.7; `doctor -v` executado. |
| 2. Fundacao Flutter | CONCLUIDO | `main.dart`, Material 3, modelo, dados e widgets. |
| 3. Boas-vindas, Home e missoes | CONCLUIDO | Navegacao principal e catalogo. |
| 4. Medicao e estado | CONCLUIDO | `StatefulWidget`, `setState`, pontos e conclusao unica. |
| 5. Formulario | CONCLUIDO | Validadores e feedback de sucesso. |
| 6. Mapa, Marie e conquistas | CONCLUIDO | Conteudo local e progresso integrado. |
| 7. Interface | EM ANDAMENTO | Identidade aplicada; falta inspecao visual em dispositivo. |
| 8. Testes | EM ANDAMENTO | Analyze limpo, 4 testes de widget aprovados; Android bloqueado por SDK. |
| 9. Documentacao | CONCLUIDO | README e este registro. |
| 10. Revisao final | PENDENTE | Auditoria de diff, estado Git, execucao Android e roteiro final. |

## Proxima acao

Verificar o diff e os arquivos ignorados, inicializar Git local, revisar os arquivos staged e criar um commit local autentico com a identidade configurada de Paulo. Depois, continuar com o diagnostico Android e auditoria.

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
3. Para Android, Paulo deve instalar as Command-line Tools e os componentes pedidos pelo Flutter, revisar/aceitar as licencas e instalar uma imagem para o AVD ou conectar um aparelho.
4. Executar `tools/flutter.ps1 devices`, `adb devices` e validar `tools/flutter.ps1 run`.
