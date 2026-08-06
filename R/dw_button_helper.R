#' Generate Responsive HTML buttons for Datawrapper
#'
#' Create clickable, responsive buttons to navigate different Datawrapper charts
#'   
#' @param dw_id A character vector of Datawrapper IDs.
#' @param dw_label A character vector of labels for the buttons.
#' @param font_size Font size with CSS unit (e.g., "13px" or "0.85rem").
#' @param bg_col_hl Background color of the highlighted button.
#' @param bg_col_norm Background color of the normal button.
#' @param font_col_hl Font color of the highlighted button.
#' @param font_col_norm Font color of the normal button.
#' @param font_weight_hl Font weight of the highlighted button.
#' @param font_weight_norm Font weight of the normal button.
#' 
#' @return A character vector of HTML strings.
#' @export
#' @examples
#' dw_id <- c("tXf1C", "6MxFK")
#' dw_label <- c("2025", "2021")
#' #dw_button_helper(dw_id, dw_label) 
#' 
#' \dontrun{
#' dw_df <- tibble(id = dw_id, label = dw_label, 
#'   button = dw_button_helper(dw_id, dw_label)
#'   )
#' 
#' 1:nrow(dw_df) |> 
#'   purrr::walk(function(i) {
#'   
#'     metadata <- dw_retrieve_chart_metadata(dw_df$id[i])
#'     intro_ori <- metadata$content$metadata$describe$intro
#' 
#'     dw_edit_chart(dw_df$id[i],
#'                  intro = paste0(intro_ori, "<br><br>", dw_df$button[i]))
#'     dw_publish_chart(dw_df$id[i])
#'   })
#'   }
dw_button_helper <- function(
    dw_id, 
    dw_label,
    font_size = "0.85rem",
    bg_col_hl = "#414241",
    bg_col_norm = "#BFC0BF",
    font_col_hl = "#FFFFFF",
    font_col_norm = "#FFFFFF",
    font_weight_hl = 600,
    font_weight_norm = 400
) {
  stopifnot(length(dw_id) == length(dw_label))
  
  res_buttons <- rep("", length(dw_id))
  
  for (i in seq_along(dw_id)) {
    
    bg_col_v <- rep(bg_col_norm, length(dw_id))
    bg_col_v[i] <- bg_col_hl
    
    font_col_v <- rep(font_col_norm, length(dw_id))
    font_col_v[i] <- font_col_hl
    
    font_weight_v <- rep(font_weight_norm, length(dw_id))
    font_weight_v[i] <- font_weight_hl
    
    # Intégration de l'argument font_size dans le style
    buttons_html <- paste0(
      '<a target="_self" href="https://datawrapper.dwcdn.net/',
      dw_id,
      '" style="display: inline-block; background:', bg_col_v,
      '; padding: 3px 7px; border-radius: 4px; margin: 2px 1px; color:',
      font_col_v,
      '; font-size: ', font_size, '; font-weight:', font_weight_v,
      '; text-decoration: none; line-height: 1.2; box-shadow: 0px 1px 2px rgba(0,0,0,0.1); cursor: pointer; transition: 0.2s;" rel="nofollow noopener noreferrer">',
      dw_label,
      '</a>'
    ) |> paste(collapse = "")
    
    res_buttons[i] <- paste0(
      '<div style="display: flex; flex-wrap: wrap; gap: 4px; align-items: center; margin-top: 4px; margin-bottom: 4px;">',
      buttons_html,
      '</div>'
    )
  }
  
  return(res_buttons)
}