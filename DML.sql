-- 1. Finding the average of the rankings of the programs over the years for each
department.
SELECT d.dptId, d.dptName, AVG(r.rnkScore) AS averageRanking
FROM [Rankbusters.Department] d
JOIN [Rankbusters.Program] p ON d.dptId = p.dptId
JOIN [Rankbusters.Ranking] r ON p.pgmId = r.pgmId
GROUP BY d.dptId, d.dptName;

-- 2. Determining the best performing departments in terms of rankings of their
programs.
WITH DepartmentRanking AS (
 SELECT d.dptId, d.dptName, AVG(r.rnkScore) AS averageRanking
 FROM [Rankbusters.Department] d
 JOIN [Rankbusters.Program] p ON d.dptId = p.dptId
 JOIN [Rankbusters.Ranking] r ON p.pgmId = r.pgmId
 GROUP BY d.dptId, d.dptName
)
SELECT dptId, dptName
FROM DepartmentRanking
WHERE averageRanking = (SELECT MIN(averageRanking) FROM DepartmentRanking);

-- 3. Identifying the years when the various sources had significant differences in
the rankings
-- of the programs.
SELECT r.rnkYear, MAX(r.rnkScore) - MIN(r.rnkScore) AS scoreDifference
FROM [Rankbusters.Ranking] r
GROUP BY r.rnkYear
WHERE scoreDifference > 5;

-- 4. Attaining the highest rankings for the programs over the years.
SELECT r.pgmId, r.rnkYear, MIN(r.rnkScore) AS highestRanking
FROM [Rankbusters.Ranking] r
GROUP BY r.pgmId, r.rnkYear;

-- 5. Obtaining the program levels (MBA, MS, etc.) that have the highest average
rankings
-- over the years.
WITH ProgramRanking AS (
 SELECT pgmLevel, AVG(r.rnkScore) AS averageRanking
 FROM [Rankbusters.Program] p
 JOIN [Rankbusters.Ranking] r ON p.pgmId = r.pgmId
 GROUP BY pgmLevel
)
SELECT pgmLevel
FROM ProgramRanking
WHERE averageRanking = (SELECT MIN(averageRanking) FROM ProgramRanking);

-- 6. Finding departments which offer the most programs that have been ranked in
the top 10
-- by multiple sources
WITH TopRankedPrograms AS (
 SELECT dptId, pgmId
 FROM [Rankbusters.Program] p
 JOIN [Rankbusters.Ranking] r ON p.pgmId = r.pgmId
 WHERE r.rnkScore <= 10
 GROUP BY dptId, pgmId
 HAVING COUNT(DISTINCT srcName) > 1
)
SELECT dptId, COUNT(*) AS topRankedProgramsCount
FROM TopRankedPrograms
GROUP BY dptId
ORDER BY topRankedProgramsCount DESC;