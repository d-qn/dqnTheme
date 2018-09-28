##' Convenience function to embed/bake ggiraph css directly into a created HTML file
##' 
##' If not imported, saveHTML might to proprely import ggiraph css leading to responsiveness issues with IE
##'
##' @export
##' @examples
##' \dontrun{
##'   ggiraphCss
##' }
ggiraphCss <- function() {
  list.files(system.file("extdata", package="tamTheme"), 'ggiraph.css', full.names = T)
}