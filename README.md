# Database Management System for Program Rankings

## Team Name: Rankbusters

### Team Members:
- Pradyum Mohta
- Fuad Khasiyev
- Ansh Dugar
- Shamit Kotak

---

## Mission Statement

**Enabling an advanced database solution that delivers strategic insights into program rankings and departmental performance for department heads, undergraduate students, and their parents.**

---

## Mission Objectives

1. **Average Rankings**: Calculate the average rankings of programs over the years for each department.
2. **Top Performing Departments**: Identify the best-performing departments based on the rankings of their programs.
3. **Ranking Variability**: Determine the years when different ranking sources had significant differences in program rankings.
4. **Highest Program Rankings**: Identify the programs that achieved the highest rankings over the years.
5. **Top Program Levels**: Determine which program levels (MBA, MS, etc.) have the highest average rankings over the years.
6. **Top-Ranked Programs**: Find departments that offer the most programs ranked in the top 10 by multiple sources.

---

## Entities, Attributes, and Primary Keys

### 1. Department
- **Attributes**: 
  - `dptId` (Primary Key)
  - `dptName`
  - `dptChair`
  - `dptLocation`
  - `dptBuilding` (optional)
  - `dptOffice` (optional)

### 2. Program
- **Attributes**: 
  - `pgmId` (Primary Key)
  - `pgmName`
  - `pgmDirector`
  - `pgmLevel`
  - `pgmDuration`
  - `pgmCredits`

### 3. Source
- **Attributes**: 
  - `srcName` (Primary Key)
  - `srcLink`
  - `srcType`

### 4. Ranking
- **Attributes**: 
  - `rnkScore` (Primary Key)
  - `rnkSource`

---

## Relationships, Attributes, Degrees, Participating Entities, and Constraints

### 1. Offers
- **Type**: Binary Relationship
- **Entities**: 
  - 1 Department can offer 1 or more Programs
  - 1 Program is offered by 1 Department

### 2. Publish (year)
- **Type**: Binary Relationship
- **Entities**: 
  - 1 Source publishes 1 or more Rankings
  - 1 Ranking is associated with 1 Source

### 3. Reflects
- **Type**: Binary Relationship
- **Entities**: 
  - 1 Program can have 0 or more Rankings (if the program is new and has not been ranked)
  - 1 Ranking can be associated with 1 or more Programs (if multiple programs have the same rank in the same year)

---

## Data Sources

1. **Academic Departments**: [Academic Departments | Maryland Smith](https://www.rhsmith.umd.edu/departments)
2. **Graduate Tuition & Fees**: [Graduate Tuition & Fees | Student Financial Services and Cashiering](https://billpay.umd.edu/GraduateTuition)
3. **US News Best Colleges**: [College Rankings and Lists | US News Best Colleges](https://www.usnews.com/best-colleges/rankings)
4. **Times Higher Education**: [World University Rankings](https://www.timeshighereducation.com/world-university-rankings)
5. **Academic Ranking of World Universities**: [Shanghairanking](https://www.shanghairanking.com/)
6. **Round University Ranking**: [Round University Ranking](https://roundranking.com/)
7. **QS University Rankings**: [Top Global Universities & Colleges](https://www.topuniversities.com/university-rankings)

---
