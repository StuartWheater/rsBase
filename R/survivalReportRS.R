#' 
#' @title survivalReportRS creates a survival report
#' @description this function creates a survival report
#' @return the report
#' @author Wheater, S.
#' @export
#'
survivalReportRS <- function() {
    server    <- c("survival1", "survival2", "survival3")
    url       <- c("https://192.168.56.100:8443")
    user      <- "administrator"
    password  <- "datashield_test&"
    table     <- c("SURVIVAL.EXPAND_WITH_MISSING1", "SURVIVAL.EXPAND_WITH_MISSING2", "SURVIVAL.EXPAND_WITH_MISSING3")
    logindata <- data.frame(server,url,user,password,table)

    opals <- opal::datashield.login(logins=logindata,assign=TRUE)

    report <- dsBaseClient::ds.mean(datasources=opals, x='D$age.60', type='both')

    opal::datashield.logout(opal=opals)

    return(report)
}
