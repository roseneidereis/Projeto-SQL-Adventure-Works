
---consultando a tabela FactInternetSales no banco dde Dados AdventureWorksDW2022

USE AdventureWorksDW2022

SELECT TOP 100
	*
FROM FactInternetSales

---Quantidade de clientes distintos: 1.484

SELECT 
	COUNT(DISTINCT CustomerKey) AS DistinctCustomerCount
FROM FactInternetSales


---Total de Vendas nos 4 anos: US$ 29,358,677.22

SELECT 
	FORMAT(SUM(F.SalesAmount), 'C', 'en-US') AS TotalVendas
FROM FactInternetSales AS F


---Média de Vendas: US$ 486.09

SELECT 
	FORMAT(AVG(F.SalesAmount), 'C', 'en-US') AS MediaVendas
FROM FactInternetSales AS F


---Total de Vendas por Ano: 2014 = US$297,163.11, 2013 = US$16,281,620.14, 2012 = US$5,801,073.27 e 2011 = US$6,978,820.71

SELECT 
	D.CalendarYear,
	FORMAT(SUM(SalesAmount), 'C', 'en-US') AS 'TotalVendas'
FROM FactInternetSales S
INNER JOIN DimDate D ON D.DateKey = S.ShipDateKey
GROUP BY D.CalendarYear


---Total de Vendas por País: 
---United States = US$9,389,789.51
---Australia = US$9,061,000.58
---United Kingdom = US$3,391,712.21
---France = US$2,644,017.71
---Canada = US$1,977,844.86

SELECT 
    T.SalesTerritoryCountry,
    FORMAT(SUM(SalesAmount), 'C', 'en-US') AS TotalVendas
FROM FactInternetSales S
INNER JOIN DimDate D ON D.DateKey = S.ShipDateKey
INNER JOIN DimSalesTerritory T ON T.SalesTerritoryKey = S.SalesTerritoryKey
GROUP BY T.SalesTerritoryCountry
ORDER BY TotalVendas DESC;


---Total de Vendas por Produto: no total tem 158 produtos, o mais vendido foi o Road-150 Red, 48 com o total de US$1,205,876.99
---o produto menos vendido foi o Racing Socks, L com o total de vendas de US$2,427.30

SELECT 
    P.ProductKey,
    P.EnglishProductName AS Produto,
    FORMAT(SUM(F.SalesAmount), 'C', 'en-US') AS TotalVendas
FROM FactInternetSales AS F
INNER JOIN DimProduct AS P ON F.ProductKey = P.ProductKey
GROUP BY P.ProductKey, P.EnglishProductName
ORDER BY SUM(F.SalesAmount) DESC;


