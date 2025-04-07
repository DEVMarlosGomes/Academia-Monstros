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
