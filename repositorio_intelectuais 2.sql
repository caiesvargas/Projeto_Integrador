-- ============================================
-- REPOSITÓRIO DE INTELECTUAIS
-- ============================================

CREATE DATABASE IF NOT EXISTS repositorio_intelectuais
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE repositorio_intelectuais;

-- ============================================
-- EXCLUSÃO DAS TABELAS
-- ============================================

DROP TABLE IF EXISTS intelectual_grupo;
DROP TABLE IF EXISTS obras;
DROP TABLE IF EXISTS grupos;
DROP TABLE IF EXISTS intelectuais;
DROP TABLE IF EXISTS areas;

-- ============================================
-- TABELA DE ÁREAS
-- ============================================

CREATE TABLE areas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- ============================================
-- TABELA DE INTELECTUAIS
-- ============================================

CREATE TABLE intelectuais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    area_id INT NOT NULL,
    dificuldades TEXT NULL,
    FOREIGN KEY (area_id) REFERENCES areas(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ============================================
-- TABELA DE GRUPOS
-- ============================================

CREATE TABLE grupos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- ============================================
-- TABELA DE OBRAS
-- ============================================

CREATE TABLE obras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    intelectual_id INT NOT NULL,
    titulo VARCHAR(500) NOT NULL,
    decada VARCHAR(30) NULL,
    link VARCHAR(1000) NULL,
    FOREIGN KEY (intelectual_id) REFERENCES intelectuais(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ============================================
-- TABELA DE RELAÇÃO INTELECTUAL/GRUPO
-- ============================================

CREATE TABLE intelectual_grupo (
    intelectual_id INT NOT NULL,
    grupo_id INT NOT NULL,
    PRIMARY KEY (intelectual_id, grupo_id),
    FOREIGN KEY (intelectual_id) REFERENCES intelectuais(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (grupo_id) REFERENCES grupos(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ============================================
-- ÁREAS
-- ============================================

INSERT INTO areas (nome) VALUES ('Ciência');
INSERT INTO areas (nome) VALUES ('Economia');
INSERT INTO areas (nome) VALUES ('Economia / Finanças');
INSERT INTO areas (nome) VALUES ('Educação');
INSERT INTO areas (nome) VALUES ('Educação / Filosofia');
INSERT INTO areas (nome) VALUES ('Saúde');
INSERT INTO areas (nome) VALUES ('Sociedade');
INSERT INTO areas (nome) VALUES ('Tecnologia');

-- ============================================
-- GRUPOS
-- ============================================

INSERT INTO grupos (nome) VALUES ('Classe popular');
INSERT INTO grupos (nome) VALUES ('LGBTQIAPN+');
INSERT INTO grupos (nome) VALUES ('Mulher');
INSERT INTO grupos (nome) VALUES ('Pessoa de pele negra');
INSERT INTO grupos (nome) VALUES ('Povos originários');

-- ============================================
-- 1. ANÍSIO TEIXEIRA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Anísio Teixeira', id, 'Falta de investimento na educação pública'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Educação Não é Privilégio', '1950',
       'http://educa.fcc.org.br/pdf/rbedu/n14/n14a15.pdf'
FROM intelectuais
WHERE nome = 'Anísio Teixeira'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Anísio Teixeira'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 2. PAULO FREIRE
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Paulo Freire', id, 'Perseguição política, exílio durante a ditadura militar'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Pedagogia do Oprimido', '1960/1970',
       'https://shre.ink/jVpY'
FROM intelectuais
WHERE nome = 'Paulo Freire'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Paulo Freire'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 3. DARCY RIBEIRO
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Darcy Ribeiro', id, 'Resistência a reformas educacionais'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'A Universidade Necessária', '1960',
       'https://www.redalyc.org/pdf/938/93842306.pdf'
FROM intelectuais
WHERE nome = 'Darcy Ribeiro'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Darcy Ribeiro'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 4. LÉLIA GONZALEZ
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Lélia Gonzalez', id, 'Racismo e sexismo na academia e na produção de conhecimento'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Por um feminismo amefricano', '1980',
       'https://shre.ink/jVpS'
FROM intelectuais
WHERE nome = 'Lélia Gonzalez'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Lélia Gonzalez'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Lélia Gonzalez'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 5. NILMA LINO GOMES
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Nilma Lino Gomes', id, 'Racismo estrutural, baixa representatividade na academia'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Educação, Identidade Negra e Formação de Professores', '2000',
       'https://www.scielo.br/j/ep/a/sGzxY8WTnyQQbwjG5nSQpK/?lang=pt'
FROM intelectuais
WHERE nome = 'Nilma Lino Gomes'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Nilma Lino Gomes'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Nilma Lino Gomes'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 6. PETRONILHA BEATRIZ GONÇALVES E SILVA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Petronilha Beatriz Gonçalves e Silva', id, 'Resistência institucional'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Educação das Relações Étnico-Raciais', '2000/2010',
       'https://www.scielo.br/j/er/a/xggQmhcWSYPJWFbND/?format=html&lang=pt'
FROM intelectuais
WHERE nome = 'Petronilha Beatriz Gonçalves e Silva'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Petronilha Beatriz Gonçalves e Silva'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Petronilha Beatriz Gonçalves e Silva'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 7. DANIEL MUNDURUKU
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Daniel Munduruku', id, 'Preconceito contra saberes tradicionais e invisibilização cultural'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'O Banquete dos Deuses', '2000',
       'https://shre.ink/jVfw'
FROM intelectuais
WHERE nome = 'Daniel Munduruku'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Povos originários'
WHERE i.nome = 'Daniel Munduruku'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 8. MIGUEL ARROYO
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Miguel Arroyo', id, 'Desigualdade social e escolar'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Ofício de Mestre', '2000',
       'https://shre.ink/jVfD'
FROM intelectuais
WHERE nome = 'Miguel Arroyo'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Miguel Arroyo'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 9. GENI NÚÑEZ
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Geni Núñez', id, 'Invisibilização de saberes indígenas e resistência acadêmica'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Descolonizando afetos: Experimentações sobre racismo e não-monogamia a partir de perspectivas não-ocidentais', '2020',
       'https://shre.ink/jVfp'
FROM intelectuais
WHERE nome = 'Geni Núñez'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Povos originários'
WHERE i.nome = 'Geni Núñez'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 10. AILTON KRENAK
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Ailton Krenak', id, 'Discriminação contra povos indígenas e exclusão dos conhecimentos tradicionais'
FROM areas WHERE nome = 'Educação / Filosofia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Ideias para Adiar o Fim do Mundo', '2010',
       'https://shre.ink/jVfl'
FROM intelectuais
WHERE nome = 'Ailton Krenak'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Povos originários'
WHERE i.nome = 'Ailton Krenak'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 11. MEGG RAYARA GOMES DE OLIVEIRA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Megg Rayara Gomes de Oliveira', id, 'Racismo e transfobia na trajetória escolar e acadêmica'
FROM areas WHERE nome = 'Educação';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'O Diabo em forma de gente', '2010',
       'https://shre.ink/jVlN'
FROM intelectuais
WHERE nome = 'Megg Rayara Gomes de Oliveira'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'LGBTQIAPN+'
WHERE i.nome = 'Megg Rayara Gomes de Oliveira'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 12. ABDIAS DO NASCIMENTO
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Abdias do Nascimento', id, 'Racismo estrutural'
FROM areas WHERE nome = 'Sociedade';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Genocídio do Negro Brasileiro', '1970',
       'https://shre.ink/jVlC'
FROM intelectuais
WHERE nome = 'Abdias do Nascimento'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Abdias do Nascimento'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 13. CLÓVIS MOURA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Clóvis Moura', id, 'Resistência eurocêntrica historiográfica e marginalização do pensamento crítico negro'
FROM areas WHERE nome = 'Sociedade';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Rebeliões da Senzala', '1950/1980',
       'https://shre.ink/jV13'
FROM intelectuais
WHERE nome = 'Clóvis Moura'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Clóvis Moura'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 14. SUELI CARNEIRO
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Sueli Carneiro', id, 'Racismo e sexismo na produção intelectual brasileira'
FROM areas WHERE nome = 'Sociedade';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'A Construção do Outro como Não Ser', '2000',
       'https://repositorio.usp.br/item/001465832'
FROM intelectuais
WHERE nome = 'Sueli Carneiro'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Sueli Carneiro'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Sueli Carneiro'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 15. MILTON SANTOS
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Milton Santos', id, 'Pouca valorização do pensamento crítico'
FROM areas WHERE nome = 'Sociedade';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Por uma Outra Globalização', '2000',
       'https://shre.ink/jVib'
FROM intelectuais
WHERE nome = 'Milton Santos'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Milton Santos'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 16. DJAMILA RIBEIRO
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Djamila Ribeiro', id, 'Ataques e discriminação racial'
FROM areas WHERE nome = 'Sociedade';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Lugar de Fala', '2010',
       'https://shre.ink/jVlf'
FROM intelectuais
WHERE nome = 'Djamila Ribeiro'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Djamila Ribeiro'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Djamila Ribeiro'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 17. JESSÉ SOUZA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Jessé Souza', id, 'Crítica severa da grande mídia e forte resistência nos círculos sociológicos tradicionais'
FROM areas WHERE nome = 'Sociedade';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'A Elite do Atraso / A Ralé Brasileira', '2010',
       'https://shre.ink/jVrJ'
FROM intelectuais
WHERE nome = 'Jessé Souza'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Jessé Souza'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 18. OSWALDO CRUZ
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Oswaldo Cruz', id, 'Resistência da população e vulnerabilidade social'
FROM areas WHERE nome = 'Saúde';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Campanhas de Saneamento', '1900',
       'https://www.ioc.fiocruz.br/personalidades/oswaldo-goncalves-cruz?utm_source'
FROM intelectuais
WHERE nome = 'Oswaldo Cruz'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Oswaldo Cruz'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 19. SÉRGIO AROUCA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Sérgio Arouca', id, 'Limitações do sistema de saúde pública'
FROM areas WHERE nome = 'Saúde';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'O Dilema Preventivista', '1970',
       'https://shre.ink/jVrX'
FROM intelectuais
WHERE nome = 'Sérgio Arouca'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Sérgio Arouca'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 20. ZILDA ARNS
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Zilda Arns', id, 'Pobreza extrema e mortalidade infantil'
FROM areas WHERE nome = 'Saúde';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Fundação da Pastoral da Criança', '1980',
       'https://www.scielo.br/j/ea/a/g76YJN48rdrT6TJr3ZRnCFq/?lang=pt'
FROM intelectuais
WHERE nome = 'Zilda Arns'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Zilda Arns'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 21. DRAUZIO VARELLA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Drauzio Varella', id, 'Divulgação científica limitada e estigma social'
FROM areas WHERE nome = 'Saúde';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Obras sobre prevenção de doenças e saúde prisional', '1990',
       'https://www.scielosp.org/article/physis/2016.v26n4/1429-1439/pt/'
FROM intelectuais
WHERE nome = 'Drauzio Varella'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Drauzio Varella'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 22. JUREMA WERNECK
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Jurema Werneck', id, 'Racismo institucional na saúde e na pesquisa médica'
FROM areas WHERE nome = 'Saúde';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Saúde da População Negra', '2010',
       'https://www.scielosp.org/article/sausoc/2016.v25n3/535-549/pt/'
FROM intelectuais
WHERE nome = 'Jurema Werneck'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Jurema Werneck'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Jurema Werneck'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 23. MARGARETH DALCOLMO
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Margareth Dalcolmo', id, 'Desinformação científica e vulnerabilidade de classes baixas'
FROM areas WHERE nome = 'Saúde';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Pesquisas e estudos sobre COVID-19', '2020',
       'https://periodicoscientificos.itp.ifsp.edu.br/index.php/rifp/pt_BR/article/view/179'
FROM intelectuais
WHERE nome = 'Margareth Dalcolmo'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Margareth Dalcolmo'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 24. CARLOS CHAGAS
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Carlos Chagas', id, 'Falta de recursos e foco em doenças negligenciadas de populações vulneráveis'
FROM areas WHERE nome = 'Ciência';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Descoberta da Doença de Chagas', '1900',
       'https://apct.sede.embrapa.br/cct/article/view/8895'
FROM intelectuais
WHERE nome = 'Carlos Chagas'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Carlos Chagas'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 25. BERTHA LUTZ
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Bertha Lutz', id, 'Machismo na ciência e exclusão institucional'
FROM areas WHERE nome = 'Ciência';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Brazilian Species of Hyla', '1920',
       'https://repositories.lib.utexas.edu/items/576b8537-8f47-43c5-8a0f-9070e5c45494'
FROM intelectuais
WHERE nome = 'Bertha Lutz'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Bertha Lutz'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 26. JOHANNA DÖBEREINER
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Johanna Döbereiner', id, 'Baixa valorização da pesquisa aplicada e preconceito de gênero'
FROM areas WHERE nome = 'Ciência';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Potential for Nitrogen Fixation in Maize Genotypes in Brazil', '1970',
       'https://www.pnas.org/doi/epdf/10.1073/pnas.72.6.2389'
FROM intelectuais
WHERE nome = 'Johanna Döbereiner'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Johanna Döbereiner'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 27. MAYANA ZATZ
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Mayana Zatz', id, 'Limitações de financiamento e barreiras de gênero nas ciências duras'
FROM areas WHERE nome = 'Ciência';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Clonagem de células-tronco', '2000',
       'https://www.scielo.br/j/ea/a/sDtmSJfCv3cYLjcDg94NW4n/?format=html&lang=pt'
FROM intelectuais
WHERE nome = 'Mayana Zatz'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Mayana Zatz'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 28. JAQUELINE GOES DE JESUS
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Jaqueline Goes de Jesus', id, 'Racismo, machismo, sub-representação de mulheres de pele negra nas ciências de ponta'
FROM areas WHERE nome = 'Ciência';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Artigo sobre sequenciamento do SARS-CoV-2 no Brasil', '2020',
       'https://www.scielo.br/j/mioc/a/GHKc6RS5VyJJmCKmsBYgCgt/?lang=en'
FROM intelectuais
WHERE nome = 'Jaqueline Goes de Jesus'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Jaqueline Goes de Jesus'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Jaqueline Goes de Jesus'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 29. MARIA DA CONCEIÇÃO TAVARES
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Maria da Conceição Tavares', id, 'Machismo institucional acadêmico e repressão/perseguição política'
FROM areas WHERE nome = 'Economia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Ciclo e Crise: Capitalismo de Estado no Brasil', '1970',
       'https://www.scielo.br/j/rep/a/LfqSgPmXDRDrbTrWdxXXNWG/?lang=pt'
FROM intelectuais
WHERE nome = 'Maria da Conceição Tavares'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Maria da Conceição Tavares'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 30. LUIZA BAIRROS
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Luiza Bairros', id, 'Racismo estrutural na economia de mercado e barreiras de dados'
FROM areas WHERE nome = 'Economia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Inserção do Negro no Mercado de Trabalho', '1980/1990',
       'https://shre.ink/jVjf'
FROM intelectuais
WHERE nome = 'Luiza Bairros'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Luiza Bairros'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Luiza Bairros'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 31. LAURA CARVALHO
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Laura Carvalho', id, 'Resistência ao pensamento heterodoxo e machismo nos debates macroeconômicos'
FROM areas WHERE nome = 'Economia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Valsa Brasileira: Do boom ao caos econômico', '2010',
       'https://shre.ink/jVjd'
FROM intelectuais
WHERE nome = 'Laura Carvalho'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Laura Carvalho'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 32. VILMA PINTO
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Vilma Pinto', id, 'Falta de representatividade no topo das instituições de análise fiscal, racismo e machismo institucional'
FROM areas WHERE nome = 'Economia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Estudos e Análises sobre Política Fiscal e Orçamento', '2020',
       'https://repositorio.fgv.br/server/api/core/bitstreams/37ab6c0d-6e2d-48f2-9869-2cf56b4c5696/content'
FROM intelectuais
WHERE nome = 'Vilma Pinto'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Vilma Pinto'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Vilma Pinto'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 33. NATHALIA RODRIGUES (NATH FINANÇAS)
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Nathalia Rodrigues (Nath Finanças)', id, 'Elitismo no mercado de finanças, falta de fomento e barreiras de linguagem técnica para as classes baixas'
FROM areas WHERE nome = 'Economia / Finanças';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Sem Falhas', '2020',
       'https://shre.ink/jVGu'
FROM intelectuais
WHERE nome = 'Nathalia Rodrigues (Nath Finanças)'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Nathalia Rodrigues (Nath Finanças)'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Nathalia Rodrigues (Nath Finanças)'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Classe popular'
WHERE i.nome = 'Nathalia Rodrigues (Nath Finanças)'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 34. SÔNIA GUIMARÃES
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Sônia Guimarães', id, 'Racismo e machismo extremos na física tecnológica e áreas militares/aeroespaciais'
FROM areas WHERE nome = 'Tecnologia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Produção do conhecimento científico e inovação: desafios do novo padrão de desenvolvimento', '2010',
       'https://www.scielo.br/j/ccrh/a/nhhHBSt5nKCmrTmBzBHKXVH/?format=html&lang=pt'
FROM intelectuais
WHERE nome = 'Sônia Guimarães'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Sônia Guimarães'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Sônia Guimarães'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 35. ALMIR SURUÍ
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Almir Suruí', id, 'Isolamento tecnológico, falta de recursos e ameaças de invasores / violência no campo'
FROM areas WHERE nome = 'Tecnologia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Projeto de Monitoramento Tecnológico de Terras com o Google Earth', '2000',
       'https://www.google.com/intl/pt-BR/earth/outreach/success-stories/chief-almir-and-the-surui-tribe-of-the-amazon/'
FROM intelectuais
WHERE nome = 'Almir Suruí'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Povos originários'
WHERE i.nome = 'Almir Suruí'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 36. SILVANA BAHIA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Silvana Bahia', id, 'Exclusão, machismo e racismo estrutural na área de TI e ecossistema de inovação'
FROM areas WHERE nome = 'Tecnologia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Códigos Negros', '2010',
       'https://www.e-publicacoes.uerj.br/arcosdesign/article/view/95367'
FROM intelectuais
WHERE nome = 'Silvana Bahia'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Silvana Bahia'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Silvana Bahia'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 37. NINA DA HORA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Nina da Hora', id, 'Sub-representação, racismo estrutural e ataques na internet ao debater ética em IA'
FROM areas WHERE nome = 'Tecnologia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Pensamento Computacional e Crítica do Racismo Algorítmico', '2020',
       'https://www.e-publicacoes.uerj.br/arcosdesign/article/view/95285'
FROM intelectuais
WHERE nome = 'Nina da Hora'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Mulher'
WHERE i.nome = 'Nina da Hora'
ORDER BY i.id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Nina da Hora'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- 38. TARCÍZIO SILVA
-- ============================================

INSERT INTO intelectuais (nome, area_id, dificuldades)
SELECT 'Tarcízio Silva', id, 'Resistência corporativa das Big Techs e desvalorização do debate sobre vieses raciais'
FROM areas WHERE nome = 'Tecnologia';

INSERT INTO obras (intelectual_id, titulo, decada, link)
SELECT id, 'Racismo Algorítmico: Inteligência Artificial e Discriminação nas Redes', '2020',
       'https://books.google.com.br/books?hl=pt-BR&lr=&id=BCZcEAAAQBAJ&oi=fnd&pg=PT3&dq=Racismo+Algor%C3%ADtmico%3A+Intelig%C3%AAncia+Artificial+e+Discrimina%C3%A7%C3%A3o+nas+Redes&ots=Gd5iaXG0nV&sig=l6Azkgwmj0PdpXeFLi4o6gypqh4&redir_esc=y'
FROM intelectuais
WHERE nome = 'Tarcízio Silva'
ORDER BY id DESC LIMIT 1;

INSERT INTO intelectual_grupo (intelectual_id, grupo_id)
SELECT i.id, g.id
FROM intelectuais i
JOIN grupos g ON g.nome = 'Pessoa de pele negra'
WHERE i.nome = 'Tarcízio Silva'
ORDER BY i.id DESC LIMIT 1;

-- ============================================
-- CONSULTAS DE TESTE
-- ============================================

-- Ver todos os intelectuais:
SELECT *
FROM intelectuais
ORDER BY id ASC;

-- Ver intelectuais + obras + links:
SELECT
    i.id,
    i.nome,
    o.titulo,
    o.decada,
    o.link
FROM intelectuais i
JOIN obras o ON o.intelectual_id = i.id
ORDER BY i.id ASC;