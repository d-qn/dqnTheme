##' Convenience function to embed/bake ggiraph css directly into a created HTML file
##' 
##' * For ggiraph graphics: if not imported, saveHTML might to proprely import ggiraph css leading to responsiveness issues with IE
##' 
##' @rdname css_styles
##' @export
##' @examples
##' \dontrun{
##'   ggiraphCss()
##' }
ggiraphCss <- function() {
  list.files(system.file("extdata", package="dqnTheme"), 'ggiraph.css', full.names = T)
}

##' Normalizer css: \url{https://necolas.github.io/normalize.css/}
##' @export
normalizeCss <- function() {
  list.files(system.file("extdata", package="dqnTheme"), 'normalize.css', full.names = T)
}

##' Bootstrap min css
##' @export
bootstrapCss <- function() {
  list.files(system.file("extdata", package="dqnTheme"), 'bootstrap.min.css', full.names = T)
}