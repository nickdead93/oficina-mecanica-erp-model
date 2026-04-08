CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR,
    telefone VARCHAR
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY,
    id_cliente INT,
    placa VARCHAR,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Equipe (
    id_equipe INT PRIMARY KEY,
    nome_equipe VARCHAR
);

CREATE TABLE Mecanico (
    codigo_mecanico INT PRIMARY KEY,
    id_equipe INT,
    nome VARCHAR,
    especialidade VARCHAR,
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE Peca (
    id_peca INT PRIMARY KEY,
    descricao VARCHAR,
    valor_unitario DECIMAL
);

CREATE TABLE Tabela_Mao_Obra (
    id_servico INT PRIMARY KEY,
    descricao VARCHAR,
    valor_referencia DECIMAL
);

CREATE TABLE Ordem_Servico (
    numero_os INT PRIMARY KEY,
    id_veiculo INT,
    id_equipe INT,
    data_emissao DATE,
    data_conclusao DATE,
    status_autorizacao VARCHAR,
    valor_total_os DECIMAL,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE OS_Servico (
    id_item_servico INT PRIMARY KEY,
    numero_os INT,
    id_servico INT,
    FOREIGN KEY (numero_os) REFERENCES Ordem_Servico(numero_os),
    FOREIGN KEY (id_servico) REFERENCES Tabela_Mao_Obra(id_servico)
);

CREATE TABLE OS_Peca (
    id_item_peca INT PRIMARY KEY,
    numero_os INT,
    id_peca INT,
    quantidade INT,
    FOREIGN KEY (numero_os) REFERENCES Ordem_Servico(numero_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);
