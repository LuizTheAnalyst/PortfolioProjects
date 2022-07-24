-- Where I'm starting

SELECT *
FROM PortfolioProject..CovidData;

EXEC sp_help 'dbo.CovidData';

ALTER TABLE dbo.CovidData
ALTER COLUMN total_cases float;

ALTER TABLE dbo.CovidData
ALTER COLUMN total_deaths float;

ALTER TABLE dbo.CovidData
ALTER COLUMN population float;

-- Total Cases vs Total Deaths
-- Likelihood of dying from the coronavirus

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject..CovidData
WHERE total_cases > 0;
-- and location like '%Brazil%'


-- Total Cases vs Population
-- Percentage of population infected with coronavirus

SELECT location, date, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM PortfolioProject..CovidData
WHERE population > 0;
-- and location like '%Brazil%'


-- Countries with highest infection rate compared to population

SELECT location, population, MAX(total_cases) as HighestInfectionCount,  MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject..CovidData
WHERE population > 0
GROUP by location, population
ORDER BY PercentPopulationInfected DESC;


-- Continents with the highest death count per population

SELECT continent, MAX(CAST(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidData
WHERE continent is not null 
GROUP BY continent 
ORDER BY TotalDeathCount DESC;


-- Countries with the highest death count per population

SELECT location, MAX(CAST(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidData
WHERE continent is not null 
GROUP BY location 
ORDER BY TotalDeathCount DESC;


-- Global cases and death count number by date

SELECT date, SUM(CAST(new_cases as float)) as TotalCasesCount, SUM(new_deaths) as TotalDeathCount
FROM PortfolioProject..CovidData
WHERE continent is not null
GROUP BY date
ORDER BY 1,2;