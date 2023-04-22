# Revisando o Bash 📖
Alguns scripts em bash para gestão de acesso nativa, gerenciamento de arquivos e remoção de diretórios :)

## 💡 1º Gerenciamento de Identidade com Linux usando a imagem do Conectiva
### O que o script faz? ⭐
1. O usuário administrador faz login com seu nome de usuário e senha.
2. O menu é exibido com as opções de identificar um usuário, criar um usuário, apagar um usuário ou sair.
3. Ao selecionar a opção de identificar um usuário, o usuário insere o nome do usuário que deseja pesquisar e o sistema verifica se ele existe. Se existir, o sistema exibe informações sobre o usuário, como o ID do usuário e o nome do usuário. Se não existir, o sistema sugere a criação de um novo usuário.
4. Ao selecionar a opção de criar um usuário, o usuário insere o nome do novo usuário e o sistema cria uma nova conta de usuário com a senha solicitada.
5. Ao selecionar a opção de apagar um usuário, o usuário insere o nome do usuário que deseja remover e o sistema verifica se ele existe. Se existir, o sistema remove o usuário e seu diretório home.
6. Ao selecionar a opção de sair, o usuário pode escolher entre encerrar o sistema ou retornar ao menu principal.
### Pré requisitos e informações importantes ⭐
- O arquivo do script deve ter permissões de execução, que podem ser definidas usando o comando **`chmod +x nome_do_arquivo.sh`**
- O script foi desenvolvido no VIM do Conectiva.
- O usuário que executar o script deve ter permissões de administrador ou sudo.
