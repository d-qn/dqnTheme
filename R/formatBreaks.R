##' Helper for more readable labels when use with cut()
##'
##' When discretizing data with cut(), the resulting categories are 
##' automatically formatted with R notation of intervals. 
##' 
##' @param brks numeric vector that will be used to \code{cut()}
##' @param inbetween_sep,prefix_first,prefix_last,suffix_first,suffix_last strings that are put in between intervals, at the begenninging or at the intervals only. 
##' @export
##' @examples
##' cont_var <- rnorm (100) * 100
##' brks <- pretty(cont_var, n = 10) # or range(cont_var) %>% pretty()
##' brks_labels <- formatBreaks(brks, inbetween_sep = ' - ')
##' formatBreaks(brks, inbetween_sep = ' - ', suffix_first = " unité")
##' cut(cont_var, breaks = brks, labels = brks_labels)

formatBreaks <- function(
  brks, 
  inbetween_sep = "-",
  prefix_first = "< ", 
  prefix_last = "> ",
  suffix_first = "",
  suffix_last = ""
) {
  brks_labels <- "" 
  for(i in 1:(length(brks)-1)) {
    if(i == 1) {
      brks_labels <- paste0(prefix_first,  brks[i+1], suffix_first)
    } else if (i == (length(brks) - 1)){
      brks_labels <- c(brks_labels, paste0(prefix_last,  brks[i], suffix_last))    
    } else {
      brks_labels <- c(brks_labels, paste0(brks[i], inbetween_sep, brks[i+1]))  
    }
  }
  brks_labels
}