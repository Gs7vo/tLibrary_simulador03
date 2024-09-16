-- Criacao do banco de dados
CREATE DATABASE tLibrary;

-- Selecao do banco
USE tLibrary;

-- Tabela Livros
CREATE TABLE Livros (
    livro_id INT PRIMARY KEY IDENTITY(1,1),  
    titulo VARCHAR(255) NOT NULL,  
    autor VARCHAR(255) NOT NULL,   
    genero VARCHAR(100) NOT NULL,  
    ano_publicacao INT NOT NULL    
);

-- Tabela Usuarios
CREATE TABLE Usuarios (
    usuario_id INT PRIMARY KEY IDENTITY(1,1),  
    nome VARCHAR(255) NOT NULL,  
    email VARCHAR(255) NOT NULL  
);

-- Tabela de Emprestimos
CREATE TABLE Emprestimos (
    emprestimo_id INT PRIMARY KEY IDENTITY(1,1),  
    livro_id INT NOT NULL,  
    usuario_id INT NOT NULL,  
    data_emprestimo DATE NOT NULL DEFAULT GETDATE(),  
    data_devolucao DATE NULL,  
    FOREIGN KEY (livro_id) REFERENCES Livros(livro_id) ON DELETE CASCADE,  
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id) ON DELETE CASCADE 
);

-- Insercao de alguns livros iniciais na tabela Livros
INSERT INTO Livros (titulo, autor, genero, ano_publicacao)
VALUES 
('Post Office', 'Charles Bukowski', 'Literatura Contemporanea', 1971),
('Eu e Outras Poesias', 'Augusto dos Anjos', 'Poesia', 1912),
('Sapiens: Uma Breve Historia da Humanidade', 'Yuval Noah Harari', 'Historia', 2011),
('Cosmos', 'Carl Sagan', 'Divulgacao Cientifica', 1980),
('Grande Sertao: Veredas', 'Joao Guimaraes Rosa', 'Romance', 1956),
('Capitaes da Areia', 'Jorge Amado', 'Romance', 1937);

-- Insercao de usuarios
INSERT INTO Usuarios (nome, email)
VALUES 
('Pedro Bala', 'pedrobala.capitaes@areia.com'),
('Joao Grande', 'joaogrande.capitaes@areia.com'),
('Sem-Pernas', 'sempernas.capitaes@areia.com'),
('Sinha', 'sinha.capitaes@areia.com');

-- Insercao de emprestimos iniciais
INSERT INTO Emprestimos (livro_id, usuario_id, data_emprestimo)
VALUES 
(1, 1, GETDATE()),  
(2, 2, GETDATE()),  
(3, 3, GETDATE()),  
(4, 4, GETDATE()); 

-- Mais emprestimos para o usuario 'Sem-Pernas'
INSERT INTO Emprestimos (livro_id, usuario_id, data_emprestimo)
VALUES 
(5, 3, GETDATE()), 
(6, 3, GETDATE());  

-- Adicao de um novo livro
INSERT INTO Livros (titulo, autor, genero, ano_publicacao)
VALUES ('A Arte da Guerra', 'Maquiavel', 'Taticas de Guerra', 1532);

-- Adicao de um novo usuario
INSERT INTO Usuarios (nome, email)
VALUES ('Gustavo', 'gustavo@email.com');

-- Atualizacao do titulo de um livro existente
UPDATE Livros
SET titulo = 'Post Office (Edicao Especial)'
WHERE livro_id = 1;

-- Atualizacao do nome e email de um usuario
UPDATE Usuarios
SET nome = 'Pedro Bala (Capitao)', email = 'pedro.capitao@areia.com'
WHERE usuario_id = 1;

-- Atualizacao do genero e ano de publicacao de um livro
UPDATE Livros
SET genero = 'Romance Contemporaneo', ano_publicacao = 1972
WHERE livro_id = 1;

-- Exclusao de um livro 
DELETE FROM Livros WHERE livro_id = 4;

-- Exclusao de um usuario, o que tambem removera seus emprestimos
DELETE FROM Usuarios WHERE usuario_id = 4;

-- Relatorio de todos os livros
SELECT * FROM Livros;

-- Consulta por genero de livros
SELECT * FROM Livros WHERE genero = 'Romance';

-- Consulta por titulo de livro 
SELECT * FROM Livros WHERE titulo LIKE '%Capitaes da Areia%';

-- Consulta por autor
SELECT * FROM Livros WHERE autor LIKE '%Charles Bukowski%';

-- Relatorio de todos os livros atualmente emprestados, quem emprestou e a data
SELECT Livros.titulo, Usuarios.nome, Emprestimos.data_emprestimo
FROM Emprestimos
JOIN Livros ON Emprestimos.livro_id = Livros.livro_id
JOIN Usuarios ON Emprestimos.usuario_id = Usuarios.usuario_id
WHERE Emprestimos.data_devolucao IS NULL;

-- Relatorio de usuarios com 3 ou mais emprestimos
SELECT u.nome 
FROM Usuarios u
WHERE (SELECT COUNT(*) FROM Emprestimos e WHERE e.usuario_id = u.usuario_id) >= 3;

-- Funcao para calcular o numero total de emprestimos de um usuario especifico
CREATE FUNCTION TotalLoans (@user_id INT)
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM Emprestimos WHERE usuario_id = @user_id);
END;

-- Relatorio de livros emprestados
SELECT Livros.titulo, Usuarios.nome, Emprestimos.data_emprestimo
FROM Emprestimos
JOIN Livros ON Emprestimos.livro_id = Livros.livro_id
JOIN Usuarios ON Emprestimos.usuario_id = Usuarios.usuario_id
WHERE Emprestimos.data_devolucao IS NULL;

-- Relatorio de usuarios com mais emprestimos, ordenado por quantidade de emprestimos
SELECT Usuarios.nome, COUNT(*) AS total_emprestimos
FROM Emprestimos
JOIN Usuarios ON Emprestimos.usuario_id = Usuarios.usuario_id
GROUP BY Usuarios.nome
ORDER BY total_emprestimos DESC;

-- Registro da devolucao de um livro
UPDATE Emprestimos
SET data_devolucao = GETDATE()
WHERE emprestimo_id = 2;

-- Verificacao da devolucao registrada
SELECT * FROM Emprestimos WHERE emprestimo_id = 2;

-- Verificacao de disponibilidade de um livro antes de realizar um novo emprestimo
SELECT CASE
    WHEN EXISTS (
        SELECT 1 FROM Emprestimos
        WHERE livro_id = 2 AND data_devolucao IS NULL
    )
    THEN 'Indisponivel'
    ELSE 'Disponivel'
END AS disponibilidade;
