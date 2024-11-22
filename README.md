
<!-- README.md é gerado a partir deste README.Rmd. Por favor, edite  e renderize este arquivo -->

# Tutorial de Uso do Git/Github em R/RStudio

<!-- badges: start -->
<!-- badges: end -->

Este Tutorial de uso do Git/Github em R/RStudio tem como objetivo
fornecer orientações práticas para usuários iniciantes e intermediários
sobre como usar o Git e o GitHub diretamente na interface do RStudio
para controle de versão de códigos em projetos em R. Na primeira parte,
utilizamos as funções do pacote `usethis`, e a partir da seção
“T`rabalhando com Versionamento`”, passamos a usar diretamente os
comandos do Git no terminal.

# 1. Instruções Inicias para uso do Git/Github

1.  Crie uma conta gratuita no GitHub em: <https://github.com/>

2.  Baixe e instale o Git a partir do link:
    <https://git-scm.com/downloads>

3.  Ao fim da instalação do Git, abra e feche o Git Bash. Verifique num
    terminal se foi instalado corretamente, digitando:

    ``` bash
    git --version
    ```

4.  Feche e reinicie o Rstudio para reconhecer o local de instalação do
    Git (Normalmente, fica `Global options --> Git/SVN` e verifique o
    Git executable: `C:/Program Files/Git/bin/git.exe`.

5.  Carregue o pacote `usethis` para configurar o Git para uso no
    Rstudio

    ``` r
    library(usethis)
    ```

## **1.1 Configurando o Git/GitHub no RStudio**

Utilizaremos o pacote `usethis` para integrar o Git ao GitHub. Você
precisará das suas credenciais do GitHub (nome de usuário e e-mail), que
podem ser encontradas no GitHub indo em **Configurações → Perfil
Público**.

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

<!-- -->

2.  O comando acima abrirá o site do GitHub, onde você fará login e
    gerará o token (um código de 40 dígitos). Copie esse token, pois ele
    só aparecerá uma vez.

3.  Em seguida, adicione o token ao arquivo `.Renviron`, que armazena
    variáveis de ambiente no R. Isso garante que o token fique
    disponível, mas protegido.

    ``` r
    # Abrir o arquivo .Renviron
    usethis::edit_r_environ()
    ```

<!-- -->

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

1.  Acesse sua conta no GitHub, acesse a guia Repositories e clique no
    botão verde **`New`** no canto superior direito da página para criar
    um novo repositório.

    <img src="images/clipboard-3228152852.png" width="605" />

2.  Defina o nome do repositório, adicione uma descrição (opcional), e
    escolha se deseja que o repositório seja público ou privado.

3.  Marque a opção **“Add a README file”** para inicializar o
    repositório com um arquivo `README.md`, que você pode editar
    posteriormente.

4.  Preencha as informações conforme figura abaixo e clique no botão
    **`Create repository`** para finalizar a criação.

    <img src="images/clipboard-142360520.png" width="627" />

### **2.1.1 Clonando o Repositório no Seu Computador**

Depois de criar o repositório no GitHub, o próximo passo é clonar o
repositório para sua máquina local, criando uma cópia que você poderá
modificar posteriormente no RStudio. Além diso, esta etapa verifica se a
comunicação via Git está funcionando.

1.  No GitHub, acesse a página do repositório recém-criado e clique no
    botão verde **“Code”**. Em seguida, copie a URL fornecida para
    clonar o repositório (por exemplo, algo como
    [`https://github.com/seu-usuario/seu-repositorio.git`](https://github.com/seu-usuario/seu-repositorio.git)).

    <img src="images/clipboard-3984491672.png" width="328" />

<!-- -->

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
Estes procedimentos são aplicáveis apenas quando você interage com o seu
próprio repositório.

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

### **2.1.4 Excluindo Pastas e Arquivos do Versionamento usando o `.gitignore`**

Nem todos os arquivos e pastas precisam ser compartilhados/versionando
no repositório. Para evitar que certos arquivos sejam versionados, você
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

    Cada linha representa um padrão a ser ignorado pelo Git. Prefixe com
    `/` para excluir um diretório inteiro.

<!-- -->

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

Ao colaborar em projetos no GitHub e em equipe, você pode precisar
clonar ou bifurcar (fazer um fork) um repositório. Bifurcar cria uma
cópia do repositório em sua própria conta GitHub, permitindo trabalhar
em uma versão independente, mas ainda conectada ao repositório original
para facilitar contribuições futuras.

1.  Para fazer isso diretamente no RStudio e de maneira eficiente,
    recomendamos o uso do pacote `usethis`. Copie e cole o comando
    abaixo em um script R, troque as informações e execute o comando:

    ``` r

    # Clonando e bifurcando (fork) o repositório para o seu GitHub
    usethis::create_from_github(
      repo_spec = "https://github.com/usuario-original/nome-repositorio.git",
      destdir = "D:/Git/Clube_Codigo/",
      fork = TRUE
    )
    ```

Neste comando, temos:

- **`repo_spec`** especifica a URL do usuário original do proprietário
  no GitHub que você deseja bifurcar.
- **`destdir`** define o diretório local onde o repositório será salvo
  no seu computador.
- **`fork = TRUE`** indica que você deseja criar um *fork* do
  repositório original no seu próprio GitHub, permitindo que você
  trabalhe de forma independente no projeto.
- Obs: o `usethis::create_from_github()` simplifica muito o processo ao
  fazer tudo em um único comando: ele `clona` o repositório localmente,
  `cria o fork no GitHub` e configura os remotos `origin` e `upstream`
  de forma automática e integrada com o RStudio.

------------------------------------------------------------------------

# **4. Trabalhando com Versionamento no Terminal**

## 4.1. Versionando enquanto mantenedor

Após ter criado um repositório o qual será usado em bifurcação (fork)
com outros colaboradores, você como proprietário (mantenedor) pode
querer aprimorar ainda mais seus códigos dentro do projeto de análise.
Siga os passos abaixo para inserir suas alterações em arquivos editáveis
como `.R`, `.Rmd`, `.qmd`, `.csv`, `.xlsx`, ou para adicionar arquivos
não editáveis às pastas do projeto.

> **Nota:** Essas etapas são válidas quando você é o proprietário do
> repositório orginal. Usaremos apenas o terminal (bash) do RStudio para
> trabalhar de maneira eficiente com o Git.

### **4.1.1 Configuração inicial do upstream**

Enquanto mantenedor do repositório, você não precisa fazer configuração
inicial de upstream com o comando `git remote add upstream url-repo`. Na
verdade, se você usou a função `create_from_github()` do pacote
`usethis` para clonar o projeto em fork, não precisa adicionar o
upstream, conforme já destacado na `seção 3`.

### 4.1.2 Atualizando sua main local

1.  Mude para a branch `main` local:

    ``` bash
    git checkout main
    ```

<!-- -->

2.  Use os comandos `git fetch origin` ou `git pull origin main` para
    obter as últimas alterações do repositório remoto (`origin`) que
    está no GitHub. Porém, as duas funcionam de forma diferente.

    1)  O comando `git fetch origin` busca as atualizações do
        repositório remoto, mas não as aplica automaticamente ao seu
        branch local. É útil se você deseja revisar as mudanças antes de
        aplicá-las. Depois teria que fazer `git merge origin/main` .
        Caso você deseje usar esse procedimento de revisar e mesclar,
        segue abaixo a sequência completa de comandos:

    ``` bash
    git fetch origin           # Busca as atualizações do repositório remoto sem aplicá-las

    git diff main origin/main  # Mostra as diferenças entre sua branch local e a versão no remoto
    git merge origin/main      # Mescla as atualizações do remoto na sua branch local
    git log --oneline          # Visualiza o histórico de commits para confirmar as mudanças
    ```

    2)  Já o comando **mais usado** é o `git pull origin main`, o qual
        busca as atualizações e já as mescla com a sua branch local.
        Aqui, `main` é o nome da branch principal. Caso você utilize
        outro branch principal (como `master`), substitua `main` por
        `master`.

    ``` bash
    git pull origin main 
    ```

    Esta opção é a **preferida** e mais usada, principalmente quando
    você já sabe que os códigos são provenientes de **fontes
    confiávies.**

### **4.1.3 Criando e mudando para nova branch**

1.  Crie e mude para uma nova branch para trabalhar em uma nova
    funcionalidade:

    ``` bash
    git checkout -b nome-branch
    ```

<!-- -->

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

<!-- -->

2.  Verifique as alterações específicas em cada arquivo:

    ``` bash
    git diff nome-darquivo
    ```

<!-- -->

3.  Adicione alterações ao stage:

    - Específico:

      ``` bash
      git add nome-arquivo
      ```

    - Todos os arquivos:

      ``` bash
      git add .
      ```

4.  Salve as alterações em um commit

    ``` bash
    git commit -m "Descrição das alterações"
    ```

<!-- -->

5.  Caso precise modificar o último commit (antes do push)

    ``` bash
    git commit --amend -m "Nova mensagem de commit"
    ```

### 4.1.5 Atualizando sua Branch com a Main Antes do Pull Request

1.  Busque as últimas alterações do repositório original

    ``` bash
    git fetch origin
    ```

<!-- -->

2.  Reaplique seus commits sobre a versão mais atual do upstream

    ``` bash
    git rebase origin/main
    ```

<!-- -->

3.  Envie sua branch atualizada para seu repositório `origin`

    ``` bash
    git push origin nome-branch
    ```

### 4.1.6. Criando e Gerenciando o Pull Request (PR)

Após enviar suas alterações para seu fork, você precisa criar um Pull
Request (PR) para que suas mudanças sejam incorporadas ao repositório
original.

1.  Acesse a página do seu fork no GitHub e crie um Pull Request:

    - Clique no botão `Compare & Create Pull request` e depois em
      `Crea pull request`.

    - Inclua um título claro, uma descrição detalhada das alterações,
      referência a issues relacionadas (se houver), e evidências de
      testes, prints ou GIFs (se aplicável).

2.  Após criar o PR:

    - Como as modificações foram feitas por você mesmo, voê já pode
      mesclar e finalizar as alterações.

    - Se precisar responder a comentários de outros mantenedores do
      projeto e, neste caso, necessitar fazer ajustes, faça as
      alterações (sem precisar criar nova branch) e os novos commits
      serão automaticamente incluídos no PR:

      ``` bash
      git add .
      git commit -m "Ajustes conforme revisão do PR"
      git push origin nome-branch
      ```

3.  Aguarde a revisão e aprovação:

    - Esteja disponível para discutir as alterações.

    - O(s) mantenedor(es) pode(m) solicitar modificações antes do merge.

4.  O mantenedor ou proprietário do projeto aprova as alterações e faz o
    **`Merge`**

    - Clique em `Merge pull request` e depois em `Confirm merge`

### 4.1.7 Após o Merge do PR

Após o aviso de aprovação das alterações e realização do merge, você
deve atualizar as alterações na sua main do computador e apagar a branch
criada, se necessário.

1.  Retorne para a branch `main`

    ``` bash
    git checkout main
    ```

<!-- -->

2.  Atualize sua `main` local com as mudanças do remoto `origin`

    ``` bash
    git pull origin main
    ```

3.  Remova a branch de feature localmente

    ``` bash
    git branch -d nome-branch
    ```

4.  Remova a branch de feature do seu repositório remoto

    ``` bash
    git push origin --delete nome-branch
    ```

------------------------------------------------------------------------

## **4.2. Colaborador em Repositório com Fork**

Caso você não seja o mantenedor do repositório, será necessário criar um
`Pull Request` (PR) para solicitar a inclusão das suas alterações na
branch principal (geralmente chamada de `main` ou `master`). Siga os
passos abaixo para colaborar corretamente num projeto utilizando os
comando do Git:

### 4.2.1 Configuração inicial do upstream

Se você ainda não fez a configuração inicial do upstream do respositório
clonado em seu computador (reveja subtópico [3. Clonando e Bifurcando um
Repositório (Fork)](#clonando-e-bifurcando-um-repositório-fork)), será
necessário fazê-lo para conectar seu repositório local ao repositório
original (upstream), conforme abaixo. Entretanto, se você usou o comando
do pacote `usethis` para clonar em fork (Seção 3 acima), toda a
configuração já é realizada, inclusive com a conexão remota `upstream`,
não sendo necessário usar o comando abaixo.

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

<!-- -->

2.  Busque atualizações do repositório original:

    ``` bash
    git fetch upstream
    ```

<!-- -->

3.  Integre mudanças do `upstream/main` em sua `main` local

    ``` bash
    git merge upstream/main
    ```

<!-- -->

4.  Atualize seu fork no GitHub

    ``` bash
    git push origin main
    ```

### 4.2.3 Criando nova branch de feature

1.  Crie e mude para uma nova branch de feature:

    ``` bash
    git checkout -b nome-branch
    ```

<!-- -->

2.  **Se já tiver a branch** e ela foi criada anteriormente, faça um
    merge ou rebase para incorporá-la à versão atual:
    - Merge:

      ``` bash
      git checkout nome-branch
      git merge main
      ```

    - Rebase:

      ``` bash
      git checkout nome-branch
      git rebase main
      ```

> **Nota:** O `merge` cria um novo commit de mesclagem, enquanto o
> `rebase` reaplica seus commits sobre as mudanças da `main`. Use o
> método que preferir, levando em consideração o fluxo de trabalho da
> equipe.

### 4.2.4 Fazendo Alterações no Projeto e Comitando

Nesta etapa, faça as alterações necessárias no projeto, como modificar
arquivos, adicionar novos arquivos ou pastas:

- Modifique múltiplos arquivos em diferentes pastas.
- Crie novos arquivos conforme necessário.
- Exclua arquivos que não são mais necessários.
- Mantenha as alterações focadas na funcionalidade/correção em que está
  trabalhando.
- Realize commits frequentes para não perder o trabalho.

1.  Após realizar todas as modificações necessárias, verifique quais
    arquivos foram modificados:

    ``` bash
    git status
    ```

<!-- -->

2.  Verifique as alterações específicas em cada arquivo:

    ``` bash
    git diff nome-arquivo
    ```

<!-- -->

3.  Adicione as alterações à área de preparação (stage):

    - Específico:

      ``` bash
      git add nome-arquivo
      ```

    - Todos os arquivos:

      ``` bash
      git add .
      ```

4.  Salve as alterações em um commit:

    ``` bash
    git commit -m "Descrição das alterações"
    ```

<!-- -->

5.  Caso precise modificar o último commit (antes do push)

    ``` bash
    git commit --amend -m "Nova mensagem de commit"
    ```

### 4.2.5 Atualizando com Upstream Antes do PR

É muito importante fazer esta etapa para ter certeza de que você possui
a versão mais estável e atualizada em sua `main` local.

1.  Busque as últimas alterações do upstream:

    ``` bash
    git fetch upstream
    ```

<!-- -->

2.  Reaplique seus commits sobre a versão mais atual do `upstream`:

    ``` bash
    git rebase upstream/main
    ```

<!-- -->

3.  Envie sua branch atualizada para seu fork:

    ``` bash
    git push origin nome-branch
    ```

### 4.2.6 Criando e Gerenciando Pull Request (PR)

1.  Após ter feito o envio das atualizações, vá até a página do seu fork
    no GitHub e crie um Pull Request:

    - Clique no botão `Compare & Pull Request`. Outra forma de abrir a
      Pull Request seria ir na branch criada e clicar no botão
      `Contribute` e depois em em `Open pull request`;
    - Somente se necessário, adicione uma descrição mais detalhada
      explicando a Solicitação de Mudanças, pois a mensagem de commit
      pode ser insuficiente.

2.  Clique em “`Create Pull Request`” para submeter a solicitação de
    alteração e aguarde a mesclagem do mantenedor do repo.

3.  Após criar o PR:

    O proprietário **clica na mensagem da commit** para ver o que foi
    alterado no projeto. Surge os arquivos modificados, destacando as
    linhas mudadas. O **proprietário** pode tomar três decisões:

    - **Aprovar a `Pull Request`.** Basta clicar em **`Review changes`**
      e depois marca a oção **`Approve`** e então clica em
      **`Submit review`** para encerrar a revisão. Surgirá a janela de
      mesclar (Merge) a alteração com a main original. Clique em
      **`Merge Pull Request`** e depois em **`Confirme merge`** .

    - **Recusar a Pull request e** explicar porque recusou a
      modificação.

    - **Ou solicitar modificações**. Se o proprietário precisar
      solicitar modificações, alguns procedimentos específicos deverão
      ser tomados, conforme se segue:

      - **Para o Proprietário do Repositório que solicitas as alterações
        de código:**

        1.  **Revise e comente nas linhas**: Depois que acessar a PR,
            clique no nome do commit e o arquivo modificado será aberto.
            Observe as linhas a serem mudadas e clique no sinal de mais
            `+` azul. Escreva um comentário explicando o que precisa ser
            alterado no código e clique no botão **Start Review** para
            iniciar a revisão e fará com que a PR fique pendente
            (pending).

        2.  **Solicite alterações**: Para finalizar a solicitação de
            alterações, clique na seta ao lado do botão
            **`Finish your review`**. Uma nova janela se abre e deixe um
            comentário explicativo, marque a opção **`Request changes`**
            e clique em **`Submit review`**. Isso sinalizará ao
            colaborador que há ajustes a serem feitos antes da aprovação
            (mensagem de e-mail será enviadada com o comeentário da
            modificação a ser revisada), aparecendo também na sequência
            da Pull Request um botão de aviso chamado
            `Changes requested` de cor laranja. **Seja acessível para
            dúvidas**: Informe que o colaborador pode comentar no PR
            caso precise de esclarecimentos.

      - Para o **Colaborador que faz as modificações solicitadas:**

        1.  **Leia os comentários**: Revise os comentários e entenda o
            que precisa de ajustes nos códigos. Neste ponto, o
            colaborador não precisa mudar nada na Pull Request.

        2.  **Altere o código**: Faça as modificações na mesma branch
            criada antes em seu repositório local e realize todos os
            testes para ver se a funcionalidade foi alcançada ou o
            código foi corrigido. Salve os arquivos.

        3.  **Envie as mudanças para o PR**: Utilize os códigos abaixo
            para enviar as mudanças. Observe que será necessário outra
            commit para salvar as novas modificações.

            ``` bash
            # Faça as alterações necessárias 
            git add . 
            git commit -m "Ajustes conforme revisão do PR" 
            git push origin nome-branch
            ```

        4.  **Comente e finalize**: Se precisar de dar mais informações,
            use os comentários no PR para discutir e esclarecer pontos
            que você achou pertinente durante as alterações do código.

    Por fim, o proprietário do repositório verifica as correções
    clicando na nova commit desse Pull Request no Github; então, confere
    as mudanças e depois termina a revisão cliclando em
    **`Review changes`**, adicionando um comentário na janela que se
    abre, indicando se as modificações foram bem sucedidas. Depois,
    seleciona a opção **Approve** e clica em **`Submit Review`** para
    concluir. A janela do Pull Request se abrirá novamente, permitindo
    que o proprietário finalize o processo de mesclagem clicando em
    **`Merge Pull Request` e `Confirme merge`**.

### 4.2.7 Atualização da main `local` e `origin` após aprovação do PR

Depois que seu Pull Request (PR) for **revisado e aprovado pelos
mantenedores do projeto**, é importante realizar algumas etapas de
limpeza e organização no seu repositório local e remoto. Isso mantém seu
ambiente de trabalho organizado e sincronizado com o projeto principal.
Siga os comandos abaixo para atualizar suas branches e remover as que
não são mais necessárias:

1.  Retorne para a branch `main`:

    ``` bash
    git checkout main
    ```

<!-- -->

2.  Atualize sua `main` local com as mudanças do `upstream`:

    ``` bash
    git pull upstream main
    ```

<!-- -->

3.  Atualize a `main` do seu fork:

    ``` bash
    git push origin main
    ```

<!-- -->

4.  Remova a branch de funcionalidade localmente:

    ``` bash
    git branch -d nome-branch
    ```

<!-- -->

5.  Remova a branch de funcionalidade do seu fork remoto:

    ``` bash
    git push origin --delete nome-branch
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

Se você fez alterações em arquivos, mas não criou uma branch e nem as
comitou, e percebeu que deveria estar trabalhando em uma nova branch,
não se preocupe. É possível criar uma nova branch e mover suas
alterações para ela, sem perder nada. Veja como proceder:

## 5.1 Salvando Alterações Atuais

1.  Salve temporariamente suas alterações não commitadas:

    ``` bash
    git stash save "Alterações em progresso"
    ```

## 5.2 Atualizando Main e Criando Branch

1.  Busque atualizações do repositório original:

    ``` bash
    git fetch upstream # Ou ...
    git fetch origin
    ```

<!-- -->

2.  Integre as mudanças do `upstream`:

    ``` bash
    git merge upstream/main  # Ou ...
    git merge origin/main
    ```

<!-- -->

3.  Crie e mude para uma nova branch:

    ``` bash
    git checkout -b sua-branch
    ```

## 5.3 Recuperando Alterações

1.  Recupere as alterações salvas no stash:

    ``` bash
    git stash pop
    ```

## 5.4 Após Resolver Conflitos (se houver)

1.  Adicione os arquivos resolvidos ao stage:

    ``` bash
    git add .
    ```

<!-- -->

2.  Crie um commit com as alterações:

    ``` bash
    git commit -m "Descrição das alterações recuperadas"
    ```

<!-- -->

3.  Envie a branch para seu fork:

    ``` bash
    git push origin sua-branch
    ```

## 5.5 Criando Pull Request e Procedimentos Seguintes

Após enviar suas alterações para seu fork, passe para a parte de criar
um Pull Request no GitHub e siga os procedimentos conforme descrito
anteriormente para proprietários ([4.1.6. Criando e Gerenciando o Pull
Request (PR)](#criando-e-gerenciando-o-pull-request-pr)) ou
colaboradores ([4.2.6 Criando e Gerenciando Pull Request
(PR)](#criando-e-gerenciando-pull-request-pr)) do repositório.

------------------------------------------------------------------------

## 6. Apagando a Última Modificação Caso Haja Erro

Se ocorrer algum erro, é possível voltar ao estado anterior à
modificação. Você pode até reverter para um estado anterior mais
distante, mas é importante ter cuidado ao resetar commits mais antigos,
pois isso pode impactar o histórico do projeto. Mesmo que isso não seja
sempre necessário, é útil saber como proceder caso precise corrigir
algo.

### 6.1 Visualizar Histórico de Commits

Primeiro, você precisa verificar o histórico de commits e identificar o
ponto para o qual deseja reverter o projeto. Para isso, use o comando:

``` bash
git reflog
```

Esse comando exibirá uma lista com o histórico de commits e seus
identificadores (hashes), que são códigos alfanuméricos de 8 caracteres.
Identifique o commit anterior ao erro que você deseja corrigir.

## 6.2 Reverter ou Resetar o Último Commit

Para apagar a última modificação que foi mesclada (merged) em um projeto
usando Git, você tem algumas opções. Aqui está a forma mais segura de
fazer isso:

1.  Para reverter o último commit mesclado mantendo o histórico:

    ``` bash
    git revert HEAD
    ```

2.  Se você quer remover completamente o último commit (não recomendado
    se já foi compartilhado):

    ``` bash
    git reset --hard HEAD~1
    ```

**Importante:**

- `revert` é mais seguro pois cria um novo commit que desfaz as
  alterações
- `reset --hard` é mais arriscado pois apaga o histórico
- Se o commit já foi enviado para o repositório remoto (pushed), use
  `revert`
- Se for local e ainda não compartilhado, pode usar `reset`

### 6.3 Resetar para um Commit Anterior

Para voltar a um commit anterior, execute o seguinte comando,
substituindo o identificador do commit pelo hash correspondente:

``` bash
git reset --hard 7d0932f
```

Esse comando redefine o repositório local para o estado do commit
especificado, desfazendo qualquer alteração feita após ele. **Cuidado**:
isso removerá qualquer mudança não comitada.

### 6.4 Revertendo o Reset (Opcional)

Se você mudar de ideia e quiser restaurar o commit que acabou de
resetar, pode voltar atrás executando novamente o comando `git reflog` e
usando o identificador do commit que deseja recuperar:

``` bash
git reset --hard 5a6cc0a
```

### 6.5 Sincronizar com o Repositório Remoto

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

### 6.6 Considerações Importantes

- **Usar `git reset --hard` com cautela**: Esse comando remove
  permanentemente as alterações que não foram comitadas e pode alterar o
  histórico de commits.

- **Reverta apenas se necessário**: Antes de usar o `--force` para
  sobrescrever o repositório remoto, certifique-se de que isso não
  afetará o trabalho de outros colaboradores.

- **Alternativa com `git revert`**: Em vez de usar `reset --hard`, você
  pode usar `git revert` para desfazer alterações sem alterar o
  histórico. Isso cria um novo commit que desfaz as mudanças, mantendo a
  integridade do histórico de commits.

------------------------------------------------------------------------

## 7. Descartando Alterações em Arquivos Específicos

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
no staging area (prontos para serem commitados).

### 7.2 Descartar as Alterações em um Arquivo Específico

Se você deseja descartar todas as modificações feitas em um arquivo
específico e restaurá-lo ao estado do último commit, use o seguinte
comando:

``` bash
git checkout -- nome-do-arquivo
```

Esse comando descarta as alterações locais não commitadas no arquivo
especificado, retornando-o ao estado do último commit.

### 7.3 Remover Arquivos do Stage (Caso Estejam Preparados para Commit)

Se o arquivo já foi adicionado ao staging area (ou seja, preparado para
commit com `git add`), mas você quer removê-lo dessa área sem descartar
suas alterações, use o comando abaixo:

``` bash
git reset HEAD nome-do-arquivo
```

Esse comando remove o arquivo do staging area e desfaz o `git add`, mas
mantém as alterações feitas no arquivo. Isso é útil quando você quer
revisar ou modificar mais antes de commitá-lo.

------------------------------------------------------------------------

# 8. Boas Práticas Gerais e Comandos Úteis

### 8.1 Boas Práticas

- **Commits Pequenos e Frequentes**: Realize commits de maneira
  frequente e com descrições claras. Isso facilita a revisão do código e
  ajuda a identificar pontos de erro rapidamente.

- **Sincronize Regularmente**: Faça `git pull` regularmente antes de
  começar a trabalhar para garantir que você está com a versão mais
  recente do projeto. Isso evita conflitos e confusões.

- **Use Branches**: Sempre crie uma nova branch para implementar
  mudanças específicas, mantendo a branch `master` ou `main` estável.

- **Revisão de Código (Pull Requests)**: Utilize Pull Requests para
  revisar as alterações de forma colaborativa antes de mesclá-las à
  branch principal. Isso melhora a qualidade do código e reduz o risco
  de bugs.

- **Mensagens de Commit Claras e Descritivas**: Escreva mensagens de
  commit que descrevam claramente as alterações feitas.

- **Verifique Arquivos Temporários**: Certifique-se de não incluir
  arquivos temporários ou irrelevantes no commit.

- **Mantenha um `.gitignore` Atualizado**: Mantenha o arquivo
  `.gitignore` atualizado para evitar que arquivos desnecessários sejam
  incluídos no repositório.

- **Teste Suas Alterações**: Sempre teste suas alterações antes de
  realizar um commit.

- **Revise Suas Alterações Antes do Commit**: Faça uma revisão cuidadosa
  das alterações antes de commitá-las.

- **Desfazer Alterações em Arquivos Específicos**: Para desfazer
  alterações em arquivos específicos, consulte a seção 7. Descartando
  Alterações em Arquivos Específicos.

- **Desfazer o Último Commit (Antes do Push)**: Para desfazer o último
  commit antes do push, utilize:

  ``` bash
  git reset --soft HEAD~1
  ```

## 8.2 Comandos Úteis

- **Mostrar Estado Atual do Repositório**:

  ``` bash
  git status
  ```

- **Listar Todas as Branches Locais**:

  ``` bash
  git branch
  ```

- **Mostrar Todos os Repositórios Remotos Configurados**:

  ``` bash
  git remote -v
  ```

- **Exibir Histórico de Commits de Forma Resumida**:

  ``` bash
  git log --oneline
  ```

------------------------------------------------------------------------

# 9. Anexo de Criação do Arquivo README.Rmd

Recomendamos sempre criar um bom arquivo README para descrever bem seu
repositório. Para criar o `README.Rmd`, você pode usar a função
`usethis::use_readme_rmd()`. Mas o que há de tão especial em usar o
`README.Rmd` em vez de apenas o `README.md`?

### Benefícios do `README.Rmd`

Com o `README.Rmd`, você pode incluir tabelas e gráficos usando chunks
de código R, algo que não é possível diretamente no `README.md`. Veja um
exemplo de tabela gerada com código R:

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

Além de tabelas, você também pode incorporar gráficos. Por exemplo:

![](README_files/figure-gfm/pressure-1.png)<!-- -->

Esses recursos tornam o `README` mais dinâmico e informativo,
especialmente útil quando você deseja fornecer uma visão rápida e visual
dos dados ou do funcionamento do seu projeto.

> **Nota**: Você precisará renderizar o `README.Rmd` regularmente para
> manter o `README.md` atualizado. Não se esqueça de fazer o commit e
> enviar (`push`) os arquivos de figuras resultantes para que eles sejam
> exibidos corretamente no GitHub. Na etapa de versionamento, siga as
> orientações apropriadas, seja você o proprietário ou um colaborador do
> repositório.
