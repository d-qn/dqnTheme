##' Tribune de Genève / Tamedia Romandie chart theme
##'
##' ggplot  theme copied/inspired from https://gist.github.com/hrbrmstr/283850725519e502e70c
##'
##' @rdname theme_tam
##' @param ticks \code{logical} Show axis ticks?
##' @param base_size Base font size
##' @param base_family Base font family
##' @import ggplot2 
##' @importFrom grid unit
##' @importFrom extrafont loadfonts choose_font
##' @export
##' @examples
##' require(ggplot2)
##' require(tamTheme)
##' qplot(1:10, 1:10, size = 10:1) + xlab("axis x label") + ylab ("y axis label") + theme_tam()
##' qplot(mtcars$mpg) + theme_tam()
##'
##'
theme_tam <- function(
  ticks = TRUE, 
  base_family = "Titillium Web", 
  base_size = 13) 
{
  choose_font(base_family, FALSE)
  ret <- theme_minimal(base_family = base_family, base_size = base_size) +
    theme(
      plot.title   = element_text(hjust = 0, vjust = 5, size = rel(2), face = "bold"),
      axis.title.x = element_text(hjust = 1, vjust = 0, size = rel(1.6)),
      axis.title.y = element_text(vjust = 1, hjust = 1, size = rel(1.6)),
      axis.line         =  element_line(linetype = "solid", size = 0.1),
      plot.margin = unit(c(2, 1, 1, 1), "lines"),
      panel.grid = element_blank()
    )
  
  if (ticks) {
    ret <- ret + theme(axis.ticks = element_line(colour = '#2b2b2b'))    
  } else {
    ret <- ret + theme(axis.ticks = element_blank())
  }
  ret
}