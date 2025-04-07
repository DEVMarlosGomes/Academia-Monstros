# 🐉 Caverna do Monstro - Sistema de Gestão de Academia

> Projeto SQL para gerenciamento de academia com foco em prática de banco de dados.

Este projeto é parte da Atividade 2 da disciplina de Banco de Dados. Ele tem como objetivo aplicar na prática os conceitos aprendidos em aula, utilizando SQL para manipulação e gestão de dados de um sistema de academia fictícia chamado **Caverna do Monstro**.

---

## 🧠 Objetivo do Projeto

Desenvolver um banco de dados funcional que simule o ambiente de uma academia, permitindo:
- Cadastro e gerenciamento de membros, planos, aulas, instrutores e equipamentos.
- Controle de pagamentos e participação dos membros nas aulas.
- Otimização de consultas com índices.
- Aplicação de transações, funções e procedimentos armazenados.

---

## 🏗️ Estrutura do Banco de Dados

O banco de dados foi criado com base em modelos conceitual, lógico e físico. As principais tabelas são:

- `Membro`: informações dos alunos.
- `Plano`: planos de assinatura da academia.
- `Aula`: aulas disponíveis na academia.
- `Instrutor`: profissionais responsáveis pelas aulas.
- `Pagamento`: controle de pagamentos dos membros.
- `Equipamento`: controle de aparelhos utilizados nas aulas.
- Tabelas de relacionamento como `Membro_Plano`, `Membro_Aula`, `Aula_Instrutor` e `Equipamento_Aula`.

---

## 🔧 Funcionalidades Aplicadas

### 📌 Consultas SQL
- Consultas simples com `SELECT`, `WHERE`, `ORDER BY`.
- Consultas com `JOIN`, `GROUP BY` e funções agregadas.
- Exemplo:
  ```sql
  SELECT m.Nome, COUNT(ma.ID_Aula) AS Total_Aulas
  FROM Membro m
  JOIN Membro_Aula ma ON m.ID_Membro = ma.ID_Membro
  GROUP BY m.Nome;

✍️ Manipulação de Dados
Inserções (INSERT INTO)

Atualizações (UPDATE)

Exclusões (DELETE)

⚙️ Procedimentos e Funções Armazenadas
Função para calcular total pago por um membro:

sql
Copiar
Editar
CREATE FUNCTION TotalPagoPorMembro(membro_id INT) RETURNS DECIMAL(10,2) ...
Procedimento para atualizar o plano de um membro:

sql
Copiar
Editar
CREATE PROCEDURE AtualizarPlanoMembro(IN p_id_membro INT, IN p_id_plano_novo INT) ...
🚀 Otimizações com Índices
Índices criados para melhorar performance em consultas frequentes:

idx_membro_nome

idx_plano_tipo

idx_pagamento_membro_plano

Entre outros

🔄 Transações
Aplicação de START TRANSACTION, COMMIT, ROLLBACK para garantir integridade.

📁 Organização dos Scripts
Os arquivos SQL estão organizados na pasta scripts_sql/:

pgsql
Copiar
Editar
scripts_sql/
├── criar_tabelas.sql
├── inserir_dados.sql
├── consultas_simples.sql
├── consultas_joins.sql
├── funcoes.sql
├── procedimentos.sql
├── transacoes.sql
💡 Exemplos de Uso
Ver total de aulas de cada membro:

sql
Copiar
Editar
SELECT Nome, COUNT(*) FROM Membro_Aula GROUP BY Nome;
Calcular total pago por membro (usando função):

sql
Copiar
Editar
SELECT TotalPagoPorMembro(1);
Atualizar plano de membro (usando procedimento):

sql
Copiar
Editar
CALL AtualizarPlanoMembro(1, 2);
🧾 Histórico de Atualizações
O repositório é atualizado conforme os tópicos são abordados nas aulas. Cada nova funcionalidade é registrada com commit no GitHub, permitindo rastreabilidade das alterações e evolução do projeto.

👨‍💻 Autor
Nomes: Marlos Gomes, Breno Zein, Matheus Rodrigues, Romulo Famiglietti, Matheus Profeta

Curso: Dev

Disciplina: Banco de Dados
