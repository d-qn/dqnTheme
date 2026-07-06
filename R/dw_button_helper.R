#' Generate Responsive HTML buttons for Datawrapper
#'
#' Create clickable, responsive buttons to navigate different Datawrapper charts
#'   
#' @param dw_id A character vector of Datawrapper IDs.
#' @param dw_label A character vector of labels for the buttons.
#' @param bg_col_hl Background color of the highlighted button.
#' @param bg_col_norm Background color of the normal button.
#' @param font_col_hl Font color of the highlighted button.
#' @param font_col_norm Font color of the normal button.
#' @param font_weight_hl Font weight of the highlighted button.
#' @param font_weight_norm Font weight of the normal button.
#' 
#' @return A character vector of HTML strings.
#' @export
dw_button_helper <- function(
    dw_id, 
    dw_label,
    bg_col_hl = "#414241",
    bg_col_norm = "#BFC0BF",
    font_col_hl = "#FFFFFF",
    font_col_norm = "#FFFFFF",
    font_weight_hl = 600,
    font_weight_norm = 400
) {
  stopifnot(length(dw_id) == length(dw_label))
  
  res_buttons <- rep("", length(dw_id))
  
  # Loop through each dw_id using seq_along (safer than 1:length)
  for (i in seq_along(dw_id)) {
    
    # Vectorized color and weight assignments
    bg_col_v <- rep(bg_col_norm, length(dw_id))
    bg_col_v[i] <- bg_col_hl
    
    font_col_v <- rep(font_col_norm, length(dw_id))
    font_col_v[i] <- font_col_hl
    
    font_weight_v <- rep(font_weight_norm, length(dw_id))
    font_weight_v[i] <- font_weight_hl
    
    # Create individual buttons with inline-block and fallback margins
    buttons_html <- paste0(
      '<a target="_self" href="https://datawrapper.dwcdn.net/',
      dw_id,
      '" style="display: inline-block; background:', bg_col_v,
      '; padding: 6px 10px; border-radius: 5px; margin: 3px 2px; color:',
      font_col_v,
      '; font-weight:', font_weight_v,
      '; text-decoration: none; line-height: 1.2; box-shadow: 0px 1px 3px rgba(0,0,0,0.15); cursor: pointer; transition: 0.2s;" rel="nofollow noopener noreferrer">',
      dw_label,
      '</a>'
    ) |> paste(collapse = "")
    
    # Wrap all buttons in a responsive Flexbox container
    res_buttons[i] <- paste0(
      '<div style="display: flex; flex-wrap: wrap; gap: 6px; align-items: center; margin-top: 6px; margin-bottom: 6px;">',
      buttons_html,
      '</div>'
    )
  }
  
  return(res_buttons)
}