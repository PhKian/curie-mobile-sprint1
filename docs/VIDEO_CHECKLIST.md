# Roteiro definitivo de vídeo — CURIE Sprint 1

Duração alvo: 4min40s (limite: 5min). O integrante designado pela equipe grava; Paulo não precisa gravar. Grave a tela do Android com o app instalado, em uma sessão limpa, notificações ocultas e orientação retrato. Os valores do medidor e do mapa são fictícios e devem ser apresentados como demonstração educativa.

## Preparação antes de gravar

1. Inicie o AVD/dispositivo Android e confirme que o CURIE abre.
2. Abra o app do início, com pontuação em zero. Evite reinstalar durante a gravação.
3. Ative o gravador de tela e deixe microfone/áudio legível. Feche apps e notificações pessoais.
4. Deixe o roteiro ao lado, sem mostrar mensagens ou dados pessoais.
5. Se usar o AVD preparado neste projeto, siga `docs/ANDROID_RUNBOOK.md`.

## Roteiro cronometrado e interações exatas

| Tempo | Interação | Narração sugerida |
| --- | --- | --- |
| 0:00–0:20 | Mostrar a tela CURIE/boas-vindas. | “Este é o CURIE, um aplicativo educativo de ciência nuclear desenvolvido para a Sprint 1 de Mobile Application Development do FIAP Challenge 2026.” |
| 0:20–0:40 | Toque **Começar exploração**. Mostre a Home, pontos e aviso de dados demonstrativos. | “A Home reúne o progresso da sessão e deixa claro que as leituras são apenas demonstrativas.” |
| 0:40–1:00 | Toque **Missões** na barra inferior. Mostre o catálogo e toque **Radiação ao nosso redor**. | “O catálogo organiza as atividades. Vou abrir uma missão para demonstrar o fluxo.” |
| 1:00–1:20 | Na tela de detalhes, mostre objetivo e orientação de segurança; toque **Iniciar missão**. | “Cada missão apresenta seu objetivo e orientações antes da atividade.” |
| 1:20–1:45 | Toque **Simular medição**. Espere aparecer o valor. Mostre o texto que identifica o resultado como fictício. | “A medição é uma simulação local; não há leitura de sensor real.” |
| 1:45–2:00 | Toque **Concluir missão +30 pontos** uma vez. Aguarde voltar ao catálogo. Volte à Home e mostre 30 pontos/progresso. | “Ao concluir, o estado da sessão atualiza e a pontuação é adicionada uma vez.” |
| 2:00–2:20 | Toque **Mapa**. Mostre os pontos e os valores; role se necessário até o aviso. | “O mapa contém registros de exemplo. Não representa medições coletadas nem localização real.” |
| 2:20–2:45 | Toque **Marie**. Toque no atalho **O que é meia-vida?** e mostre a resposta; depois, se houver tempo, digite `radiação` no campo e toque enviar. | “Marie oferece respostas locais predefinidas para apoiar o aprendizado; não usa IA generativa nem conexão com serviço externo.” |
| 2:45–3:05 | Toque **Conquistas**. Mostre 30 pontos e a primeira conquista liberada. | “As conquistas acompanham o progresso das missões realizadas nesta sessão.” |
| 3:05–3:20 | Volte à Home e toque **Registrar observação**. Toque **Validar registro** com os campos vazios. | “O caderno de campo valida os dados e informa o que falta.” |
| 3:20–3:45 | No título, escreva `Observacao CURIE`. Na descrição, escreva `Atividade educativa de observacao`. Oculte o teclado e toque **Validar registro**. Mostre a confirmação. | “Com os campos preenchidos, o aplicativo confirma o registro demonstrativo.” |
| 3:45–4:05 | Volte a **Missões**, abra novamente a primeira missão concluída e mostre que consta como concluída ou não permite ganhar pontos novamente. | “A mesma missão não pontua duas vezes dentro da sessão.” |
| 4:05–4:35 | Retorne à Home. Segure brevemente a tela final para leitura. | “Nesta Sprint, o foco é a experiência mobile e a navegação. Sensores, backend, persistência e IA não fazem parte desta versão.” |

## Pós-gravação

- Reveja o vídeo inteiro: áudio, legibilidade, erros de toque, teclado e cortes.
- Confira que a validação inválida e a confirmação válida aparecem claramente.
- Confirme que a demonstração começa em Android e exibe todas as telas: boas-vindas, Home, catálogo/detalhes, medição, mapa, Marie, conquistas e formulário.
- Não declare integração física, dados científicos reais, IA generativa, backend ou sincronização.
- Publique como a FIAP orientar e acrescente o link final ao README. Não invente URL antes da publicação.
