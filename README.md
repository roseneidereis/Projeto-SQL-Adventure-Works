## Adventure Works - Análise de Dados com SQL
Esse é um projeto de análise de dados desenvolvido com SQL para analisar o comportamento de vendas de uma empresa fictícia chamada Adventure Works que vende bicicletas, peças e acessórios. 
<br><br>
## O Problema
Os tomadores de decisão da Adventure Works decidiram elaborar o planejamento de vendas da empresa, mas necessitavam obter algumas informações importantes para efetuar as previsões de vendas e decidir ações de marketing. Dessa maneira, efetuaram algumas perguntas sobre o comportamento das vendas no período entre 2011 e 2014. Eles queriam saber a quantidade de clientes distintos, o total de vendas, a média de vendas, o total de vendas por ano, o total de vendas por país para saber qual país vendeu mais, e o total de vendas por produto para saber qual produto vendeu mais.
<br><br>
## Fonte de Dados
Banco de Dados: AdventureWordsDW2022 contendo todas a informações necessárias para a análise.
<br> 
Tabelas utilizadas: FactInternetSales, DimProduct, DimCustomer, DimSalesTerritory, DimDate.
<br> 
Tabela FactInternetSales: fornece registros de todas as vendas realizadas online.
<br> 
Tabela DimProduct: fornece informações sobre os produtos vendidos.
<br> 
Tabela DimCustomer: fornece informações sobre os clientes.
<br> 
Tabela:DimSalesTerritory fornece informações sobre os locais de vendas.
<br><br>
## Preparação do Dados
A exploração dos dados foi realizada para entender a estrutura das tabelas e tipos de dados, afim de localizar e conhecer as informações necessárias que seriam trabalhadas durante as consultas.
<br><br>
**Código da consulta da tabela FactInternetSales no banco dde Dados AdventureWorksDW2022:**
<br>
USE AdventureWorksDW2022
<br>
SELECT TOP 100
<br>
	*
 <br>
FROM FactInternetSales
<br><br>
## Análise Exploratória
Aplicada análise descrita com estatística básica para calcular as métricas que respondem as perguntas dos tomadores de decisão da empresa: contagem de clientes distintos, total de vendas, média de vendas, total de vendas por ano, total de vendas por país e total de vendas por produto. 
<br><br>
**Código do cálculo da Quantidade de Clientes Distintos:**
<br> 
SELECT 
<br>
	COUNT(DISTINCT CustomerKey) AS DistinctCustomerCount
 <br>
FROM FactInternetSales
<br><br>
**Código do cálculo ddo Valor Total de Vendas:**
<br> 
SELECT
<br>
	FORMAT(SUM(F.SalesAmount), 'C', 'en-US') AS TotalVendas
 <br>
FROM FactInternetSales AS F
<br><br>
**Código do cálculo da Média de Vendas:**
<br>
SELECT 
<br>
	FORMAT(AVG(F.SalesAmount), 'C', 'en-US') AS MediaVendas
 <br>
FROM FactInternetSales AS F
<br><br>
**Código do cálculo do Total de Vendas por Ano:**
<br>
SELECT 
 <br>
	D.CalendarYear,
 <br>
	FORMAT(SUM(SalesAmount), 'C', 'en-US') AS 'TotalVendas'
 <br>
FROM FactInternetSales S
<br>
INNER JOIN DimDate D ON D.DateKey = S.ShipDateKey
<br>
GROUP BY D.CalendarYear
<br><br>
**Código do cálculo do Total de Vendas por País:**
<br>
SELECT
<br>
    T.SalesTerritoryCountry,
    <br>
    FORMAT(SUM(SalesAmount), 'C', 'en-US') AS TotalVendas
    <br>
FROM FactInternetSales S
<br>
INNER JOIN DimDate D ON D.DateKey = S.ShipDateKey
<br>
INNER JOIN DimSalesTerritory T ON T.SalesTerritoryKey = S.SalesTerritoryKey
<br>
GROUP BY T.SalesTerritoryCountry
<br>
ORDER BY TotalVendas DESC;
<br><br>
**Código do cálculo do Total de Vendas por Produto:**
<br>
SELECT
<br>
    P.ProductKey,
    <br>
    P.EnglishProductName AS Produto,
    <br>
    FORMAT(SUM(F.SalesAmount), 'C', 'en-US') AS TotalVendas
    <br>
FROM FactInternetSales AS F
<br>
INNER JOIN DimProduct AS P ON F.ProductKey = P.ProductKey
<br>
GROUP BY P.ProductKey, P.EnglishProductName
<br>
ORDER BY SUM(F.SalesAmount) DESC;
<br><br>
## Resultado 
•	Quantidade de clientes distintos: 1484
<br><br>
•	Total de Vendas: US$29,358,677.22
<br><br>
•	Média de Vendas: US$486.09
<br><br>
•	Total de Vendas por ano: 
<br>
2014 - US$297,163.11 
<br>
2013 - US$16,281,620.14
<br>
2012 - US$5,801,073.27 
<br>
2011 - US$6,978,820.71 
<br><br>
•	Total de Vendas por país: 
<br>
United States = US$9,389,789.51
<br>
Australia = US$9,061,000.58
<br>
United Kingdom = US$3,391,712.21
<br>
France = US$2,644,017.71
<br>
Canada = US$1,977,844.86
<br><br>
O país que mais vendeu foi os United States.
<br><br>
•	Total de Vendas por produto: o produto que mais vendeu foi o o Road-150 Red, 48 que chegou em total de US$1,205,876.99.
<br><br>
## Recomendação 











