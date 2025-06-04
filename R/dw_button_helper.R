##' Generate HTML buttons for datawrapper
##'
##' Create clickable buttons to navigate different datawrapper charts
##'   
##' dw_button_helper
##' 
##' @param dw_id a character vector of datawrapper ids
##' @param dw_label a character vector of labels for the buttons
##' @param bg_col_hl a character string for the background color of the highlighted button
##' @param bg_col_norm a character string for the background color of the normal button
##' @param font_col_hl a character string for the font color of the highlighted button
##' @param font_col_norm a character string for the font color of the normal button
##' @param font_weight_hl a numeric value for the font weight of the highlighted button
##' @param font_weight_norm a numeric value for the font weight of the normal button
##' 
##' @rdname dw_button_helper
##' @return a character string
##' @export
##' @examples
##' dw_id <- c("tXf1C", "6MxFK")
##' dw_label <- c("2025", "2021")
##' #dw_button_helper(dw_id, dw_label) 
##' 
##' \dontrun{
##' dw_df <- tibble(id = dw_id, label = dw_label, 
##'   button = dw_button_helper(dw_id, dw_label)
##'   )
##' 
##' 1:nrow(dw_df) %>% 
##'   purrr::walk(function(i) {
##'   
##'     metadata <- dw_retrieve_chart_metadata(dw_df$id[i])
##'     intro_ori <- metadata$content$metadata$describe$intro
##' 
##'     dw_edit_chart(dw_df$id[i],
##'                  intro = paste0(intro_ori, "<br><br>", dw_df$button[i]))
##'     dw_publish_chart(dw_df$id[i])
##'   })
##'   }


dw_button_helper <- function(
    dw_id, 
    dw_label,
    bg_col_hl = "#414241",
    bg_col_norm = "#BFC0BF",
    font_col_hl = "#FFFFFF",
    font_col_norm = "#FFFFFF",
    font_weight_hl = 800,
    font_weight_norm = 400
) {
  stopifnot(length(dw_id) == length(dw_label))
  
  res_buttons <- rep("", length(dw_id))
  # loop though each dw_id
   for(i in 1:length(dw_id)) {
    
    bg_col_v <- rep(bg_col_norm, length(dw_id))
    bg_col_v[i] <- bg_col_hl
    
    font_col_v <- rep(font_col_norm, length(dw_id))
    font_col_v[i] <- font_col_hl
    
    font_weight_v <- rep(font_weight_norm, length(dw_id))
    font_weight_v[i] <- font_weight_hl
    
    dw_button <- paste0(
      '<a target="_self" href="https://datawrapper.dwcdn.net/',
      dw_id,
      '" style="background:', 
      bg_col_v,
      '; padding:1px 1px; border-radius:3px; color:',
      font_col_v,
      '; font-weight:', font_weight_v,
      '; box-shadow:0px 0px 3px 2px rgba(0,0,0,0.07); cursor:pointer;" rel="nofollow noopener noreferrer"> &nbsp;',
      dw_label,
      ' &nbsp;</a> '
    ) |> paste(collapse = "")
    res_buttons[i] <- dw_button 
  }
  res_buttons
}