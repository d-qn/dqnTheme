#' HTML responsive grid for static charts
#' 
#' Lays out ggplot2 charts into a "grid" (similar to
#' \code{grid.arrange} from \code{gridExtra}) but in 
#' a responsive grid, html/css output.
#' 
#' @param ... either individual `ggplot2` objects or a `list` of `ggplot2` objects.
#' @param ncol how many columns in the grid
#' @param rowheight Height in px.
#' @param add_htmlgrid_css A logical value to add or not `htmlgrid.css` as
#'   dependency.
#' @param browsable Logical value indicating if the returned object is converted
#'   to an HTML object browsable using \code{htmltools::browsable}.
#' @importFrom grDevices n2mfrow
#' @import htmltools
#' @examples
#' charts <- lapply(1:9, function(x) {
#'   qplot(cumsum(rnorm(100)), geom = "histogram")  + theme_tam()
#' })
#' if(interactive()){
#'   dq_grid(charts, rowheight = 300)
#' }
#' @export
dq_grid <- function(..., ncol = NULL, rowheight = NULL, 
                    add_htmlgrid_css = TRUE, browsable = TRUE) {
  
  # based on highcharter::hw_grid
  
  input_list <- as.list(substitute(list(...)))[-1L]
  params <- list()
  
  for (i in seq_len(length(input_list))) {
    x <- eval.parent(input_list[[i]])
    if (any(class(x) == "list")) {
      for (j in seq_len(length(x))) {
        y <- eval(x[[j]])
        params[[length(params) + 1]] <- y
      }
    } else {
      params[[length(params) + 1]] <- x
    }
  }
  
  if (is.null(ncol)) {
    ncol <- n2mfrow(length(params))[1]
  }
  if (ncol > 12) {
    ncol <- 12
  }
  ncolm <- floor(ncol / 2)
  # adding htmlwdgtgrid.css dependencies
  dep <- htmlDependency(
    name = "htmlwdgtgrid",
    version = "0.0.9",
    src  = dir(system.file("extdata/", package="dqnTheme"), 
               'htmlwdgtgrid.css$', full.names = T) ,
    stylesheet  = "htmlwdgtgrid.css",
  )
  
  divs <- map(params, function(x) {
    
    if(add_htmlgrid_css) {
      x$dependencies <- c(x$dependencies, list(dep))
    }
    
    x$width <- "100%"
    
    if (!is.null(rowheight)) {
      x$height <- rowheight
    }
    
    tags$div(class = sprintf("col-1-%s mobile-col-1-%s", ncol, ncolm), x)
    
  })
  
  divgrid <- tags$div(class = "grid grid-pad", divs)
  
  class(divgrid) <- c(class(divgrid), "htmlwdwtgrid")
  
  if(browsable) return(htmltools::browsable(divgrid))
  
  divgrid
}
