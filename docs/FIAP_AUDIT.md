# Auditoria de requisitos — FIAP Sprint 1

Auditoria baseada no código, testes automatizados e execução manual real no emulador Android API 36 em 2026-10-30. Não atribui nota; a avaliação final depende dos critérios oficiais, da gravação e do material de entrega.

| Critério | Implementação e localização | Verificação/evidência | Pendências e risco |
| --- | --- | --- | --- |
| Navegação — 25 | Boas-vindas, Home, Missões, detalhes/medição, Mapa, Marie, Conquistas e formulário em `lib/screens/`; navegação central em `lib/main.dart`. | `flutter test` cobre navegação, telas principais e viewport compacto. No Android 16/API 36, abriu-se o app e percorreram-se as telas e retornos. | Colega responsável deve gravar a demonstração final. |
| Protótipo visual — 30 | Tema Material 3, componentes comuns em `lib/widgets/curie_components.dart`, telas sob `lib/screens/`. Conteúdo demonstrativo identificado. | App instalado e aberto no AVD `Curie_API_36`; verificaram-se visualmente boas-vindas, Home, missões/detalhes, medição, mapa, Marie, conquistas e formulário. Aviso da Home ficou acima da área do botão flutuante. | Conferir qualidade final da captura de vídeo e seus requisitos de publicação. |
| Gerenciamento de estado — 20 | Estado local via `StatefulWidget`/`setState()` no shell e fluxo de medição; conclusão identificada por missão evita pontuação repetida; conquistas acompanham pontos. | Testes verificam pontos, conclusão e prevenção de duplicidade. Na execução Android, a medição exibiu `0.17 µSv/h` (fictício) e a ação de conclusão atualizou o progresso. | Estado é volátil e reinicia ao encerrar app, limitação do protótipo desta Sprint. |
| Formulário e validação — 15 | Formulário e validadores em `lib/screens/observation_form_screen.dart`. | Teste automatizado cobriu entrada inválida e válida. No Android, campos vazios mostraram mensagens de título mínimo de 3 caracteres e descrição mínima de 10; entrada válida mostrou “Registro validado!”. | Sem persistência, conforme escopo declarado. |
| Vídeo — 10 | Roteiro definitivo e sequência de interação em `docs/VIDEO_CHECKLIST.md`. | Roteiro de até cinco minutos preparado; execução Android disponível para a gravação. | Gravação e link são responsabilidade do integrante designado; critério só pode ser comprovado após disponibilização e revisão do vídeo. |

## Revisão técnica executada

- Flutter 3.47.9 stable / Dart 3.13.7.
- Android 16 / API 36, AVD `Curie_API_36`, reconhecido como `emulator-5554` por `adb` e Flutter.
- `flutter doctor -v` aprovou o Android SDK (36.0.0), JBR OpenJDK 25.0.3, rede e licenças. As duas categorias sinalizadas são Flutter/Dart fora do PATH (intencional: usar o wrapper local) e Visual Studio ausente (alvo Windows desktop fora do escopo).
- App instalado e iniciado no emulador; telas e fluxos acima foram examinados por interação e árvore de acessibilidade Android.
- Formulário Android demonstrou erros nos campos vazios e confirmação depois de entrada válida.
- Marie exibiu resposta local de meia-vida, com a área de resposta rolada para ficar visível.
- Pontos, mapa, missões e conquistas usam valores demonstrativos. Nenhuma integração física ou serviço remoto pertence a esta Sprint.

Os resultados finais de `flutter analyze`, `flutter test` e `flutter build apk --debug` são registrados em `docs/SPRINT1_PROGRESS.md` após sua execução nesta revisão. Evidências capturadas localmente durante a inspeção ficam em `D:\Android\Temp` e não são arquivos do repositório.
