# Sistema de Gerenciamento de Livros - Biblioteca Télos

Este repositório contém o código SQL para a criação e manipulação de um sistema de gerenciamento de livros para a biblioteca fictícia **Télos Library**. O sistema permite realizar operações como empréstimo e devolução de livros, além de gerenciar o catálogo de livros e os registros de usuários.

Este projeto foi proposto pelo mentor **[Renato Rodrigo Chinaglia](https://www.linkedin.com/in/rodrigochinaglia)**, com mentoria do **[Vinícius Penha](https://www.linkedin.com/in/vinicius12)** do **programa Afro Digital da [Télos Conecta](https://www.telosconecta.com)**.

## Estrutura do Banco de Dados

O banco de dados `tLibrary` é composto pelas seguintes tabelas:


- **Livros**: Armazena informações sobre os livros, incluindo título, autor, gênero e ano de publicação.
- **Usuarios**: Armazena informações sobre os usuários, incluindo nome e email.
- **Emprestimos**: Registra os empréstimos dos livros pelos usuários, com referências às tabelas de livros e usuários. Inclui informações sobre a data do empréstimo e a data de devolução.

## Funcionalidades

- **Inserção de Livros e Usuários**: Permite adicionar novos livros e usuários ao sistema.
- **Empréstimos e Devoluções**: Registra os empréstimos e devoluções de livros, atualizando o estado do empréstimo conforme necessário.
- **Atualizações e Exclusões**: Permite atualizar informações sobre livros e usuários, bem como excluir registros, com a devida remoção de dados relacionados.
- **Relatórios e Consultas**: Gera relatórios detalhados e realiza consultas para listar livros, usuários e registros de empréstimos, incluindo a busca por gênero, título e autor de livros, além de identificar usuários com múltiplos empréstimos.

## Autor

**Gustavo Martins**. Você pode entrar em contato comigo através do [LinkedIn](https://www.linkedin.com/in/gustavo-henrique-martins-1b031929b/).
