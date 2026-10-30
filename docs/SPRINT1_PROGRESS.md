# CURIE Sprint 1 — registro de progresso

Atualizado em 2026-10-30, após execução Android e revisão final.

## Estado

- Projeto `curie_mobile` na branch local `main`, com histórico preservado e checkpoints incrementais anteriores.
- Flutter 3.47.9 stable e Dart 3.13.7. O SDK Flutter continua em `.tools/flutter` e é ignorado pelo Git.
- Oito telas/fluxos: boas-vindas, Home, catálogo de missões, detalhes, medição simulada, mapa, Marie, conquistas e formulário (detalhes e medição compõem o fluxo das missões).
- Android 16/API 36 instalado e executado no AVD `Curie_API_36`; `adb` e Flutter reconheceram `emulator-5554`. O aplicativo foi instalado, iniciado e interagido.
- Próximos itens externos: gravação/publicação do vídeo pelo integrante designado; confirmação do remoto FIAP antes de conectar e fazer push.

## Android e armazenamento

- O SDK Android existente em `%LOCALAPPDATA%\Android\Sdk` foi preservado. Imagem `system-images;android-36;google_apis;x86_64` e dados do AVD ficam em `D:\Android`; diretório Emulator da imagem ficou em `D:\Android\Sdk\emulator`.
- AVD: `D:\Android\AVDs\Curie_API_36.avd`, acelerado por WHPX. Os dois AVDs anteriores foram preservados.
- Uma junction local liga `%LOCALAPPDATA%\Android\Sdk\system-images\android-36` à imagem em `D:\Android\Sdk\system-images\android-36`, para o AVD Manager encontrar a imagem. Não houve reinstalação do Flutter/Android SDK completo nem movimentação/exclusão de dados anteriores.
- O app abriu no Android. Foram observados: boas-vindas; Home e aviso demonstrativo sem sobreposição; catálogo e detalhes; medição `0.17 µSv/h` marcada como fictícia; retorno ao catálogo; mapa demonstrativo; Marie com resposta local de meia-vida visível; conquistas com pontos/selo; formulário com erros dos campos vazios e confirmação após entrada válida.
- Evidências visuais de sessão foram guardadas fora do repositório em `D:\Android\Temp`. Não foram adicionadas como arquivos versionados.
- Aviso preexistente do SDK Manager: registro de `platform-tools-2` inconsistente. O binário em `platform-tools\adb.exe` funcionou. `adb` pode não estar no PATH; use o caminho do runbook ou o wrapper Flutter.
- A primeira inicialização do novo AVD teve alerta recuperável do System UI; após aguardar, o boot concluiu e o app executou. Não houve falha persistente.

## Auditoria funcional e correções desta revisão

- Inspecionados navegação, passagem de missão selecionada, estado via `StatefulWidget`/`setState()`, pontuação e trava contra duplicação, atualização de conquistas, mapa e fluxo do formulário.
- Reposicionamento do aviso demonstrativo na Home para não ficar coberto pelo botão flutuante.
- Pontuação de conquistas agora usa singular/plural correto.
- Marie agora oculta o teclado e rola automaticamente até uma resposta enviada, mantendo o campo pronto para nova pergunta.
- Textos/acento revisados no formulário e rótulos da navegação.
- Os cinco testes existentes foram ampliados: incluem pontos/conquistas após missões, ausência de pontuação duplicada, validação do formulário, resposta de Marie sem rolagem manual e viewport compacto.

## Verificações finais

Resultados desta rodada:

- `flutter analyze`: **aprovado**, sem problemas.
- `flutter test`: **5 testes aprovados**.
- `flutter build apk --debug`: **aprovado**, APK em `build/app/outputs/flutter-apk/app-debug.apk`.
- Execução Android: **app instalado, aberto e navegado** no Android 16/API 36 (`emulator-5554`).
- `flutter doctor -v`: Flutter/Dart stable; Android toolchain e licenças reconhecidos/aceitos. O aviso de Visual Studio refere-se ao alvo Windows desktop e não é necessário nesta Sprint.
- `flutter doctor -v` também recomenda Flutter/Dart no PATH; isso é intencionalmente local, pois `tools/flutter.ps1` fornece o SDK sem configuração global. O resumo do doctor reporta duas categorias: esse aviso de PATH e Visual Studio desktop ausente; Android passou.
- `flutter pub get`: concluído. Foram informadas cinco dependências com versões mais novas fora das restrições atuais; nenhuma atualização foi necessária para esta Sprint.

## Git e entrega

- Branch atual: `main`; identidade Git: `PhKian <paulohkian@gmail.com>`.
- Histórico anterior preservado. Nenhum repositório foi reinicializado, nenhum autor foi falsificado, remoto não configurado e nenhum push realizado.
- `/.tools/` e `/build/` estão no `.gitignore`; o SDK e o APK não devem entrar no Git.
- Consultar `docs/GITHUB_HANDOFF.md` para conectar ao repositório autorizado pela FIAP, convidar colegas e realizar contribuições/revisão com autoria real.
- Consultar `docs/VIDEO_CHECKLIST.md` para roteiro cronometrado e sequência de gravação até cinco minutos.

## Marcos

| Marco | Situação | Evidência/pendência |
| --- | --- | --- |
| Flutter e projeto base | Concluído | Versões stable confirmadas e projeto existente preservado. |
| Oito telas/fluxos | Concluído | Código inspecionado e fluxos demonstrados em Android. |
| Estado, pontos e missões | Concluído | Cobertura automatizada e fluxo Android observados. |
| Formulário | Concluído | Erros vazios e confirmação válida demonstrados no Android. |
| Build, análise e testes | Concluído | Analyze limpo, cinco testes e APK debug compilado. |
| Execução Android | Concluído | AVD API36 reconhecido por `adb`/Flutter; app aberto. |
| Auditoria e documentação | Concluído | README, auditoria, runbook, tutorial GitHub, vídeo e progresso atualizados. |
| Vídeo e remoto FIAP | Pendente externo | Integrante grava/publica; equipe confirma destino remoto autorizado antes de conectar. |

## Próximos passos

1. O colega designado grava o vídeo seguindo `docs/VIDEO_CHECKLIST.md`, publica conforme as instruções oficiais e informa o link.
2. Confirmar URL/organização de entrega FIAP; só então Paulo configura o remoto e envia `main`, seguindo `docs/GITHUB_HANDOFF.md`.
3. Revisar o vídeo e a entrega final com o grupo e adicionar o link confirmado ao README.
