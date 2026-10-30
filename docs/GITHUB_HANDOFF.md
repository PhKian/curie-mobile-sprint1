# Entrega no GitHub — instruções para o grupo

O repositório local existe na branch `main`, contém o histórico incremental e ainda não tem remoto configurado. Nenhum remoto ou push foi criado nesta preparação. Antes de conectar, confirme no enunciado/portal FIAP qual conta, organização e URL devem receber a entrega; use o repositório autorizado se ele já existir.

## 1. Conectar ao repositório autorizado

Crie ou abra o repositório remoto conforme a orientação da FIAP. Se estiver vazio e a URL tiver sido confirmada, no diretório do projeto:

```powershell
git remote add origin <URL-HTTPS-OU-SSH-AUTORIZADA>
git remote -v
git branch --show-current
git log --oneline --decorate --graph -10
git push -u origin main
```

Se `origin` já existir, confira a URL e use `git remote set-url origin <URL-AUTORIZADA>` somente para corrigir um destino confirmado. Se o repositório remoto já tiver commits próprios, não force o push: compare os históricos e combine a integração antes de enviar.

## 2. Convidar Matheus e Murilo

No GitHub, abra **Settings → Collaborators** (ou a seção equivalente da organização) e convide Matheus Carneiro Maciel e Murilo Marques usando os nomes de usuário/contas que eles confirmarem. Conceda somente o acesso necessário. Eles devem aceitar os convites em suas próprias contas.

## 3. Contribuições legítimas dos colegas

Paulo continua como desenvolvedor principal. Para cada contribuição, combinem um pequeno item real e revisável, por exemplo corrigir ou complementar uma seção da documentação, revisar um roteiro ou registrar uma observação de teste que a própria pessoa executou. O colaborador deve clonar o repositório, configurar sua identidade Git verdadeira e criar seus próprios commits:

```powershell
git clone <URL-AUTORIZADA>
cd curie_mobile
git config user.name "Nome real do colaborador"
git config user.email "Email associado à conta GitHub"
git switch -c docs/contribuicao-nome
# editar apenas o item combinado e revisar o diff
git diff --check
git diff
git add <arquivos-realmente-alterados>
git commit -m "docs: descreve contribuição realizada"
git push -u origin docs/contribuicao-nome
```

O colaborador abre um Pull Request para `main`, explica o que fez e pede revisão. Após aprovação, a equipe integra a alteração. Não configure `user.name` ou `user.email` de outra pessoa, não compartilhe credenciais, não use `--author` para atribuir autoria alheia e não crie commits em nome de quem não os realizou. Os registros devem refletir quem escreveu e revisou cada alteração.

## 4. Conferir autores e entrega

```powershell
git fetch origin
git status --short --branch
git log --oneline --decorate --graph --all
git log --format="%h %an <%ae> %s" origin/main
git remote -v
```

Confirme a presença dos commits integrados, a autoria verdadeira, a branch `main` atualizada, o destino remoto autorizado e os arquivos finais (`README.md`, `docs/`, projeto Flutter). Não inclua `.tools/flutter`, APKs de build, dados privados ou credenciais.
