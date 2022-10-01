Acute pancreatitis phenotype evaluation
=============

<img src="https://img.shields.io/badge/Study%20Status-Repo%20Created-lightgray.svg" alt="Study Status: Repo Created"/>

-   Analytics use case(s): **Characterization**
-   Study type: **Clinical Application**
-   Tags: **OHDSI2022**
-   Study lead: **James Weaver**
-   Study lead forums tag: [**jweave17**](https://forums.ohdsi.org/u/jweave17/)
-   Study start date: **29 Sept 2022**
-   Study end date: **-**
-   Protocol: **-**
-   Publications: **-**
-   Results explorer: [**Shiny app**](https://data.ohdsi.org/)

**Title:** Validating acute pancreatitis using a probabilistic reference standard supported by comprehensive clinical characterization

**Description:** Medical condition misclassification is acknowledged but rarely estimated in observational health sciences research. In this study, we use a probabilistic reference standard validation method to rapidly estimate the measurement errors of 5 phenotype definitions for acute pancreatitis without manual chart review. Further, this study comprehensively characterizes the cohorts returned by these phenotype definitions.

This study is part of the Phenotype Development and Evaluation Workgroup activity at the [2022 OHDSI Symposium](https://www.ohdsi.org/ohdsi2022symposium/).

Study execution
==========

1. In `R`, install the ApPhenotypeEvaluation package:

  ```r
  install.packages("devtools")
  devtools::install_github("ohdsi-studies/ApPhenotypeEvaluation")
  ```
2. Modify the code below to add your specifications and execute the study!

  ```r
  # database settings ==========================================================
  databaseId <- "" # short name with no special characters please :)
  cdmDatabaseSchema <- ""
  cohortDatabaseSchema <- ""
  cohortTable <- ""
  
  # local settings =============================================================
  studyFolder <- ""
  tempFolder <- ""
  options(andromedaTempFolder = tempFolder,
          spipen = 999)
  outputFolder <- file.path(studyFolder, databaseId)
  
  # specify connection details =================================================
  connectionDetails <- DatabaseConnector::createConnectionDetails(
    dbms = "",
    server = "",
    port = "",
    user = "",
    password = ""
  )
  
  # execute study ==============================================================
  library(magrittr)
  ApPhenotypeEvaluation::execute(
    connectionDetails = connectionDetails,
    cdmDatabaseSchema = cdmDatabaseSchema,
    cohortDatabaseSchema = cohortDatabaseSchema,
    cohortTable = cohortTable,
    outputFolder = outputFolder,
    databaseId = databaseId,
    createCohortTable = TRUE, # TRUE will delete the cohort table and all existing cohorts if already built X_X
    createCohorts = TRUE,
    runCohortDiagnostics = TRUE,
    runValidation = TRUE
  )
  
  # review results =============================================================
  ApPhenotypeEvaluation::compileShinyData(outputFolder)
  ApPhenotypeEvaluation::launchResultsExplorer(outputFolder)
  
  # share results =============================================================
  ApPhenotypeEvaluation::shareResults(
    outputFolder = outputFolder,
    keyFileName = "", # available soon
    userName = "" # available soon
  )
  ```
