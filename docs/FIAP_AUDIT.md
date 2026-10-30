# Auditoria de requisitos — FIAP Sprint 1

Auditoria baseada no código local e nos testes automatizados disponíveis. Não atribui nota; a avaliação final depende também da execução e do vídeo demonstrativo.

| Critério | Implementação e localização | Verificação/evidência | Pendências e risco |
| --- | --- | --- | --- |
| Navegação — 25 | Boas-vindas, Home, Missões, Medição, Mapa, Marie, Conquistas e formulário em `lib/screens/`; navegação central em `lib/main.dart`. | Teste de abertura/navegação, acesso a mapa e Marie, fluxo de missão e formulário em `test/widget_test.dart`. | Execução Android real e gravação ainda pendentes; demonstrar retornos e botões no vídeo. |
| Protótipo visual — 30 | Tema Material 3, componentes comuns em `lib/widgets/curie_components.dart`, telas sob `lib/screens/`. Conteúdo demonstrativo identificado. | Teste de viewport compacto cobre Home, abas, formulário e detalhe da missão. Build APK debug registrado no progresso. | Não há captura real de emulador/aparelho; inspeção visual final em Android depende de dispositivo configurado. |
| Gerenciamento de estado — 20 | Estado local via `StatefulWidget`/`setState()` no shell e fluxo de medição; conclusão identificada por missão evita pontuação repetida; conquistas acompanham pontos. | Teste automatizado conclui missão, verifica pontos e bloqueia duplicação. | Estado é volátil e reinicia ao encerrar app, limitação coerente com o escopo local desta Sprint. |
| Formulário e validação — 15 | Formulário e validadores em `lib/screens/observation_form_screen.dart`. | Teste apresenta campo inválido, depois dados válidos e confirmação. | Complementar com demonstração em Android; avaliar campos/teclado no aparelho. |
| Vídeo — 10 | Roteiro e checklist em `docs/VIDEO_CHECKLIST.md`. | Checklist preparado; arquivo/link ainda não fornecido. | Gravação e link são responsabilidade do integrante designado; critério não pode ser comprovado até publicação/entrega. |

## Testes locais registrados

- `flutter analyze`: aprovado sem issues após a correção responsiva.
- `flutter test`: cinco testes de widget aprovados no último ciclo documentado.
- `flutter build apk --debug`: compilação Android aprovada; APK não substitui execução em dispositivo.
- `flutter doctor --verbose`: Android toolchain reconhecida, licenças aceitas e nenhum dispositivo Android conectado. O AVD não inicia porque sua imagem está ausente; o download da imagem falhou por espaço insuficiente no disco. Ver `docs/SPRINT1_PROGRESS.md`.

## Evidências e limitações

Os testes e a compilação provam comportamentos no ambiente Flutter e a geração do pacote, mas não provam renderização ou interação em hardware Android. Não há capturas reais disponíveis neste registro. Nenhuma integração física ou serviço remoto faz parte desta Sprint.
