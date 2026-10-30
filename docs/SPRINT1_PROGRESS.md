# CURIE Sprint 1 — registro de progresso

Atualizado em 2026-10-30.

## Estado atual

- Etapa: revisão técnica, visual em viewport compacto e preparação de entrega local.
- Concluído: Flutter 3.47.9 stable / Dart 3.13.7; base `curie_mobile`; tema Material 3; oito telas/fluxos; navegação; dados demonstrativos; pontuação e missões; formulário validado; wrappers locais; documentação e auditoria FIAP.
- Última validação nesta sessão: `flutter test` passou com 5 testes; `flutter analyze` sem issues; `flutter build apk --debug` compilou com sucesso. APK: `build/app/outputs/flutter-apk/app-debug.apk`.
- `flutter doctor --verbose`: Android toolchain e rede aprovados; todas as licenças Android aceitas; Visual Studio ausente para desktop Windows (não usado nesta Sprint). Flutter/Dart não estão no PATH global; use `tools/flutter.ps1`.
- Git: branch `main`, identidade `PhKian <paulohkian@gmail.com>`, sem remoto. Quatro commits preexistentes preservados; esta rodada gerou checkpoints locais incrementais para código/testes e documentação, ambos com a identidade de Paulo. Nenhum remoto foi configurado.

## Diagnóstico Android

- SDK: `%LOCALAPPDATA%\Android\Sdk`; Platform 36, Build Tools 36.0.0, Emulator 37.2.12, NDK 28.2.13676358 e CMake 3.22.1 disponíveis. Java usado pelo Flutter: JBR do Android Studio, OpenJDK 25.0.3; compilação Gradle foi aprovada. No momento do download, havia 2,21 GiB livres em C: (raiz do SDK) e 604,8 GiB em D:.
- `adb` versão 37.0.1 existe e foi executado pelo caminho completo. `adb devices -l` não listou aparelhos conectados; `flutter devices` encontrou Windows, Chrome e Edge, sem Android.
- Há dois AVDs. `Medium_Phone` aponta para `system-images;android-37.2;google_apis_playstore_ps16k;x86_64`; `Medium_Phone_API_37.0` aponta para `system-images;android-37.0;google_apis_playstore;x86_64`. Nenhum diretório `system-images` está instalado. O catálogo também oferece API 36 Google APIs x86_64 como alternativa estável, mas não foi instalada nem criada configuração nova. A instalação do pacote 37.2 foi tentada pelo SDK Manager oficial e falhou com `Espaço insuficiente no disco`; nada foi removido para contornar isso.
- SDK Manager relata `platform-tools` registrado em `platform-tools-2`, caminho inconsistente. Ambas as cópias de adb foram observadas; nada foi movido ou removido. Comando `adb` não está no PATH do shell, embora o binário esteja instalado; `tools/flutter.ps1` reconhece o SDK pela configuração isolada.
- Primeira invocação sem elevação falhou com `CreateFile failed 5` ao acessar o SDK Flutter fora da raiz gravável. A execução aprovada para diagnóstico/validação funcionou. Invocar diretamente `flutter.bat` sem as variáveis do wrapper não encontra o Android SDK; usar o wrapper, que aponta para a configuração isolada.

## Plano e marcos

| Marco | Estado | Evidência/pendência |
| --- | --- | --- |
| 1. Ambiente Flutter | CONCLUÍDO | SDK funcional, estável; doctor e versões verificados. |
| 2. Fundação Flutter | CONCLUÍDO | `main.dart`, tema, modelos, dados e componentes. |
| 3. Boas-vindas, Home e missões | CONCLUÍDO | Fluxo presente e testado. |
| 4. Medição e estado | CONCLUÍDO | Estado local, pontuação e proteção contra duplicação testados. |
| 5. Formulário | CONCLUÍDO | Validação e confirmação testadas. |
| 6. Mapa, Marie e conquistas | CONCLUÍDO | Conteúdo local; abas cobertas por teste. |
| 7. Interface | EM ANDAMENTO | Overflow de chips em tela compacta corrigido com `Wrap`; teste a 360×640 passa. Inspeção em aparelho ainda pendente. |
| 8. Testes e build | CONCLUÍDO | Analyze limpo, cinco testes aprovados, APK debug compilado. |
| 9. Documentação | CONCLUÍDO | README, auditoria FIAP, checklist de vídeo e progresso. |
| 10. Android real e revisão final | BLOQUEADO | Precisa de system image/dispositivo; sem execução nem capturas reais. |

## Próxima ação

Liberar espaço no volume do Android SDK e instalar a imagem oficial do AVD `Medium_Phone`: `system-images;android-37.2;google_apis_playstore_ps16k;x86_64`. Depois, iniciar o emulador, confirmar com `adb devices` e `flutter devices`, executar `tools/flutter.ps1 run` e inspecionar as oito telas. Alternativa sem download: conectar dispositivo Android com depuração USB habilitada. Não há operação de licença pendente.

## Decisões técnicas

- Manter Flutter em `.tools/flutter`, fora do código-fonte efetivamente versionado; `/.tools/` inteiro é ignorado. Não mover o SDK sem necessidade.
- `tools/flutter.ps1` usa configuração isolada em `.tools/flutter-config` e aponta para o SDK Android existente, sem alterar a configuração global Flutter.
- Usar somente dados educativos demonstrativos nesta Sprint, sem sensores, backend, persistência ou IA generativa.
- Estado da missão é mantido em memória; concluir a mesma missão não soma pontos de novo na sessão.
- Nenhuma configuração ou arquivo do SDK Android foi alterado nesta sessão; não aceitar licença em nome do usuário.
- Nenhum remoto foi criado e nenhum push foi feito.

## Retomada

1. Ler este registro e confirmar `git status --short --branch`.
2. Executar `tools/flutter.ps1 doctor --verbose`, `tools/flutter.ps1 analyze` e `tools/flutter.ps1 test`.
3. Instalar a imagem Android indicada para o AVD existente (ou conectar aparelho), iniciar o app e registrar evidências reais.
4. Revisar `docs/FIAP_AUDIT.md` após a verificação Android; atualizar o link do vídeo somente quando fornecido pelo grupo.
