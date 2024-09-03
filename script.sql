CREATE DATABASE IF NOT EXISTS books_co;

USE books_co;

CREATE TABLE Fornecedores (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    CNPJ VARCHAR(20) NOT NULL UNIQUE,
    Contato VARCHAR(100)
);

CREATE TABLE Livros (
    idLivro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(255) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Quantidade INT NOT NULL,
    idFornecedor INT,
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedores(idFornecedor)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Telefone VARCHAR(20)
);

CREATE TABLE Vendas (
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    idCliente INT,
    Total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE ItensVenda (
    idItem INT AUTO_INCREMENT PRIMARY KEY,
    idVenda INT,
    idLivro INT,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idVenda) REFERENCES Vendas(idVenda)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO Fornecedores (Nome, CNPJ, Contato) VALUES
('Fornecedor A', '12.345.678/0001-99', 'contatoA@fornecedor.com'),
('Fornecedor B', '98.765.432/0001-11', 'contatoB@fornecedor.com');


INSERT INTO Livros (Titulo, Autor, Preco, Quantidade, idFornecedor) VALUES
('Livro 1', 'Fulano da Silva', 59.00, 50, 1),
('Livro 2', 'Fulano de Souza', 45.00, 30, 1),
('Livro 3', 'Fulano Azevedo', 75.00, 20, 2),
('Livro 4', 'Fulano Neves', 85.00, 15, 2);


INSERT INTO Clientes (Nome, Email, Telefone) VALUES
('Ciclano da Silva', 'ciclano.dasilva@exemplo.com', '43999999999'),
('Ciclano de Souza', 'ciclano.desouza@exemplo.com', '43999998888'),
('Ciclano Vieira', 'ciclano.vieira@exemplo.com', '43999997777');


INSERT INTO Vendas (Data, idCliente, Total) VALUES
('2024-08-30', 1, 120.00),
('2024-08-30', 2, 75.00),
('2024-08-29', 3, 85.00);


INSERT INTO ItensVenda (idVenda, idLivro, Quantidade, PrecoUnitario) VALUES
(1, 1, 2, 59.00),  -- Venda 1: 2 x 'Livro 1'
(1, 2, 1, 45.00),  -- Venda 1: 1 x 'Livro 2'
(2, 3, 1, 75.00),  -- Venda 2: 1 x 'Livro 3'
(3, 4, 1, 85.00);  -- Venda 3: 1 x 'Livro 4'
