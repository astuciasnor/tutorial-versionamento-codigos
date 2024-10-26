
<!-- README.md é gerado a partir deste README.Rmd. Por favor, edite  e renderize este arquivo -->

# Tutorial de Uso do Git/Github em R/RStudio

<!-- badges: start -->
<!-- badges: end -->

Este Tutorial de uso do Git/Github em R/RStudio tem como objetivo
fornecer orientações práticas para usuários iniciantes e intermediários
sobre como usar o Git e o GitHub diretamente na interface do RStudio
para controle de versão de códigos em projetos em R. Na primeira parte,
utilizamos as funções do pacote `usethis`, e a partir da seção
“Trabalhando com Versionamento”, passamos a usar diretamente os comandos
do Git.

# 1. Instruções Inicias para uso do Git/Github

1.  Crie uma conta gratuita no GitHub em: <https://github.com/>

2.  Baixe e instale o Git a partir do link:
    <https://git-scm.com/downloads>

3.  Ao fim da instalçaão do Git, abra e feche o Git Bash. Feche e
    reinicie o Rstudio para reconhecer o local de instalação do Git
    (Normalmente, fica em `C:/Program Files/Git/bin/git.exe`).

4.  Carregue o pacote `usethis` para configurar o Git para uso no
    Rstudio

``` r
library(usethis)
```

## **1.1 Configurando o Git/GitHub no RStudio**

Utilizaremos o pacote `usethis` para integrar o Git ao GitHub. Você
precisará das suas credenciais do GitHub (nome de usuário e e-mail), que
podem ser encontradas em **Configurações → Perfil Público** no GitHub.

``` r
# Configurar o Git com nome de usuário e e-mail
usethis::use_git_config(user.name = "Seu Nome", 
                        user.email = "seu.email@exemplo.com")
```

## 1.2 Criando e configurando um Token de Acesso Pessoal (PAT) no RStudio

1.  Para autenticar o GitHub no RStudio, você precisará criar ou
    regenerar um token de acesso pessoal (PAT). Para isso, execute o
    comando abaixo:

``` r
# Criar um token GitHub
usethis::create_github_token()
```

2.  O comando acima abrirá o site do GitHub, onde você fará login e
    gerará o token (um código de 40 dígitos). Copie esse token, pois ele
    só apareceerá uma vez.
3.  Em seguida, adicione o token ao arquivo `.Renviron`, que armazena
    variáveis de ambiente no R. Isso garante que o token fique
    disponível, mas protegido.

``` r
# Abrir o arquivo .Renviron
usethis::edit_r_environ()
```

4.  No arquivo `.Renviron`, crie uma nova linha para armazenar o token,
    conforme abaixo:

`GITHUB_PAT=ghp_Ko3mdlNJpBzQ7lvzKTvGFg91f6HpBQlablalba`

5.  Após adicionar o token copiado do site, acrescente uma linha e salve
    o arquivo.

6.  Reinicie o RStudio com o atalho: `CTRL + SHIFT + F10`

Esse processo configura o Git e o GitHub para uso direto no RStudio,
possibilitando versionamento eficiente e integração com o GitHub para
controle de versão de seus projetos.

# 2. Como criar repositório

Vamos criar nosso primeiro repositório para uso pessoal e, também,
verificar se as conexões entre o RStudio e Github via Git estão
funcionando corretamente.

## 2.1 Criando repositório primeiro no Github

A maneira mais eficiente de criar um novo repositório é diretamente pelo
site do GitHub, pois isso garante que todas as configurações sejam
corretamente definidas desde o início.

1.  Acesse sua conta no GitHub e clique no botão **“New Repository”** no
    canto superior direito da página para criar um novo repositório.

    <img src="images/clipboard-1359965472.png" width="171" />

2.  Defina o nome do repositório, adicione uma descrição (opcional), e
    escolha se deseja que o repositório seja público ou privado.

3.  Marque a opção **“Add a README file”** para inicializar o
    repositório com um arquivo `README.md`, que você pode editar
    posteriormente.

4.  Preencha as informações conforme figura abaixo e clique no botão
    **“Create repository”** para finalizar a criação.

<img src="images/clipboard-142360520.png" width="637" />

### **2.1.1 Clonando o Repositório no Seu Computador**

Depois de criar o repositório no GitHub, o próximo passo é clonar o
repositório para sua máquina local, criando uma cópia que você poderá
modificar diretamente no RStudio. Além diso, esta etapa verifica se a
comunicação via Git está funcionando.

1.  No GitHub, acesse a página do repositório recém-criado e clique no
    botão verde **“Code”**. Em seguida, copie a URL fornecida para
    clonar o repositório (por exemplo, algo como
    [`https://github.com/seu-usuario/seu-repositorio.git`](https://github.com/seu-usuario/seu-repositorio.git)).

<img src="images/clipboard-3984491672.png" width="314" />

2.  Agora, no RStudio, siga estes passos para criar uma cópia local do
    repositório e integrá-lo ao seu projeto:

- Vá para **File → New Project**.
- Escolha a opção **Version Control**.
- Selecione **Git**.
- Cole a URL do repositório copiada do GitHub no campo correspondente.
- Especifique a pasta onde o projeto será salvo localmente.

3.  Após esses passos, o RStudio criará uma cópia completa do seu
    repositório localmente, já vinculada ao Git e ao GitHub. Isso
    significa que você poderá gerenciar o versionamento do projeto
    diretamente do terminal do RStudio, enviando e recebendo alterações
    entre o repositório local e o GitHub.

### **2.1.2 Implementando alterações em seu projeto**

Agora que o repositório está configurado no RStudio, você pode realizar
pequenas alterações para testar o controle de versão com Git e GitHub.
Estes procedimentos são aplicáveis quando apenas você interage com o
repositório.

1.  **Crie pastas e arquivos:**

    - No RStudio, crie uma nova pasta e adicione um novo arquivo dentro
      dessa pasta (por exemplo, uma pasta `teste` e um arquivo
      `teste.R`).

2.  **Comitando as alterações:**

    - Após criar a pasta e o arquivo, vá até a aba **Git** no RStudio e
      clique no botão **`Commit`**.
    - Selecione os arquivos que deseja versionar, adicione uma mensagem
      explicando a alteração (ex.: “Criação de pasta e arquivo de
      teste”) e clique em **`Commit`**`.`

3.  **Realizando o Push:**

    - Depois de comitar as alterações, clique em **Push** para enviar as
      modificações para o repositório remoto no GitHub.

4.  **Verificando no GitHub:**

    - Acesse seu repositório no GitHub e verifique se as mudanças (a
      nova pasta e arquivo) foram sincronizadas corretamente.

### **2.1.3 Alterando via GitHub o arquivo `README.md` e Realizando Pull no RStudio**

1.  Acesse a página do seu repositório no GitHub.

2.  Abra o arquivo `README.md` diretamente no GitHub e faça uma
    alteração simples (ex.: adicionar uma linha como “Alteração de teste
    no GitHub”).

3.  Clique em **Commit changes** para salvar a alteração no GitHub.

Agora, volte para o RStudio:

1.  Clique na aba **Git** e, em seguida, em **Pull** para sincronizar as
    alterações do GitHub com o seu repositório local.
2.  Verifique o arquivo `README.md` no RStudio para confirmar que a
    alteração feita no GitHub foi aplicada corretamente.

### **2.1.4 Incluindo Pastas e Arquivos no `.gitignore`**

Nem todos os arquivos e pastas precisam ser compartilhados no
repositório. Para evitar que certos arquivos sejam versionados, você
pode listá-los no arquivo `.gitignore`.

1.  No RStudio, abra ou crie o arquivo `.gitignore` na raiz do projeto.
2.  Insira os nomes dos arquivos e pastas que não devem ser versionados.
    Por exemplo:

``` bash
# Ignorar arquivos temporários do R
*.Rhistory
*.Rdata

# Ignorar diretórios específicos
/data
/output
```

3.  Salve o arquivo e faça um commit e um push dessas alterações.
    Lembre-se de verificar se os arquivos listados no `.gitignore` estão
    de fato sendo ignorados ao tentar comitar.

## 2.2 Criando o Repositório no Computador

Embora o método mais recomendado seja criar o repositório diretamente no
GitHub e depois cloná-lo no seu computador, também é possível criar um
repositório localmente no seu computador e vinculá-lo ao GitHub da
seguinte maneira:

``` r
# Criar um novo projeto e repositório Git localmente
usethis::create_project(path = "D:/Git/Clube_Codigo/Nome_Projeto")

# Vincular o projeto ao Git
usethis::use_git()    

# Enviar o projeto para o GitHub e parear o repositório local
usethis::use_github()
```

Ao usar esse fluxo, o projeto será criado no caminho especificado em seu
computador, vinculado ao Git local e, posteriormente, sincronizado com o
GitHub.

## **2.3 Criando a partir de um Projeto Existente no Computador**

Se você já possui um projeto no seu computador e deseja vinculá-lo ao
Git e ao GitHub, pode facilmente fazer isso sem criar um novo projeto do
zero.

1.  Abra o projeto existente no RStudio.

2.  Em seguida, use os comandos abaixo para vinculá-lo ao Git e
    sincronizá-lo com o GitHub:

``` r
# Vincular o projeto existente ao Git
usethis::use_git()

# Enviar o projeto para o GitHub e criar o repositório remoto
usethis::use_github()
```

Esses comandos ligarão seu projeto ao Git, permitindo controle de
versão, e o subirão para o GitHub, criando um repositório remoto pareado
com o seu projeto local.

------------------------------------------------------------------------

# **3. Clonando e Bifurcando um Repositório (Fork)**

Ao colaborar com outras pessoas em projetos no GitHub, pode ser útil não
apenas clonar um repositório, mas também bifurcá-lo (fazer um *fork*).
Isso permite que você trabalhe em uma cópia do repositório, mantendo a
conexão com o original para futuras contribuições ou atualizações.

Para fazer isso diretamente no RStudio e de maneira eficiente,
recomendamos o uso do pacote `usethis`. Copie e cole o comando abaixo em
um script R, troque as informações e execute o comando:

``` r

# Clonando e bifurcando (fork) o repositório para o seu GitHub
usethis::create_from_github(
  repo_spec = "https://github.com/usuario-original/nome-repositorio.git",
  destdir = "D:/Git/Clube_Codigo/",
  fork = TRUE
)
```

Neste comando, temos:

- **`repo_spec`** especifica a URL do repositório no GitHub que você
  deseja bifurcar.
- **`destdir`** define o diretório local onde o repositório será salvo
  no seu computador.
- **`fork = TRUE`** indica que você deseja criar um *fork* do
  repositório original no seu próprio GitHub, permitindo que você
  trabalhe de forma independente no projeto.
- Obs: o `usethis::create_from_github()` simplifica muito o processo ao
  fazer tudo em um único comando: ele clona o repositório, cria o fork
  no GitHub e configura os remotos `origin` e `upstream` de forma
  automática e integrada com o RStudio.

------------------------------------------------------------------------

# **4. Trabalhando com Versionamento no Terminal**

## 4.1. Versionando enquanto mantenedor

Após ter criado um repositório o qual será usado em bifurcação (fork)
com outros colaboradores, você, como mantenedor, pode querer aprimorar
ainda mais seus códigos dentro do projeto de análise. Siga os passos
abaixo para inserir suas alterações em arquivos editáveis como `.R`,
`.Rmd`, `.qmd`, `.csv`, `.xlsx`, ou para adicionar arquivos não
editáveis às pastas do projeto

> **Nota:** Essas etapas são válidas quando você é o proprietário do
> repositório bifurcado (fork). Usaremos apenas o terminal (bash) do
> RStudio para trabalhar de maneira eficiente com o Git.

### **4.1.1 Configuração inicial do upstream**

Se você ainda não fez a configuração inicial do upstream, será
necessário fazê-la para conectar seu repositório local ao repositório
original (upstream):

``` bash
git remote add upstream https://github.com/usuario-original/nome-repositorio.git
```

### 4.1.2 Atualizando sua main local

1.  Mude para a branch `main` local:

``` bash
git checkout main
```

2.  Busque todas as atualizações do repositório original

``` bash
git fetch upstream
```

3.  Integre as mudanças do `upstream/main` em sua `main` local

``` bash
git merge upstream/main
```

4.  Envie as atualizações para seu fork no GitHub

``` bash
git push origin main
```

### **4.1.3 Criando e mudando para nova branch**

1.  Crie e mude para uma nova branch para trabalhar em uma nova
    funcionalidade (ex.: `feature/login`):

``` bash
git checkout -b feature/nome-da-feature
```

2.  Para listar as branches locais e verificar em qual você está
    trabalhando, utilize:

``` bash
git branch
```

### 4.1.4 Fazendo alterações no projeto

- Modifique múltiplos arquivos em diferentes pastas, conforme
  necessário.

- Crie novos arquivos ou exclua arquivos que não são mais necessários.

- Mantenha as alterações focadas na funcionalidade/correção em que está
  trabalhando.

- Realize commits frequentes para não perder o trabalho.

> Como **exercício**, faça modificações no arquivo de código R
> `request.R`. Inclua um vetor ou matriz de dados numéricos e salve o
> arquivo.

1.  Após realizar as modificações, verifique quais arquivos foram
    modificados

``` bash
git status
```

2.  Verifique as alterações específicas em cada arquivo:

``` bash
git diff nome-do-arquivo
```

3.  Adicione alterações específicas ao stage:

    - Específico:

      ``` bash
      git add nome-do-arquivo
      ```

    - Todos os arquivos:

      ``` bash
      git add .
      ```

4.  Salve as alterações em um commit

``` bash
git commit -m "Descrição das alterações"
```

5.  Caso precise modificar o último commit (antes do push)

``` bash
git commit --amend -m "Nova mensagem de commit"
```

### 4.1.5 Atualizando sua Branch com a Main Antes do Pull Request

1.  Busque as últimas alterações do repositório original

``` bash
git fetch upstream
```

2.  Reaplique seus commits sobre a versão mais atual do upstream

``` bash
git rebase upstream/main
```

3.  Envie sua branch atualizada para seu fork

``` bash
git push origin feature/nome-da-feature
```

### 4.1.6. Criando e Gerenciando o Pull Request (PR)

Após enviar suas alterações para seu fork, você precisa criar um Pull
Request (PR) para que suas mudanças sejam incorporadas ao repositório
original.

1.  Acesse a página do seu fork no GitHub e crie um Pull Request:

    - Clique em “New Pull Request” ou acesse a aba “Pull requests”.

    - Inclua um título claro, uma descrição detalhada das alterações,
      referência a issues relacionadas (se houver), e evidências de
      testes, prints ou GIFs (se aplicável).

2.  Após criar o PR:

    - Responda a comentários dos revisores.

    - Se precisar fazer ajustes, faça as alterações e os novos commits
      serão automaticamente incluídos no PR:

      ``` bash
      git add .
      git commit -m "Ajustes conforme revisão do PR"
      git push origin feature/nome-da-feature
      ```

3.  Aguarde a revisão e aprovação:

    - Esteja disponível para discutir as alterações.

    - O mantenedor pode solicitar modificações antes do merge.

### 4.1.7 Após o Merge do PR

1.  Retorne para a branch `main`

``` bash
git checkout main
```

2.  Atualize sua `main` local com as mudanças do `upstream`

``` bash
git pull upstream main
```

3.  Atualize a `main` do seu fork

``` bash
git push origin main
```

4.  Remova a branch de feature localmente

``` bash
git branch -d feature/nome-da-feature
```

5.  Remova a branch de feature do seu fork remoto

``` bash
git push origin --delete feature/nome-da-feature
```

------------------------------------------------------------------------

## **4.2. Colaborador em Repositório com Fork**

Caso você não seja o mantenedor do repositório, será necessário criar um
Pull Request (PR) para solicitar a inclusão das suas alterações na
branch principal (geralmente chamada de `main` ou `master`). Siga os
passos abaixo:

### 4.2.1 Configuração inicial do upstream

Conecte seu fork com o repositório original, caso ainda não tenha feito:

``` bash
git remote add upstream https://github.com/dono-original/nome-repositorio.git
```

### 4.2.2 Atualizando a Branch Main Local

Antes de iniciar o trabalho, garanta que a branch `main` do seu
repositório local esteja atualizada com a versão mais recente do
repositório remoto.

1.  Mude para a branch main:

``` bash
git checkout main
```

2.  Busque atualizações do repositório original:

``` bash
git fetch upstream
```

3.  Integre mudanças do upstream/main em sua main local

``` bash
git merge upstream/main
```

4.  Atualize seu fork no GitHub

``` bash
git push origin main
```

### 4.2.3 Criando nova branch de feature

1.  Crie e mude para uma nova branch de feature:

``` bash
git checkout -b feature/sua-contribuicao
```

2.  Se já tiver a branch e ela foi criada anteriormente, faça um merge
    ou rebase para incorporá-la à versão atual:
    - Merge:

      ``` bash
      git checkout nome-da-branch
      git merge main
      ```

    - Reabse:

      ``` bash
      git checkout nome-da-branch
      git rebase main
      ```

> **Nota:** O `merge` cria um novo commit de mesclagem, enquanto o
> `rebase` reaplica seus commits sobre as mudanças da `main`. Use o
> método que preferir, levando em consideração o fluxo de trabalho da
> equipe.

### 4.2.4 Fazendo Alterações no Projeto

Nesta etapa, faça as alterações necessárias no projeto, como modificar
arquivos, adicionar novos arquivos ou pastas:

- Modifique múltiplos arquivos em diferentes pastas.
- Crie novos arquivos conforme necessário.
- Exclua arquivos que não são mais necessários.
- Mantenha as alterações focadas na feature/correção em que está
  trabalhando.
- Realize commits frequentes para não perder o trabalho.

1.  Verifique quais arquivos foram modificados:

``` bash
git status
```

2.  Verifique as alterações específicas em cada arquivo:

``` bash
git diff nome-do-arquivo
```

3.  Adicione as alterações ao stage:
    - Específico:

      ``` bash
      git add nome-do-arquivo
      ```

    - Todos os arquivos:

      ``` bash
      git add .
      ```
4.  Salve as alterações em um commit:

``` bash
git commit -m "Descrição das alterações"
```

5.  Caso precise modificar o último commit (antes do push)

``` bash
git commit --amend -m "Nova mensagem de commit"
```

### 4.2.5 Atualizando com Upstream Antes do PR

1.  Busque as últimas alterações do upstream:

``` bash
git fetch upstream
```

2.  Reaplique seus commits sobre a versão mais atual do `upstream`:

``` bash
git rebase upstream/main
```

3.  Envie sua branch atualizada para seu fork:

``` bash
git push origin feature/sua-contribuicao
```

### 4.2.6 Criando e Gerenciando o Pull Request (PR)

1.  Vá até a página do seu fork no GitHub e crie um Pull Request:

    - Clique em “New Pull Request” ou acesse a aba “Pull requests”.

    - Inclua um título claro, uma descrição detalhada das alterações,
      referência a issues relacionadas (se houver), e evidências de
      testes, prints ou GIFs (se aplicável).

2.  Clique em “Create Pull Request” para submeter a solicitação de
    mesclagem ao mantenedor.

3.  Após criar o PR:

    - Responda a comentários dos revisores.

    - Faça ajustes solicitados, se necessário. Os novos commits serão
      automaticamente incluídos no PR:

      ``` bash
      # Faça as alterações necessárias 
      git add . 
      git commit -m "Ajustes conforme revisão do PR" 
      git push origin feature/nome-da-feature
      ```

### 4.2.7 Após Aprovação do PR

1.  Retorne para a branch `main`:

``` bash
git checkout main
```

2.  Atualize sua `main` local com as mudanças do `upstream`:

``` bash
git pull upstream main
```

3.  Atualize a `main` do seu fork:

``` bash
git push origin main
```

4.  Remova a branch de feature localmente:

``` bash
git branch -d feature/nome-da-feature
```

5.  Remova a branch de feature do seu fork remoto:

``` bash
git push origin --delete feature/nome-da-feature
```

### 4.2.8 Considerações Finais

- **Pull Request (PR)** é o processo mais comum para sugerir mudanças em
  um projeto colaborativo no GitHub. Ao criar um PR, você solicita que
  suas alterações sejam revisadas e integradas à branch principal.

- **Comunicação**: Descreva claramente o que foi alterado no PR para
  facilitar a revisão. Isso ajuda o mantenedor a entender o contexto das
  mudanças.

- **Boa Prática**: Sempre trabalhe em branches separadas para manter a
  organização do repositório e garantir que a branch principal se
  mantenha estável.

------------------------------------------------------------------------

# 5. Recuperando Trabalho sem Branch

Se você fez alterações em arquivos, não criou branch e nem as comitou, e
percebeu que deveria estar trabalhando em uma nova branch, não se
preocupe. É possível criar uma nova branch e mover suas alterações para
ela, sem perder nada. Veja como proceder:

## 5.1 Salvando alterações atuais

1.  Salvar temporariamente suas alterações não commitadas

``` bash
git stash save "Alterações em progresso"
```

## 5.2 Atualizando main e criando branch

1.  Buscar atualizações do repositório original

``` bash
git fetch upstream
```

2.  Integrar mudanças do upstream

``` bash
git merge upstream/main
```

3.  Criar e muda para nova branch

``` bash
git checkout -b feature/sua-feature
```

## 5.3 Recuperando alterações

1.  Recuperar as alterações salvas no stash

``` bash
git stash pop
```

## 5.4 Após resolver conflitos (se houver)

1.  Adicionar arquivos resolvidos ao stage

``` bash
git add .
```

2.  Criar commit com as alterações

``` bash
git commit -m "Descrição das alterações recuperadas"
```

3.  Enviar branch para seu fork

``` bash
git push origin feature/sua-feature
```

## 5.5 Passe para aparte de criar PR e em diante

Passa para a parte de criar PR no Github e os procedimentos seguintes,
conforme seja Proprietário ou colaborador do repositório.

## **6. Apagando a Última Modificação caso haja erro**

Se ocorrer algum erro, é possível voltar ao estado anterior à
modificação. Você pode até reverter para um estado anterior mais
distante, mas é importante ter cuidado ao resetar commits mais antigos,
pois isso pode impactar o histórico do projeto. Mesmo que isso não seja
sempre necessário, é útil saber como proceder caso precise corrigir
algo.

### **6.1 Visualizar** Histórico de Commits

Primeiro, você precisa verificar o histórico de commits e identificar o
ponto para o qual deseja reverter o projeto. Para isso, use o comando:

``` bash
git reflog
```

Esse comando exibirá uma lista com o histórico de commits e seus
identificadores (hashes), que são códigos alfanuméricos de 8 caracteres.
Identifique o commit anterior ao erro que você deseja corrigir.

### **6.2 Resetar para um Commit Anterior**

Para voltar a um commit anterior, execute o seguinte comando,
substituindo o identificador do commit pelo hash correspondente:

``` bash
git reset --hard 7d0932f
```

Esse comando redefine o repositório local para o estado do commit
especificado, desfazendo qualquer alteração feita após ele. **Cuidado:**
isso removerá qualquer mudança não comitada.

### **6.3 Revertendo o Reset (Opcional)**

Se você mudar de ideia e quiser restaurar o commit que acabou de
resetar, pode voltar atrás executando novamente o comando `git reflog` e
usando o identificador do commit que deseja recuperar:

``` bash
git reset --hard 5a6cc0a
```

### **6.4 Sincronizar com o Repositório Remoto**

Após fazer um reset local, é importante garantir que o repositório
remoto também esteja atualizado. Se o repositório remoto tiver commits
que você reverteu no local, será necessário forçar a atualização para
alinhar ambos os históricos. Isso pode sobrescrever as alterações no
servidor remoto, então tenha certeza das suas mudanças.

Para forçar o push das alterações locais para o repositório remoto,
utilize:

``` bash
git push --force
```

Esse comando força a sobrescrição do histórico remoto com o histórico
local.

### **Considerações Importantes:**

1.  **Usar `git reset --hard` com cautela**: Esse comando remove
    permanentemente as alterações que não foram comitadas e pode alterar
    o histórico de commits.

2.  **Reverta apenas se necessário**: Antes de usar o `--force` para
    sobrescrever o repositório remoto, certifique-se de que isso não
    afetará o trabalho de outros colaboradores.

3.  **Alternativa com `git revert`**: Em vez de usar `reset --hard`,
    você pode usar `git revert` para desfazer alterações sem alterar o
    histórico. Isso cria um novo commit que desfaz as mudanças, mantendo
    a integridade do histórico de commits.

Obs: veja a partir do minuto 23:00 do vídeo
`Curso de Git e Github Completo 2023` para mais esclarecimentos.

## 7. Descartando Alterações em arquivos específicos

Se você fez alterações em um arquivo, mas ainda não fez o commit e
deseja descartar essas modificações, retornando o arquivo ao estado do
último commit, siga os passos abaixo usando o Terminal do Git:

### 7.1 Verificar o Status do Repositório

Antes de qualquer ação, é importante verificar o estado atual do
repositório e ver quais arquivos foram modificados ou estão prontos para
commit.

``` bash
git status
```

Esse comando listará os arquivos que foram modificados e se estão ou não
no *staging area* (prontos para serem commitados).

### **7.2 Descartar as Alterações em um Arquivo Específico**

Se você deseja descartar todas as modificações feitas em um arquivo
específico e restaurá-lo ao estado do último commit, use o seguinte
comando:

``` bash
git checkout -- nome-do-arquivo
```

Esse comando descarta as alterações locais não commitadas no arquivo
especificado, retornando-o ao estado do último commit.

### **7.3 Remover Arquivos do Stage (Caso Estejam Preparados para Commit)**

Se o arquivo já foi adicionado ao *staging area* (ou seja, preparado
para commit com `git add`), mas você quer removê-lo dessa área sem
descartar suas alterações, use o comando abaixo:

``` bash
git reset HEAD nome-do-arquivo
```

Esse comando remove o arquivo do *staging area* e desfaz o `git add`,
mas mantém as alterações feitas no arquivo. Isso é útil quando você quer
revisar ou modificar mais antes de commitá-lo.

# **8. Boas Práticas Gerais e Comandos Úteis**

## 8.1. Boas práticas

1.  **Commits Pequenos e Frequentes**: Realize commits de maneira
    frequente e com descrições claras. Isso facilita a revisão do código
    e ajuda a identificar pontos de erro rapidamente.

2.  **Sincronize Regularmente**: Faça `git pull` regularmente antes de
    começar a trabalhar para garantir que você está com a versão mais
    recente do projeto. Isso evita conflitos e confusões.

3.  **Use Branches**: Sempre crie uma nova branch para implementar
    mudanças específicas, mantendo a branch `master` ou `main` estável.

4.  **Revisão de Código (Pull Requests)**: Utilize Pull Requests para
    revisar as alterações de forma colaborativa antes de mesclá-las à
    branch principal. Isso melhora a qualidade do código e reduz o risco
    de bugs.

5.  Use mensagens de commit claras e descritivas

6.  Verifique se não incluiu arquivos temporários

7.  Mantenha um .gitignore atualizado

8.  Teste suas alterações antes de cada commit

9.  Revise suas alterações antes do commit

10. Para desfazer alterações em arquivos específicos, veja ponto acima

11. Para desfazer o último commit (antes do puush):
    `git rest --soft HEAD~1`

## 8.2. Comandos úteis

1.  Mostrar estado atual do repositório

``` bash
git status
```

2.  Listar todas as branches locais

``` bash
git branch
```

3.  Mostrar todos os repositórios remotos configurados

``` bash
git remote -v
```

4.  Exibir histórico de commits de forma resumida

``` bash
git log --oneline
```

# 9. Anexo de criação do arquivo Readme.rmd

Recomendamos sempre criar um bom arquivo Reame para descrever bem seu
repositório. Para criar o Readme.rmd usei a função
`usethis::use_readme_rmd()` . O que há de tão especial sobre usar o
`README.Rmd` em vez de apenas o `README.md`?

Resposta.: Você pode incluir tabelas e gráficos usando chunks de
códigos, tal como este que inclui uma tabela de resumo de dados:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

Você ainda precisará renderizar `README.Rmd` regularmente, para manter
`README.md` atualizado.

Você também pode incorporar gráficos, por exemplo:

![](README_files/figure-gfm/pressure-1.png)<!-- -->

Nesse caso, não se esqueça de fazer o commit e enviar (push) os arquivos
de figura resultantes para que eles sejam exibidos no GitHub. Nesta
etapa de versionamento, utilize uma das duas opções acima caso seja
proprietário ou apenas colaborador.
