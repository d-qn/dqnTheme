##' Update datawrapper chart if new data is available
##' 
##' @param df1,df2 data frames to compare
##' @param tolerance a numeric scalar, the tolerance for comparison
##' @param ignore_case a logical scalar, if TRUE, the comparison will be case-insensitive
##' @rdname dw_update_chart_ifnewdata
##' @return a boolean scalar. TRUE if similar, FALSE otherwise
##' @export

fuzzy_compare <- function(df1, df2, tolerance = 1e-1, ignore_case = TRUE) {
  # Check if both inputs are data frames
  if (!is.data.frame(df1) || !is.data.frame(df2)) {
    return(FALSE)
  }
  
  # Check dimensions match
  if (!all(dim(df1) == dim(df2))) {
    return(FALSE)
  }
  
  # Check column names match (order-independent)
  if (!setequal(names(df1), names(df2))) {
    return(FALSE)
  }
  
  # Reorder columns of df2 to match df1
  df2 <- df2[, names(df1), drop = FALSE]
  
  # Convert factors to characters
  df1[] <- lapply(df1, function(x) if (is.factor(x)) as.character(x) else x)
  df2[] <- lapply(df2, function(x) if (is.factor(x)) as.character(x) else x)
  
  # Optional: case folding for character columns
  if (ignore_case) {
    df1[] <- lapply(df1, function(x) if (is.character(x)) tolower(x) else x)
    df2[] <- lapply(df2, function(x) if (is.character(x)) tolower(x) else x)
  }
  
  # Sort rows to ignore row order
  if (nrow(df1) > 0) {
    df1 <- df1[do.call(order, df1), , drop = FALSE]
    df2 <- df2[do.call(order, df2), , drop = FALSE]
  }
  
  # Reset row names for comparison
  rownames(df1) <- NULL
  rownames(df2) <- NULL
  
  # Perform tolerant comparison
  return(isTRUE(all.equal(df1, df2, 
                          check.attributes = FALSE, 
                          tolerance = tolerance)))
}

##' @param dw_id a character sclalar, datawrapper id
##' @param api_key a character scalar, datawrapper api key
##' @param new_data a data.frame, the new data
##' @param timestamp_update a logical scalar, if TRUE, the timestamp will be added at bottom of the chart
##' @param timestamp_text a character scalar, the text for the timestamp
##' @param annotate_text a character scalar, the text for the annotation that will be before the timestamp
##' @param date_format a character scalar, the date format
##' @rdname dw_update_chart_ifnewdata
##' @return a boolean scalar. TRUE if the chart is updated, FALSE otherwise
##' @import DatawRappr 
##' @export
dw_update_chart_ifnewdata <- function (dw_id, api_key, new_data,
                          annotate_text = "",
                          timestamp_update = F, 
                          timestamp_text = "Actualisé le ",
                          date_format = "%d %B %Y") {
  
  Sys.setlocale("LC_TIME", "fr_FR.UTF-8")
  ori_data <- dw_data_from_chart(dw_id, api_key)

  # compare data
  if(!fuzzy_compare(new_data, ori_data)) {
    # update data
    new_data |> dw_data_to_chart(dw_id, api_key) 
    
    # add timestamp
    if(timestamp_update) {
      timestamp <- paste0(annotate_text, timestamp_text, format(Sys.Date(), date_format))
      dw_edit_chart(dw_id, api_key,
                    annotate = timestamp)
    }
    
    # publish chart
    dw_publish_chart(dw_id, api_key)
    
    return(TRUE)
  } else {
    return(FALSE)
  }
}