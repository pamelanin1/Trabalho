create database Hotel;
use Hotel;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(50),
    CPF VARCHAR(15) UNIQUE,
    Email VARCHAR(100)
);

CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    DataEntrada DATE NOT NULL,
    DataSaida DATE NOT NULL,
    ValorTotal DOUBLE,
    Stats VARCHAR(20),
    fk_id_cliente INT NOT NULL,
    FOREIGN KEY (fk_id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    DataPagamento DATE NOT NULL,
    ValorPago DOUBLE NOT NULL,
    FormaPagamento VARCHAR(50),
    fk_id_reserva INT NOT NULL,
    FOREIGN KEY (fk_id_reserva) REFERENCES Reserva(id_reserva)
);

CREATE TABLE Tipo_Quarto (
    id_tipo_quarto INT PRIMARY KEY AUTO_INCREMENT,
    NomeTipo VARCHAR(50) NOT NULL,
    ValorDiaria DOUBLE,
    DescricaoTipo VARCHAR(255)
);

CREATE TABLE Quarto (
    id_quarto INT PRIMARY KEY AUTO_INCREMENT,
    Numero VARCHAR(10) NOT NULL,
    Descricao VARCHAR(255),
    Stats VARCHAR(20),
    fk_id_tipo_quarto INT NOT NULL,
    FOREIGN KEY (fk_id_tipo_quarto) REFERENCES Tipo_Quarto(id_tipo_quarto)
);

CREATE TABLE Registro_Ocupacao (
    id_registro_ocupacao INT PRIMARY KEY AUTO_INCREMENT,
    DataOcupacao DATE NOT NULL,
    Stats VARCHAR(20),
    fk_id_reserva INT NOT NULL,
    fk_id_quarto INT NOT NULL,
    FOREIGN KEY (fk_id_reserva) REFERENCES Reserva(id_reserva),
    FOREIGN KEY (fk_id_quarto) REFERENCES Quarto(id_quarto)
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    NomeServico VARCHAR(100) NOT NULL,
    Valor DOUBLE,
    Descricao VARCHAR(255)
);

CREATE TABLE Item_Servico (
    id_item_servico INT PRIMARY KEY AUTO_INCREMENT,
    Quantidade INT NOT NULL,
    ValorItem DOUBLE,
    fk_id_reserva INT NOT NULL,
    fk_id_servico INT NOT NULL,
    FOREIGN KEY (fk_id_reserva) REFERENCES Reserva(id_reserva),
    FOREIGN KEY (fk_id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE Recebe (
    id_reserva INT NOT NULL,
    id_item_servico INT NOT NULL,
    PRIMARY KEY (id_reserva, id_item_servico),
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
    FOREIGN KEY (id_item_servico) REFERENCES Item_Servico(id_item_servico)
);

CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(50),
    Email VARCHAR(100),
    CPF VARCHAR(15) UNIQUE,
    Cargo VARCHAR(100),
    fk_id_departamento INT,
    FOREIGN KEY (fk_id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    NomeDepartamento VARCHAR(100) NOT NULL
);

CREATE TABLE Presta (
    id_funcionario INT NOT NULL,
    id_servico INT NOT NULL,
    PRIMARY KEY (id_funcionario, id_servico),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

INSERT INTO Departamento (NomeDepartamento) VALUES
('Recepção'), ('Limpeza'), ('Cozinha'), ('Manutenção'), ('Administração'),
('Eventos'), ('TI'), ('Serviços Gerais'), ('Atendimento VIP'), ('Lazer'),
('Piscina'), ('Lavanderia'), ('Compras'), ('Financeiro'), ('Marketing'),
('Concierge'), ('Segurança'), ('Jardinagem'), ('RH'), ('Transportes');

INSERT INTO Cliente (Nome, Telefone, CPF, Email) VALUES
('Ana Silva', '69988880001', '723.456.789-01', 'ana@gmail.com'),
('Bruno Costa', '69988880002', '523.456.789-02', 'bruno@gmail.com'),
('Carla Souza', '69988880003', '423.456.789-03', 'carla@gmail.com'),
('Daniel Rocha', '69988880004', '623.456.789-04', 'daniel@gmail.com'),
('Eduarda Martins', '69988880005', '923.456.789-05', 'eduarda@gmail.com'),
('Felipe Santos', '69988880006', '023.456.789-06', 'felipe@gmail.com'),
('Gabriela Dias', '69988880007', '223.456.789-07', 'gabi@gmail.com'),
('Hugo Pereira', '69988880008', '823.456.789-08', 'hugo@gmail.com'),
('Isabela Ramos', '69988880009', '233.456.789-09', 'isabela@gmail.com'),
('João Pedro', '69988880010', '753.456.789-10', 'joao@gmail.com'),
('Karina Lopes', '69988880011', '323.456.789-11', 'karina@gmail.com'),
('Lucas Almeida', '69988880012', '193.456.789-12', 'lucas@gmail.com'),
('Mariana Castro', '69988880013', '153.456.789-13', 'mariana@gmail.com'),
('Nicolas Freitas', '69988880014', '223.456.789-14', 'nicolas@gmail.com'),
('Olivia Andrade', '69988880015', '926.456.789-15', 'olivia@gmail.com'),
('Paulo Gomes', '69988880016', '525.456.789-16', 'paulo@gmail.com'),
('Quelia Tavares', '69988880017', '633.456.789-17', 'quelia@gmail.com'),
('Ricardo Lima', '69988880018', '224.456.789-18', 'ricardo@gmail.com'),
('Sabrina Faria', '69988880019', '123.456.789-19', 'sabrina@gmail.com'),
('Thiago Moura', '69988880020', '123.456.789-20', 'thiago@gmail.com');

INSERT INTO Reserva (DataEntrada, DataSaida, ValorTotal, Stats, fk_id_cliente) VALUES
('2025-01-01','2025-01-05',1200,'Confirmada',1),
('2025-01-03','2025-01-06',850,'Paga',2),
('2025-01-10','2025-01-15',2000,'Confirmada',3),
('2025-01-12','2025-01-16',950,'Cancelada',4),
('2025-02-01','2025-02-05',1800,'Paga',5),
('2025-02-03','2025-02-07',1100,'Pendente',6),
('2025-02-10','2025-02-12',600,'Confirmada',7),
('2025-02-12','2025-02-14',550,'Paga',8),
('2025-03-01','2025-03-04',900,'Pendente',9),
('2025-03-05','2025-03-10',2100,'Paga',10),
('2025-03-12','2025-03-15',780,'Confirmada',11),
('2025-03-20','2025-03-25',2500,'Confirmada',12),
('2025-04-01','2025-04-03',500,'Cancelada',13),
('2025-04-05','2025-04-09',1300,'Paga',14),
('2025-04-10','2025-04-13',700,'Pendente',15),
('2025-04-15','2025-04-20',1600,'Paga',16),
('2025-05-01','2025-05-05',1450,'Confirmada',17),
('2025-05-02','2025-05-06',1700,'Paga',18),
('2025-05-08','2025-05-11',930,'Pendente',19),
('2025-05-10','2025-05-14',1900,'Confirmada',20);


INSERT INTO Pagamento (DataPagamento, ValorPago, FormaPagamento, fk_id_reserva) VALUES
('2025-01-05',1200,'Crédito',1),
('2025-01-06',850,'Débito',2),
('2025-01-15',2000,'Pix',3),
('2025-02-01',1800,'Crédito',5),
('2025-02-07',1100,'Dinheiro',6),
('2025-02-12',600,'Pix',7),
('2025-02-14',550,'Débito',8),
('2025-03-04',900,'Crédito',9),
('2025-03-10',2100,'Pix',10),
('2025-03-15',780,'Pix',11),
('2025-03-25',2500,'Crédito',12),
('2025-04-09',1300,'Débito',14),
('2025-04-20',1600,'Crédito',16),
('2025-05-05',1450,'Pix',17),
('2025-05-06',1700,'Pix',18),
('2025-05-11',930,'Crédito',19),
('2025-05-14',1900,'Débito',20),
('2025-04-13',700,'Crédito',15),
('2025-03-06',850,'Débito',4),
('2025-03-21',500,'Dinheiro',13);


INSERT INTO Tipo_Quarto (NomeTipo, ValorDiaria, DescricaoTipo) VALUES
('Standard',120,'Quarto simples'),
('Luxo',200,'Quarto com varanda'),
('Premium',250,'Com vista para o mar'),
('Master',300,'Quarto grande'),
('Suíte',350,'Com banheira'),
('Econômico',90,'Simples e barato'),
('Executivo',220,'Para viagens de negócios'),
('Vip',400,'Alto padrão'),
('Família',260,'Para até 5 pessoas'),
('Romântico',280,'Decoração especial'),
('Standard Plus',150,'Intermediário'),
('Compacto',80,'Bem pequeno'),
('Deluxe',330,'Luxo especial'),
('Residencial',500,'Quarto enorme'),
('Hostel',60,'Cama em dormitório'),
('Studio',180,'Moderno'),
('Chalé',350,'Casa pequena'),
('Cabana',320,'Estilo rústico'),
('Loft',270,'Estilo industrial'),
('Super Luxo',600,'Altíssimo padrão');

INSERT INTO Quarto (Numero, Descricao, Stats, fk_id_tipo_quarto) VALUES
('101','Quarto 101','Livre',1),
('102','Quarto 102','Ocupado',2),
('103','Quarto 103','Livre',3),
('104','Quarto 104','Manutenção',4),
('105','Quarto 105','Ocupado',5),
('106','Quarto 106','Livre',6),
('107','Quarto 107','Ocupado',7),
('108','Quarto 108','Livre',8),
('109','Quarto 109','Ocupado',9),
('110','Quarto 110','Livre',10),
('201','Quarto 201','Livre',11),
('202','Quarto 202','Ocupado',12),
('203','Quarto 203','Manutenção',13),
('204','Quarto 204','Livre',14),
('205','Quarto 205','Ocupado',15),
('206','Quarto 206','Livre',16),
('207','Quarto 207','Livre',17),
('208','Quarto 208','Ocupado',18),
('209','Quarto 209','Livre',19),
('210','Quarto 210','Ocupado',20);


INSERT INTO Registro_Ocupacao (DataOcupacao, Stats, fk_id_reserva, fk_id_quarto) VALUES
('2025-01-01','Ativo',1,1),
('2025-01-03','Ativo',2,2),
('2025-01-10','Ativo',3,3),
('2025-01-12','Cancelado',4,4),
('2025-02-01','Ativo',5,5),
('2025-02-03','Ativo',6,6),
('2025-02-10','Ativo',7,7),
('2025-02-12','Ativo',8,8),
('2025-03-01','Ativo',9,9),
('2025-03-05','Ativo',10,10),
('2025-03-12','Ativo',11,11),
('2025-03-20','Ativo',12,12),
('2025-04-01','Cancelado',13,13),
('2025-04-05','Ativo',14,14),
('2025-04-10','Ativo',15,15),
('2025-04-15','Ativo',16,16),
('2025-05-01','Ativo',17,17),
('2025-05-02','Ativo',18,18),
('2025-05-08','Ativo',19,19),
('2025-05-10','Ativo',20,20);


INSERT INTO Servico (NomeServico, Valor, Descricao) VALUES
('Café da manhã',30,'Buffet'),
('Lavanderia',20,'Lavagem de roupas'),
('Spa',150,'Massagem completa'),
('Piscina',50,'Acesso diário'),
('Academia',40,'Uso livre'),
('Translado',80,'Aeroporto-hotel'),
('Estacionamento',25,'Diária'),
('Sala de Reuniões',200,'Uso corporativo'),
('Bar',60,'Com bebidas'),
('Restaurante',100,'Menu completo'),
('Babá',120,'Cuidados infantis'),
('Passeio Turístico',300,'Passeio pela cidade'),
('Aluguel de Bicicleta',25,'Por 2 horas'),
('Wi-Fi Premium',15,'Alta velocidade'),
('Pet Care',50,'Cuidado com pets'),
('Cofre Digital',10,'Uso diário'),
('Cinema Privado',200,'Sala exclusiva'),
('Drink de Boas Vindas',15,'Recepção'),
('Serviço de Quarto',30,'Atendimento no quarto'),
('Banheira de Hidromassagem',250,'Sessão privada');


INSERT INTO Item_Servico (Quantidade, ValorItem, fk_id_reserva, fk_id_servico) VALUES
(2,60,1,1),
(1,50,2,2),
(3,180,3,3),
(4,100,4,4),
(2,300,5,5),
(1,40,6,6),
(1,20,7,7),
(2,240,8,8),
(1,80,9,9),
(1,200,10,10),
(1,100,11,11),
(2,140,12,12),
(1,300,13,13),
(1,250,14,14),
(3,30,15,15),
(2,40,16,16),
(1,15,17,17),
(1,25,18,18),
(1,40,19,19),
(1,500,20,20);


INSERT INTO Recebe (id_reserva, id_item_servico) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20);


INSERT INTO Funcionario (Nome, Telefone, Email, CPF, Cargo, fk_id_departamento) VALUES
('Carlos Mendes','69970010001','carlos@hotel.com','753.159.421-02','Gerente',1),
('Joana Dias','69970010002','joana@hotel.com','842.953.751-55','Recepcionista',2),
('Pedro Lima','69970010003','pedro@hotel.com','426.513.597-63','Camareiro',3),
('Mariana Souza','69970010004','mariana@hotel.com','865.945.623-56','Cozinheira',4),
('Roberto Reis','69970010005','roberto@hotel.com','624.415.456-45','Manutenção',5),
('Fernanda Dias','69970010006','fernanda@hotel.com','231.213.268-22','Atendente',6),
('Tatiane Silva','69970010007','tatiane@hotel.com','789.456.123-15','Supervisora',7),
('Rafael Gomes','69970010008','rafael@hotel.com','458.159.147-01','Motorista',8),
('Julia Faria','69970010009','julia@hotel.com','963.852.741-09','Analista',9),
('Caio Torres','69970010010','caio@hotel.com','758.754.256-44','Recepcionista',10),
('Marcelo Dantas','69970010011','marcelo@hotel.com','331.112.225-13','Auxiliar',11),
('Viviane Lopes','69970010012','viviane@hotel.com','000.801.392-64','Analista RH',12),
('Gustavo Silva','69970010013','gustavo@hotel.com','023.412.861-65','Chef',13),
('Tatiana Silva','69970010014','tati@hotel.com','000.715.663-39','Segurança',14),
('Diego Santos','69970010015','diego@hotel.com','011.338.988.04','Instrutor',15),
('Estela Rocha','69970010016','estela@hotel.com','110.220.330-59','Gerente',16),
('Renato Moreira','69970010017','renato@hotel.com','900.800.700-60','Técnico',17),
('Karla Lopes','69970010018','karla@hotel.com','556.665.775-85','Faxineira',18),
('Paula Nunes','69970010019','paula@hotel.com','101.202.303-04','Lavadeira',19),
('Hélio Castro','69970010020','helio@hotel.com','505.606.808-70','Serviços Gerais',20);

INSERT INTO Presta (id_funcionario, id_servico) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20);


-- Listar reservas com nome do cliente (INNER JOIN)
SELECT r.id_reserva, c.Nome, r.DataEntrada, r.DataSaida, r.ValorTotal
FROM Reserva as r INNER JOIN Cliente as c ON r.fk_id_cliente = c.id_cliente;

-- Mostrar todos os quartos e seus tipos (INNER JOIN)
SELECT q.Numero, q.Stats, t.NomeTipo, t.ValorDiaria
FROM Quarto as q INNER JOIN Tipo_Quarto as t ON q.fk_id_tipo_quarto = t.id_tipo_quarto;

-- Listar pagamentos com os dados da reserva e cliente (INNER JOIN em 3 tabelas)
SELECT p.id_pagamento, p.ValorPago, r.DataEntrada, c.Nome
FROM Pagamento as p INNER JOIN Reserva as r ON p.fk_id_reserva = r.id_reserva
INNER JOIN Cliente as c ON r.fk_id_cliente = c.id_cliente;

-- Mostrar todos os clientes e suas reservas, incluindo clientes sem reservas (LEFT JOIN)
SELECT c.Nome, r.id_reserva, r.DataEntrada, r.Stats
FROM Cliente as c LEFT JOIN Reserva as r ON c.id_cliente = r.fk_id_cliente;

-- Mostrar serviços prestados com funcionário, incluindo serviços sem funcionário (RIGHT JOIN)
SELECT f.Nome AS Funcionario, s.NomeServico
FROM Presta as p RIGHT JOIN Servico as s ON p.id_servico = s.id_servico
LEFT JOIN Funcionario as f ON p.id_funcionario = f.id_funcionario;

-- Listar clientes que fizeram reservas acima de R$ 1500
SELECT Nome, Email FROM Cliente
WHERE id_cliente IN (SELECT fk_id_cliente FROM Reserva WHERE ValorTotal > 1500);

-- Mostrar reservas cujo valor pago é igual ao valor total da reserva
SELECT id_reserva, ValorTotal FROM Reserva
WHERE ValorTotal = (SELECT ValorPago FROM Pagamento WHERE fk_id_reserva = Reserva.id_reserva);

-- Exibir serviços cujo valor é maior que a média dos serviços
SELECT NomeServico, Valor FROM Servico 
WHERE Valor > (SELECT AVG(Valor) FROM Servico);

-- Total de reservas por cliente (GROUP BY)
SELECT c.Nome, COUNT(r.id_reserva) AS QuantidadeReservas
FROM Cliente as c INNER JOIN Reserva as r ON c.id_cliente = r.fk_id_cliente
GROUP BY c.id_cliente;

-- Média do valor das reservas por status, exibindo apenas valores acima de 1000 (GROUP BY + HAVING)
SELECT Stats, AVG(ValorTotal) AS MediaValor
FROM Reserva GROUP BY Stats HAVING AVG(ValorTotal) > 1000;










