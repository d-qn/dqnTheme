##' Update datawrapper chart if new data is available
##' 
##' @param dw_id a character sclalar, datawrapper id
##' @param api_key a character scalar, datawrapper api key
##' @param new_data a data.frame, the new data
##' @param timestamp_update a logical scalar, if TRUE, the timestamp will be added at bottom of the chart
##' @param timestamp_text a character scalar, the text for the timestamp
##' @param annotate_text a character scalar, the text for the annotation that will be before the timestamp
##' @param date_format a character scalar, the date format
##'
##' @rdname dw_update_chart_ifnewdata
##' @return a boolean scalar. TRUE if the chart is updated, FALSE otherwise
##' 
##' 
##' @import DatawRappr 
##' @export

dw_update_chart_ifnewdata <- function (dw_id, api_key, new_data,
                          annotate_text = "",
                          timestamp_update, 
                          timestamp_text = "Actualisé le ",
                          date_format = "%d %B %Y") {
  
  Sys.setlocale("LC_TIME", "fr_FR.UTF-8")
  ori_data <- dw_data_from_chart(dw_id, api_key)

  # compare data
  if(!identical(new_data, ori_data)) {
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