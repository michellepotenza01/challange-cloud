-- ============================================================
-- Script de criação do Banco de Dados - MottuAPI
-- Equipe: 
Ana Carolina de Castro Gonçalves - RM 554669
Luísa Danielle - RM 555292
Michelle Marques Potenza - RM 557702
-- ============================================================

-- =========================
-- Tabela FUNCIONARIOS
-- =========================
CREATE TABLE tab_funcionarios (
    id_funcionario BIGINT IDENTITY PRIMARY KEY, -- Identificador único do funcionário
    nome_usuario NVARCHAR(100) NOT NULL,        -- Nome de usuário (login)
    email NVARCHAR(150) NOT NULL,               -- Email corporativo
    senha NVARCHAR(200) NOT NULL                -- Senha de acesso
);

-- =========================
-- Tabela PATIOS
-- =========================
CREATE TABLE tab_patios (
    id_patio BIGINT IDENTITY PRIMARY KEY,       -- Identificador único do pátio
    localizacao NVARCHAR(200) NOT NULL,         -- Endereço/descrição da localização
    quantidade_vagas INT NOT NULL,              -- Quantidade de vagas disponíveis
    id_funcionario BIGINT NOT NULL,             -- FK para funcionário responsável
    CONSTRAINT fk_patio_funcionario FOREIGN KEY (id_funcionario)
        REFERENCES tab_funcionarios(id_funcionario)
);

-- =========================
-- Tabela MOTOS
-- =========================
CREATE TABLE tab_motos (
    id_moto BIGINT IDENTITY PRIMARY KEY,        -- Identificador único da moto
    modelo NVARCHAR(100) NOT NULL,              -- Modelo da moto
    placa NVARCHAR(20) NOT NULL UNIQUE,         -- Placa (única)
    status NVARCHAR(50) NOT NULL,               -- Status: disponível, alugada, manutenção
    setor NVARCHAR(50) NOT NULL,                -- Setor: bom, intermediário, ruim
    id_patio BIGINT NOT NULL,                   -- FK para o pátio
    CONSTRAINT fk_moto_patio FOREIGN KEY (id_patio)
        REFERENCES tab_patios(id_patio)
);

-- =========================
-- Tabela CLIENTES
-- =========================
CREATE TABLE tab_clientes (
    id_cliente BIGINT IDENTITY PRIMARY KEY,     -- Identificador único do cliente
    nome NVARCHAR(150) NOT NULL,                -- Nome completo
    email NVARCHAR(150) NOT NULL,               -- Email do cliente
    cpf NVARCHAR(20) NOT NULL UNIQUE,           -- CPF (único)
    telefone NVARCHAR(20),                      -- Telefone de contato
    data_nascimento DATE,                       -- Data de nascimento
    id_moto BIGINT UNIQUE,                      -- FK para moto (1:1)
    CONSTRAINT fk_cliente_moto FOREIGN KEY (id_moto)
        REFERENCES tab_motos(id_moto)
);

-- ============================================================
-- Observações:
-- 1. Relacionamentos:
--    - Funcionario 1:N Pátio
--    - Pátio 1:N Moto
--    - Moto 1:1 Cliente
-- 2. Constraints UNIQUE aplicadas em placa (Moto) e cpf (Cliente)
-- 3. Campos NOT NULL definidos onde são obrigatórios
-- ============================================================
