--Criação do banco de dados 
CREATE DATABASE tLibrary;

--Selecionar o banco de dados para uso
USE tLibrary;

--Criação da tabela Livros com ID auto-incrementado
CREATE TABLE Livros (
    livro_id INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(255),
    autor VARCHAR(255),
    genero VARCHAR(100),
    ano_publicacao INT
);

--Criação da tabela Usuarios com ID auto-incrementado, nome e email
CREATE TABLE Usuarios (
    usuario_id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(255),
    email VARCHAR(255)
);

--Criação da tabela Emprestimos com FK referenciando Livros e Usuarios, além de campos de data
CREATE TABLE Emprestimos (
    emprestimo_id INT PRIMARY KEY IDENTITY(1,1),
    livro_id INT,
    usuario_id INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES Livros(livro_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);

--Inserção de livros na tabela Livros
INSERT INTO Livros (titulo, autor, genero, ano_publicacao)
VALUES 
('Dom Casmurro', 'Machado de Assis', 'Romance', 1899),
('Os Lusíadas', 'Luís de Camões', 'Épico', 1572),
('O Guarani', 'José de Alencar', 'Romance', 1857),
('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'Romance', 1881),
('Grande Sertão: Veredas', 'João Guimarães Rosa', 'Romance', 1956),
('Capitães da Areia', 'Jorge Amado', 'Romance', 1937);

--Inserção de usuários 
INSERT INTO Usuarios (nome, email)
VALUES 
('Pedro Bala', 'pedrobala.capitaes@areia.com'),
('Professor', 'professor.capitaes@areia.com'),
('Sem-Pernas', 'sempernas.capitaes@areia.com'),
('Gato', 'gato.capitaes@areia.com');

--Inserção de empréstimos com referência a livros e usuários existentes
INSERT INTO Emprestimos (livro_id, usuario_id, data_emprestimo)
VALUES (1, 1, '2024-02-01'),
       (2, 2, '2024-07-02'),
       (3, 3, '2024-04-03'),
       (4, 4, '2024-09-04');

--Consulta para recuperar todos os registros da tabela Livros
SELECT * FROM Livros;

--Atualização do título de um livro específico (livro_id = 1)
UPDATE Livros
SET titulo = 'Dom Casmurro (Edição Especial)'
WHERE livro_id = 1;

--Deleção de um livro específico (livro_id = 5)
DELETE FROM Livros WHERE livro_id = 5;

--Consulta para verificar todos os empréstimos que ainda não possuem data de devolução
SELECT Livros.titulo, Usuarios.nome, Emprestimos.data_emprestimo
FROM Emprestimos
JOIN Livros ON Emprestimos.livro_id = Livros.livro_id
JOIN Usuarios ON Emprestimos.usuario_id = Usuarios.usuario_id
WHERE Emprestimos.data_devolucao IS NULL;

--Consulta para verificar os livros atualmente emprestados e os usuários correspondentes
SELECT Livros.titulo, Usuarios.nome, Emprestimos.data_emprestimo
FROM Emprestimos
JOIN Livros ON Emprestimos.livro_id = Livros.livro_id
JOIN Usuarios ON Emprestimos.usuario_id = Usuarios.usuario_id
WHERE Emprestimos.data_devolucao IS NULL;

--Consulta para listar usuários com mais de 2 empréstimos usando uma subquery
SELECT Usuarios.nome
FROM Usuarios
WHERE (SELECT COUNT(*) FROM Emprestimos WHERE Emprestimos.usuario_id = Usuarios.usuario_id) > 2;
