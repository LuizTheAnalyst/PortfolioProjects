
SELECT *
FROM PortfolioProject..Planilha1$;

SELECT STATUS, [DATA SOLICITA��O], [PA�S DE ORIGEM], [G�NERO], [ANO DE NASCIMENTO], [CIDADE SOLICITA��O]
FROM PortfolioProject..Planilha1$;

UPDATE PortfolioProject..Planilha1$
SET [G�NERO] = 'Masculino'
WHERE [G�NERO] = 'M';

UPDATE PortfolioProject..Planilha1$
SET [G�NERO] = 'Feminino'
WHERE [G�NERO] = 'F';

-- Total of Refugee Claims in 2015

SELECT COUNT(ID)
FROM PortfolioProject..Planilha1$;

-- Refugee Claims by Decision

SELECT COUNT(STATUS), STATUS
FROM PortfolioProject..Planilha1$
GROUP BY [STATUS]
ORDER BY COUNT(STATUS) DESC;

-- Refugee Claims by Country of Origin

SELECT COUNT(ID), [PA�S DE ORIGEM]
FROM PortfolioProject..Planilha1$
GROUP BY [PA�S DE ORIGEM]
ORDER BY COUNT(ID) DESC;

-- Refugee Claims by Gender

SELECT COUNT(ID), [G�NERO]
FROM PortfolioProject..Planilha1$
GROUP BY [G�NERO]
ORDER BY COUNT(ID) DESC;

-- Total of Refugee Claims Eligible and Accepted by Country of Origin

SELECT COUNT(ID), [PA�S DE ORIGEM]
FROM PortfolioProject..Planilha1$
WHERE STATUS = 'ELEGIBILIDADE / DEFERIMENTO'
GROUP BY [PA�S DE ORIGEM]
ORDER BY COUNT(ID) DESC;

-- Where Most of the Solicitors Claim for Refugee Protection (per city)

SELECT COUNT(ID), [CIDADE SOLICITA��O]
FROM PortfolioProject..Planilha1$
GROUP BY [CIDADE SOLICITA��O]
ORDER BY COUNT(ID) DESC;

-- Solicitors Claim for Refugee Protection in S�o Paulo per Country of Origin (Men Asylum Seekers)

SELECT COUNT(ID), [PA�S DE ORIGEM], [CIDADE SOLICITA��O]
FROM PortfolioProject..Planilha1$
WHERE [CIDADE SOLICITA��O] = 'S�O PAULO'
and [G�NERO] = 'Masculino'
GROUP BY [PA�S DE ORIGEM], [CIDADE SOLICITA��O]
ORDER BY COUNT(ID) DESC;

-- Solicitors Claim for Refugee Protection in S�o Paulo per Country of Origin (Women Asylum Seekers)

SELECT COUNT(ID), [PA�S DE ORIGEM], [CIDADE SOLICITA��O]
FROM PortfolioProject..Planilha1$
WHERE [CIDADE SOLICITA��O] = 'S�O PAULO'
and [G�NERO] = 'Feminino'
GROUP BY [PA�S DE ORIGEM], [CIDADE SOLICITA��O]
ORDER BY COUNT(ID) DESC;

-- Refugee by Year of Birth
-- Observation: the dataset provided by the Brazilian Government doesn't bring further details about the refugees' birthdate (month and day) which makes more age-specific calculations unfeasible.

SELECT [DATA DA  DECIS�O], FORMAT([DATA DA  DECIS�O], 'yyyy') ConvertedDate
FROM PortfolioProject..Planilha1$;

SELECT COUNT(ID), [ANO DE NASCIMENTO]
FROM PortfolioProject..Planilha1$
GROUP BY [ANO DE NASCIMENTO]
ORDER BY COUNT(ID) DESC;