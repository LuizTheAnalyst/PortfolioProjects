
SELECT *
FROM PortfolioProject..Planilha1$;

SELECT STATUS, [DATA SOLICITAÇÃO], [PAÍS DE ORIGEM], [GÊNERO], [ANO DE NASCIMENTO], [CIDADE SOLICITAÇÃO]
FROM PortfolioProject..Planilha1$;

UPDATE PortfolioProject..Planilha1$
SET [GÊNERO] = 'Masculino'
WHERE [GÊNERO] = 'M';

UPDATE PortfolioProject..Planilha1$
SET [GÊNERO] = 'Feminino'
WHERE [GÊNERO] = 'F';

-- Total of Refugee Claims in 2015

SELECT COUNT(ID)
FROM PortfolioProject..Planilha1$;

-- Refugee Claims by Decision

SELECT COUNT(STATUS), STATUS
FROM PortfolioProject..Planilha1$
GROUP BY [STATUS]
ORDER BY COUNT(STATUS) DESC;

-- Refugee Claims by Country of Origin

SELECT COUNT(ID), [PAÍS DE ORIGEM]
FROM PortfolioProject..Planilha1$
GROUP BY [PAÍS DE ORIGEM]
ORDER BY COUNT(ID) DESC;

-- Refugee Claims by Gender

SELECT COUNT(ID), [GÊNERO]
FROM PortfolioProject..Planilha1$
GROUP BY [GÊNERO]
ORDER BY COUNT(ID) DESC;

-- Total of Refugee Claims Eligible and Accepted by Country of Origin

SELECT COUNT(ID), [PAÍS DE ORIGEM]
FROM PortfolioProject..Planilha1$
WHERE STATUS = 'ELEGIBILIDADE / DEFERIMENTO'
GROUP BY [PAÍS DE ORIGEM]
ORDER BY COUNT(ID) DESC;

-- Where Most of the Solicitors Claim for Refugee Protection (per city)

SELECT COUNT(ID), [CIDADE SOLICITAÇÃO]
FROM PortfolioProject..Planilha1$
GROUP BY [CIDADE SOLICITAÇÃO]
ORDER BY COUNT(ID) DESC;

-- Solicitors Claim for Refugee Protection in São Paulo per Country of Origin (Men Asylum Seekers)

SELECT COUNT(ID), [PAÍS DE ORIGEM], [CIDADE SOLICITAÇÃO]
FROM PortfolioProject..Planilha1$
WHERE [CIDADE SOLICITAÇÃO] = 'SÃO PAULO'
and [GÊNERO] = 'Masculino'
GROUP BY [PAÍS DE ORIGEM], [CIDADE SOLICITAÇÃO]
ORDER BY COUNT(ID) DESC;

-- Solicitors Claim for Refugee Protection in São Paulo per Country of Origin (Women Asylum Seekers)

SELECT COUNT(ID), [PAÍS DE ORIGEM], [CIDADE SOLICITAÇÃO]
FROM PortfolioProject..Planilha1$
WHERE [CIDADE SOLICITAÇÃO] = 'SÃO PAULO'
and [GÊNERO] = 'Feminino'
GROUP BY [PAÍS DE ORIGEM], [CIDADE SOLICITAÇÃO]
ORDER BY COUNT(ID) DESC;

-- Refugee by Year of Birth
-- Observation: the dataset provided by the Brazilian Government doesn't bring further details about the refugees' birthdate (month and day) which makes more age-specific calculations unfeasible.

SELECT [DATA DA  DECISÃO], FORMAT([DATA DA  DECISÃO], 'yyyy') ConvertedDate
FROM PortfolioProject..Planilha1$;

SELECT COUNT(ID), [ANO DE NASCIMENTO]
FROM PortfolioProject..Planilha1$
GROUP BY [ANO DE NASCIMENTO]
ORDER BY COUNT(ID) DESC;