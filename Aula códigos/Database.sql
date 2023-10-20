DROP TABLE Pedidos;
DROP TABLE Clientes;
DROP TABLE Funcionarios;
-- Cria a tabela "Clientes"
CREATE TABLE Clientes (
    ID NUMBER(5) PRIMARY KEY,
    Nome VARCHAR2(255),
    Cidade VARCHAR2(255),
    Sexo VARCHAR2(1),
    idade int
);

-- Insercao de dados na tabela "Clientes"
 INSERT INTO Clientes VALUES (1, 'JoÃ£o', 'SÃ£o Paulo','M',20);
 INSERT INTO Clientes VALUES (7, 'Maria', 'Rio de Janeiro','F',30);
 INSERT INTO Clientes VALUES (3, 'Carlos', 'Belo Horizonte','M',20);
 INSERT INTO Clientes VALUES (4, 'Ana', 'SÃ£o Paulo','F',25);
 INSERT INTO Clientes VALUES (5, 'Rafael', 'Rio de Janeiro','M',50);

-- Cria a tabela "Pedidos"
CREATE TABLE Pedidos (
    id NUMBER(5) PRIMARY KEY,
    cliente_id NUMBER(5),
    ds_produto VARCHAR2(255),
    vl_pedido Number,
	FOREIGN KEY (cliente_id) REFERENCES 
		Clientes (id)
);

-- Insercao de dados na tabela "Pedidos"
INSERT INTO Pedidos VALUES(101, 1, 'Celular', 1100.00);
INSERT INTO Pedidos VALUES(102, 7, 'Laptop', 4000.00);
INSERT INTO Pedidos VALUES(103, 3, 'Tablet', 3500.00);
INSERT INTO Pedidos VALUES(104, 1, 'TV', 5000.00);
INSERT INTO Pedidos VALUES(105, 4, 'Geladeira', 3000.00);


CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Supervisor_ID INT
);


INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES (1, 'JoÃ£o', NULL); -- Joï¿½o ï¿½ o chefe e nï¿½o tem supervisor
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (8, 'Maria', 1); -- Maria ï¿½ subordinada a Joï¿½o
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (3, 'Carlos', 1); -- Carlos ï¿½ subordinado a Joï¿½o
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (4, 'Ana', 2);    -- Ana ï¿½ subordinada a Maria
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (5, 'Rafael', 2); -- Rafael ï¿½ subordinado a Maria

SELECT * FROM CLIENTES ORDER BY nome ASC;
SELECT * FROM CLIENTES ORDER BY nome DESC;

-- EQUI JOIN
SELECT C.NOME, P.DS_PRODUTO
FROM CLIENTES C, PEDIDOS P
WHERE C.ID = P.CLIENTE_ID;

SELECT C.NOME, P.DS_PRODUTO
FROM CLIENTES C INNER JOIN PEDIDOS P
ON C.ID = P.CLIENTE_ID;

SELECT CIDADE 
FROM CLIENTES;

SELECT CIDADE 
FROM CLIENTES 
GROUP BY CIDADE;

SELECT 
    AVG(IDADE), -- MÉDIA POR IDADE
    MAX(IDADE), -- MAIOR IDADE
    MIN(IDADE), -- MENOR IDADE
    SUM(IDADE), -- SOMA DAS IDADES
    STDDEV(IDADE), -- DESVIO PADRÃO DAS IDADES
    COUNT(NOME) -- QTD DE CLIENTES
FROM CLIENTES;

CREATE VIEW media_idade_cliente AS
SELECT C.NOME, AVG(C.IDADE) AS MEDIA_IDADE
FROM CLIENTES C
GROUP BY C.NOME
HAVING AVG(C.IDADE)>25;

SELECT * FROM media_idade_cliente

CREATE SEQUENCE SEQ_CLIENTES
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 1000
    NOCYCLE; --NÃO REPETIR(NOCYCLE) REPETIR(CYCLE)
    
-- REMOVENDO A SEQUENCE
DROP SEQUENCE SEQ_CLIENTES;

-- CONSULTANDO A SEQUENCE
SELECT SEQ_CLIENTES.NEXTVAL FROM DUAL;

-- EXEMPLO INSERT COM SEQUENCE
INSERT INTO CLIENTES VALUES 
(SEQ_CLIENTES.NEXTVAL,'José','São Paulo','m',20);

SELECT * FROM CLIENTES;

-- CRIANDO A INDEX
CREATE INDEX idx_clientes ON CLIENTES (NOME);

-- REMOVENDO A INDEX
DROP INDEX idx_clientes;