# Sistema de Gerenciamento de Livros - Biblioteca Télos

Este repositório contém o código SQL para a criação e manipulação de um sistema de gerenciamento de livros para uma biblioteca fictícia, Biblioteca TÉLOS. O sistema permite realizar operações como empréstimo e devolução de livros, além de gerenciar o catálogo de livros e os registros de usuários. 

Este projeto foi proposto pelo mentor **[Renato Rodrigo Chinaglia](https://www.linkedin.com/in/rodrigochinaglia)**, do **programa Afro Digital da [Télos Conecta](https://www.telosconecta.com)**.

## Estrutura do Banco de Dados

O banco de dados consiste em três tabelas principais:

### 1. Livros (Livros)
- **livro_id**: ID único do livro (chave primária, autoincrementada).
- **titulo**: Título do livro.
- **autor**: Autor do livro.
- **genero**: Gênero do livro.
- **ano_publicacao**: Ano de publicação do livro.

### 2. Usuários (Usuarios)
- **usuario_id**: ID único do usuário (chave primária, autoincrementada).
- **nome**: Nome do usuário.
- **email**: Email do usuário.

### 3. Empréstimos (Emprestimos)
- **emprestimo_id**: ID único do empréstimo (chave primária, autoincrementada).
- **livro_id**: ID do livro emprestado (chave estrangeira, referenciando Livros).
- **usuario_id**: ID do usuário que realizou o empréstimo (chave estrangeira, referenciando Usuarios).
- **data_emprestimo**: Data do empréstimo.
- **data_devolucao**: Data da devolução.

## Funcionalidades

1. **Gerenciamento de Livros**:
   - Adicionar novos livros ao catálogo.
   - Atualizar informações de livros existentes.
   - Excluir livros do catálogo.
   - Buscar livros no catálogo por título, autor ou gênero.

2. **Gerenciamento de Usuários**:
   - Adicionar novos usuários.
   - Atualizar informações de usuários existentes.
   - Excluir usuários.
   - Buscar usuários por nome ou email.

3. **Empréstimo de Livros**:
   - Registrar empréstimos de livros.
   - Registrar devoluções de livros.
   - Verificar a disponibilidade de um livro antes de realizar um empréstimo.

4. **Relatórios**:
   - Gerar relatórios de livros emprestados e devolvidos.
   - Gerar relatórios de livros atualmente emprestados.
   - Gerar relatórios de usuários com mais empréstimos.



## Autor
Desenvolvido por **Gustavo Martins**. Você pode entrar em contato comigo através do [LinkedIn](https://www.linkedin.com/in/gustavo-henrique-martins-1b031929b/).
