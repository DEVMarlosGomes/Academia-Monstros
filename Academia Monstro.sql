create database caverna_do_monstro; 
use caverna_do_monstro;

# Tabela: Membro -------------------------------------------------------------------------------
CREATE TABLE Membro (
    ID_Membro INT PRIMARY KEY,
    Nome VARCHAR(100),
    Data_Nascimento DATE,
    Endereco VARCHAR(200),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);


# Tabela: Plano---------------------------------------------------------------------------------
CREATE TABLE Plano (
    ID_Plano INT PRIMARY KEY,
    Nome_Plano VARCHAR(100),
    Tipo VARCHAR(50),
    Valor DECIMAL(10, 2)
);


# Tabela: Aula----------------------------------------------------------------------------------
CREATE TABLE Aula (
    ID_Aula INT PRIMARY KEY,
    Nome_Aula VARCHAR(100),
    Horario TIME,
    Duracao INT,
    Modalidade VARCHAR(100)
);


# Tabela: Instrutor-----------------------------------------------------------------------------
CREATE TABLE Instrutor (
    ID_Instrutor INT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100),
    Telefone VARCHAR(15)
);


# Tabela: Pagamento-----------------------------------------------------------------------------
CREATE TABLE Pagamento (
    ID_Pagamento INT PRIMARY KEY,
    Valor DECIMAL(10, 2),
    Data_Pagamento DATE,
    ID_Membro INT,
    ID_Plano INT,
    FOREIGN KEY (ID_Membro) REFERENCES Membro(ID_Membro),
    FOREIGN KEY (ID_Plano) REFERENCES Plano(ID_Plano)
);


# Tabela: Equipamento---------------------------------------------------------------------------
CREATE TABLE Equipamento (
    ID_Equipamento INT PRIMARY KEY,
    Nome_Equipamento VARCHAR(100),
    Quantidade INT,
    Status VARCHAR(50)
);


# Tabela: Membro_Plano (Relacionamento Membro - Plano)------------------------------------------
CREATE TABLE Membro_Plano (
    ID_Membro INT,
    ID_Plano INT,
    PRIMARY KEY (ID_Membro, ID_Plano),
    FOREIGN KEY (ID_Membro) REFERENCES Membro(ID_Membro),
    FOREIGN KEY (ID_Plano) REFERENCES Plano(ID_Plano)
);

# Tabela: Membro_Aula (Relacionamento Membro - Aula)--------------------------------------------
CREATE TABLE Membro_Aula (
    ID_Membro INT,
    ID_Aula INT,
    PRIMARY KEY (ID_Membro, ID_Aula),
    FOREIGN KEY (ID_Membro) REFERENCES Membro(ID_Membro),
    FOREIGN KEY (ID_Aula) REFERENCES Aula(ID_Aula)
);


# Tabela: Aula_Instrutor (Relacionamento Aula - Instrutor)--------------------------------------
CREATE TABLE Aula_Instrutor (
    ID_Aula INT,
    ID_Instrutor INT,
    PRIMARY KEY (ID_Aula),
    FOREIGN KEY (ID_Aula) REFERENCES Aula(ID_Aula),
    FOREIGN KEY (ID_Instrutor) REFERENCES Instrutor(ID_Instrutor)
);


# Tabela: Equipamento_Aula (Relacionamento Equipamento - Aula)----------------------------------
CREATE TABLE Equipamento_Aula (
    ID_Equipamento INT,
    ID_Aula INT,
    PRIMARY KEY (ID_Equipamento, ID_Aula),
    FOREIGN KEY (ID_Equipamento) REFERENCES Equipamento(ID_Equipamento),
    FOREIGN KEY (ID_Aula) REFERENCES Aula(ID_Aula)
);


# Índices para Tabelas---------------------------------------------------------------------------
-- Índice para Membro (Nome)
CREATE INDEX idx_membro_nome ON Membro (Nome);

-- Índice para Plano (Tipo)
CREATE INDEX idx_plano_tipo ON Plano (Tipo);

-- Índice para Aula (Horário)
CREATE INDEX idx_aula_horario ON Aula (Horario);

-- Índice para Pagamento (ID_Membro e ID_Plano)
CREATE INDEX idx_pagamento_membro_plano ON Pagamento (ID_Membro, ID_Plano);

-- Índice para relacionamento Membro - Aula
CREATE INDEX idx_membro_aula ON Membro_Aula (ID_Membro, ID_Aula);



use caverna_do_monstro;
DROP TABLE pagamento;

CREATE TABLE Pagamento (
    ID_Pagamento INT NOT NULL,
    Data_Pagamento DATE NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    ID_Membro INT NOT NULL,
    ID_Plano INT NOT NULL,
    PRIMARY KEY (ID_Pagamento, Data_Pagamento)
)
PARTITION BY RANGE (YEAR(Data_Pagamento)) (
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p2026 VALUES LESS THAN (2027)
);



# ADD Dados nas tabelas ------------------------------------------------------------------------

INSERT INTO Membro 
(ID_Membro, Nome, Data_Nascimento, Endereco, Telefone, Email) 
VALUES
(1, 'João Silva', '1990-05-15', 'Rua das Flores, 123', '(11) 98765-4321', 'joao.silva@email.com'),
(2, 'Maria Oliveira', '1985-08-22', 'Avenida Central, 456', '(11) 91234-5678', 'maria.oliveira@email.com'),
(3, 'Carlos Santos', '1993-03-10', 'Travessa das Palmeiras, 789', '(11) 99876-5432', 'carlos.santos@email.com');

INSERT INTO Plano 
(ID_Plano, Nome_Plano, Tipo, Valor) 
VALUES
(1, 'Plano Básico', 'Mensal', 99.90),
(2, 'Plano Premium', 'Anual', 999.00),
(3, 'Plano VIP', 'Semestral', 599.50);

INSERT INTO Aula 
(ID_Aula, Nome_Aula, Horario, Duracao, Modalidade) 
VALUES
(1, 'Yoga', '08:00:00', 60, 'Relaxamento'),
(2, 'Crossfit', '10:00:00', 45, 'Intensivo'),
(3, 'Pilates', '14:00:00', 50, 'Fortalecimento');

INSERT INTO Instrutor 
(ID_Instrutor, Nome, Especialidade, Telefone) 
VALUES
(1, 'Ana Costa', 'Yoga', '(11) 95432-1987'),
(2, 'Bruno Lima', 'Crossfit', '(11) 96543-2871'),
(3, 'Clara Souza', 'Pilates', '(11) 97654-3765');

INSERT INTO Pagamento 
(ID_Pagamento, Data_Pagamento, Valor, ID_Membro, ID_Plano) 
VALUES 
(1, '2024-05-10', 150.00, 1, 1);

INSERT INTO Pagamento 
(ID_Pagamento, Data_Pagamento, Valor, ID_Membro, ID_Plano) 
VALUES 
(2, '2025-05-10', 155.00, 2, 2),
(3, '2026-05-10', 160.00, 3, 3);

INSERT INTO Equipamento 
(ID_Equipamento, Nome_Equipamento, Quantidade, Status) 
VALUES
(1, 'Halteres', 20, 'Disponível'),
(2, 'Esteira', 5, 'Em Manutenção'),
(3, 'Bicicleta Ergométrica', 10, 'Disponível');

INSERT INTO Membro_Plano 
(ID_Membro, ID_Plano) 
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Membro_Aula 
(ID_Membro, ID_Aula) 
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Aula_Instrutor 
(ID_Aula, ID_Instrutor)
 VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Equipamento_Aula 
(ID_Equipamento, ID_Aula) 
VALUES
(1, 1),
(2, 2),
(3, 3);




select*from aula;
select*from aula_instrutor;
select*from equipamento;
select*from equipamento_aula; 
select*from instrutor;
select*from membro;
select*from membro_aula; 
select*from membro_plano; 
select*from pagamento;
select*from plano;
SELECT * FROM Pagamento WHERE Data_Pagamento BETWEEN '2025-01-01' AND '2025-12-31';



# Ateração de tabela aula_intrutor ------------------------------------------------------------
ALTER TABLE aula_instrutor
ADD COLUMN Nome_instrutor VARCHAR(20), 
ADD COLUMN Nome_aula VARCHAR(20);

# ADD nome por ID
UPDATE aula_instrutor ai
JOIN Instrutor i ON ai.ID_Instrutor = i.ID_Instrutor
SET ai.Nome_instrutor = i.Nome;


UPDATE aula_instrutor ai
JOIN Aula a ON ai.ID_Aula = a.ID_Aula
SET ai.Nome_aula = a.Nome_Aula;

# Ateração de tabela equipamento_aula ------------------------------------------------------------
ALTER TABLE equipamento_aula
ADD COLUMN Nome_equipamento VARCHAR(100), 
ADD COLUMN Nome_aula VARCHAR(100);

UPDATE equipamento_aula ea
JOIN Equipamento e ON ea.ID_Equipamento = e.ID_Equipamento
SET ea.Nome_equipamento = e.Nome_Equipamento;

UPDATE equipamento_aula ea
JOIN Aula a ON ea.ID_Aula = a.ID_Aula
SET ea.Nome_aula = a.Nome_Aula;

SELECT * FROM equipamento_aula;

# Ateração de tabela membro_aula ------------------------------------------------------------
ALTER TABLE membro_aula
ADD COLUMN Nome_membro VARCHAR(100), 
ADD COLUMN Nome_aula VARCHAR(100);

UPDATE membro_aula ma
JOIN Membro m ON ma.ID_Membro = m.ID_Membro
SET ma.Nome_membro = m.Nome;

UPDATE membro_aula ma
JOIN Aula a ON ma.ID_Aula = a.ID_Aula
SET ma.Nome_aula = a.Nome_Aula;


# Ateração de tabela membro_plano ------------------------------------------------------------
ALTER TABLE membro_plano
ADD COLUMN Nome_membro VARCHAR(100), 
ADD COLUMN Nome_plano VARCHAR(100);

UPDATE membro_plano mp
JOIN Membro m ON mp.ID_Membro = m.ID_Membro
SET mp.Nome_membro = m.Nome;

UPDATE membro_plano mp
JOIN Plano p ON mp.ID_Plano = p.ID_Plano
SET mp.Nome_plano = p.Nome_Plano;