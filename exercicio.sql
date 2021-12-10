select gender, count(*) AS "Quantidade de registros" from funcionarios where departamento = "roupas" group by departamento

select nome, email, departamento from funcionarios where departamento = 'roupas' or departamento = 'filmes' order by departamento