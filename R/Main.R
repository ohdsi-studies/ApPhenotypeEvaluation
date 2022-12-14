#' @export
execute <- function(connectionDetails,
                    cdmDatabaseSchema,
                    cohortDatabaseSchema,
                    cohortTable,
                    outputFolder,
                    databaseId,
                    createCohortTable = FALSE,
                    createCohorts = FALSE,
                    runCohortDiagnostics = FALSE,
                    runValidation = FALSE,
                    minCellCount = 5) {

  if (createCohortTable) {
    cohortTableNames <- CohortGenerator::getCohortTableNames(cohortTable = cohortTable)
    CohortGenerator::createCohortTables(connectionDetails = connectionDetails,
                                        cohortTableNames = cohortTableNames,
                                        cohortDatabaseSchema = cohortDatabaseSchema)
  }

  if (createCohorts) {
    ApPhenotypeEvaluation::createCohorts(connectionDetails = connectionDetails,
                                         cdmDatabaseSchema = cdmDatabaseSchema,
                                         cohortDatabaseSchema = cohortDatabaseSchema,
                                         cohortTable = cohortTable,
                                         outputFolder = outputFolder)
  }

  if (runCohortDiagnostics) {
    ApPhenotypeEvaluation::runCohortDiagnostics(connectionDetails = connectionDetails,
                                                cdmDatabaseSchema = cdmDatabaseSchema,
                                                cohortDatabaseSchema = cohortDatabaseSchema,
                                                cohortTable = cohortTable,
                                                outputFolder = outputFolder,
                                                databaseId = databaseId,
                                                minCellCount = minCellCount)
  }

  if (runValidation) {
    ApPhenotypeEvaluation::runValidation(connectionDetails = connectionDetails,
                                         cdmDatabaseSchema = cdmDatabaseSchema,
                                         cohortDatabaseSchema = cohortDatabaseSchema,
                                         cohortTable = cohortTable,
                                         outputFolder = outputFolder)
  }
}
