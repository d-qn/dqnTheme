##' Tribune de Genève / Tamedia Romandie chart theme
##'
##' ggplot  theme copied/inspired from https://gist.github.com/hrbrmstr/283850725519e502e70c
##'
##' @rdname theme_tam
##' @param ticks \code{logical} show axis ticks?
##' @param xGridLines a logical, have horizontal grid lines?
##' @param yAxisNoTitle a logical, should the y title, y-axis and y-ticks be removed? See this example \url{https://rud.is/b/2016/03/16/supreme-annotations/}
##' @param base_size Base font size
##' @param base_family Base font family
##' @param axis.title.colour,axis.colour,axis.ticks.colour a string, a colour
##' @import ggplot2 
##' @import gridExtra
##' @importFrom grid unit
##' @importFrom extrafont loadfonts choose_font
##' @export
##' @examples
##' require(ggplot2)
##' require(extrafont)
##' require(tamTheme)
##' 
##' qplot(1:10, 1:10, size = 10:1) + 
##'   xlab("axis x label") + 
##'   ylab ("y axis label") + 
##'   theme_tam(xGridLines = TRUE) +
##'   labs(title = "A catchy title", 
##'     subtitle = "a descriptive subtitle",
##'     caption = label_wrap_gen(80)(
##'     "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
##' 
##' # based on https://rud.is/b/2016/03/16/supreme-annotations/
##' qplot(1:10, 1:10, size = 10:1) + 
##'   xlab("axis x label") + 
##'   ylab ("y axis label") + 
##'   theme_tam(yAxisNoTitle = TRUE) +
##'   labs(
##'     title = "A catchy title", 
##'     subtitle = "a descriptive subtitle", caption = "source: ofs | Tamedia") +
##'   annotate(geom = "label", x = 0.2, y = 10, 
##'     label = "super unité", hjust = 0, vjust = 0.5, 
##'     family = "Titillium Web", label.padding = unit(0.15, "lines"),
##'    label.size = 0)
##'
##' qplot(mtcars$mpg) + 
##'   labs(title = "A catchy title", 
##'   subtitle = "a descriptive subtitle") +
##' theme_tam()
##'
##'
theme_tam <- function(
  ticks = TRUE, 
  xGridLines = T,
  yAxisNoTitle = F,
  base_family = "Titillium Web", 
  base_size = 13,
  axis.title.colour = "#181e4e",
  axis.colour = "#2b2b2b",
  axis.ticks.colour = "#2b2b2b") 
{
  choose_font(base_family, FALSE)
  ret <- theme_minimal(base_family = base_family, base_size = base_size) +
    theme(
      plot.title   = element_text(
        hjust = 0, vjust = 5, size = rel(1.8), face = "bold", colour = '#0a1b29',
        margin = margin(t = 0, r = 0, b = 7, l = 0)),
      plot.subtitle = element_text(
        hjust = 0, vjust = 5, size = rel(1.2), 
        colour = "#262a40", 
        family = paste0(base_family, " Light")),
      plot.caption = element_text(
        hjust = 1, size = rel(0.7), colour = "#505362", 
        family = paste0(base_family, " Light"),
        margin = margin(t = 20, r = 0, b = 3, l = 0),
        lineheight = 0.8
      ),
      axis.title.x = element_text(hjust = 1, vjust = 0, size = rel(1.4), colour = axis.title.colour),
      axis.title.y = element_text(vjust = 1, hjust = 1, size = rel(1.4), colour = axis.title.colour),
      axis.line         =  element_line(
        linetype = "solid", 
        size = 0.2, 
        colour = axis.colour
        ),
      plot.margin = unit(c(1, 0.7, 1, 0.3), "lines"),
      panel.grid = element_blank()
    )
  
  if (ticks) {
    ret <- ret + theme(axis.ticks = element_line(colour = axis.ticks.colour, size = 0.2))    
  } else {
    ret <- ret + theme(axis.ticks = element_blank())
  }
  if(yAxisNoTitle) {
    if(!xGridLines) xGridLines <- T
    ret <- ret + theme(
      # remove y line & tick
      axis.line.y = element_blank(),
      axis.ticks.y = element_blank(),
      # shift ticks
      axis.text.y = element_text(margin = margin(r=-5)),
      axis.title.y = element_blank()
      )
  }
  if (xGridLines) {
    ret <- ret + theme(
      panel.grid.major.y =  element_line(
        color = "#c2c4d6", linetype = "dotted", size = 0.3)
    )
  }
  ret
}