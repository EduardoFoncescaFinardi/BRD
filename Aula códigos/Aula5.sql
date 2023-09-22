-- RENAME ESTUDANTE TO ALUNO;
DESC ALUNO;
RENAME ENDERECO_2 TO ENDERECO;

DROP TABLE ALUNO;

CREATE TABLE ALUNO (
    RA int primary key,
    nome_completo varchar(255),
    cpf varchar(15),
    cep int not null,
    sexo char(1) CHECK (sexo = 'f' OR sexo = 'm'),
    CONSTRAINT fk_aluno_endereco
        FOREIGN KEY (cep) REFERENCES endereco(cep)
);


--INSERT (ESPECÍFICO)
INSERT INTO ALUNO (RA,NOME_COMPLETO)
    VALUES (1,'José Carlos');
    
INSERT INTO ALUNO VALUES
    (2, 'Eduardo Finardi','111.333.444-55',01529040, 'm');

INSERT INTO ENDERECO (CEP, RUA, CIDADE)
    VALUES (01529040, 'AV LINS DE VASC.', 'SÃO PAULO');
        

--SELECT (GENÉRICO)
SELECT * FROM ALUNO;
SELECT * FROM ENDERECO;
--DELETE (GENÉRICO)

UPDATE ALUNO SET 
    nome_completo = 'Luciana Santos'
    WHERE RA = 2 AND SEXO = 'm';
    
    
UPDATE ALUNO SET 
    nome_completo = 'Luciana Santos'
    WHERE RA = 2 OR SEXO = 'm';
    
DELETE FROM ALUNO WHERE RA = 3;

DELETE FROM ALUNO;
