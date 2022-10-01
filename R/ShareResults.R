#' @export
shareResults <- function(outputFolder,
                         keyFileName, # "C:/study-data-site-ApPhenoTypeEvaluation.dat"
                         userName = "study-data-site-ApPhenoTypeEvaluation") {

  databaseId <- basename(outputFolder)

  cdZipFile <- file.path(outputFolder, "cohortDiagnostics", sprintf("Results_%s.zip", databaseId))
  OhdsiSharing::sftpUploadFile(privateKeyFileName = keyFileName,
                               userName = userName,
                               remoteFolder = "ApPhenotypeEvaluation",
                               fileName = cdZipFile)

  shinyZipFile <- file.path(outputFolder, "shinyData", sprintf("shiny_data_%s.zip", databaseId))
  OhdsiSharing::sftpUploadFile(privateKeyFileName = keyFileName,
                               userName = userName,
                               remoteFolder = "ApPhenotypeEvaluation",
                               fileName = shinyZipFile)
}
