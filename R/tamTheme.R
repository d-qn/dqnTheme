#' Tribune de Genève / Tamedia Romandie chart theme
#'
#' ggplot  theme copied from https://github.com/hrbrmstr/hrbrthemes
#'
#' @rdname theme_tam
#' @param ticks \code{logical} show axis ticks?
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param axis add x or y axes? `TRUE`, `FALSE`, "`xy`"
#' @param yAxisNoTitle a logical, should the y title, y-axis and y-ticks be removed? See this example \url{https://rud.is/b/2016/03/16/supreme-annotations/}
#' @param base_family,base_size base font family and size
#' @param plot_title_family,plot_title_face,plot_title_size,plot_title_margin plot title family, face, size and margi
#' @param subtitle_family,subtitle_face,subtitle_size plot subtitle family, face and size
#' @param subtitle_margin plot subtitle margin bottom (single numeric value)
#' @param strip_text_family,strip_text_face,strip_text_size facet label font family, face and size
#' @param caption_family,caption_face,caption_size,caption_margin plot caption family, face, size and margin
#' @param axis_title_family,axis_title_face,axis_title_size axis title font family, face and size
#' @param axis_title_just axis title font justification, one of `[blmcrt]`
#' @param plot_margin plot margin (specify with [ggplot2::margin()])
#' @param grid_col,axis_col grid & axis colors; default to `#666666` and `#333333`
#' @param axis_text_size font size of axis text
#' @param axis.title.colour,axis.ticks.colour a string, a colour
#' @import ggplot2 
#' @import gridExtra
#' @importFrom grid unit
#' @importFrom extrafont loadfonts choose_font
#' @export
#' @examples
#' \dontrun{
#' require(ggplot2)
#' require(dplyr)
#' require(tamTheme)
#' 
#' qplot(1:10, 1:10, size = 10:1) + 
#'   xlab("axis x label") + 
#'   ylab ("y axis label") + 
#'   theme_tam() +
#'   labs(title = "A catchy title", 
#'     subtitle = "a descriptive subtitle",
#'     caption = label_wrap_gen(30)(
#'     "caption: Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
#' 
#' # based on https://rud.is/b/2016/03/16/supreme-annotations/
#' qplot(1:10, 1:10, size = 10:1) + 
#'   xlab("axis x label") + 
#'   ylab ("y axis label") + 
#'   theme_tam(yAxisNoTitle = TRUE, grid = 'x') +
#'   labs(
#'     title = "A catchy title", 
#'     subtitle = "a descriptive subtitle", caption = "source: ofs | Tamedia") +
#'   annotate(geom = "label", x = 0.2, y = 10, 
#'     label = "super unité", hjust = 0, vjust = 0.5, 
#'     family = "Roboto Condensed", label.padding = unit(0.15, "lines"),
#'    label.size = 0)
#'
#' qplot(mtcars$mpg) + 
#'   labs(title = "A catchy title", 
#'   subtitle = "a descriptive subtitle") +
#' theme_tam()
#' # seminal scatterplot
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(x="Fuel effiiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 scatterplot example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'") +
#'   theme_tam()
#'
#' # seminal bar chart
#'
#' # note: make this font_rc on Windows
#' update_geom_font_defaults(family=font_rc_light)
#'
#' count(mpg, class) %>%
#'   ggplot(aes(class, n)) +
#'   geom_col() +
#'   geom_text(aes(label=n), nudge_y=3) +
#'   labs(x="Fuel effiiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 bar chart example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'") +
#'   theme_tam(grid="Y") +
#'   theme(axis.text.y=element_blank())
#' }
theme_tam <- function(
  ticks = TRUE, 
  grid = 'Y',
  axis = T,
  yAxisNoTitle = F,
  base_family = "Roboto Condensed", base_size = 15,
  plot_title_family = base_family, plot_title_size = 20,
  plot_title_face = "bold", plot_title_margin = 10,
  
  subtitle_family = "Roboto Condensed Light",subtitle_size = 17,
  subtitle_face = "plain", subtitle_margin = 15,
  
  strip_text_family = base_family, strip_text_size = 16, strip_text_face = "plain",
  caption_family="Roboto Condensed Light", caption_size = 12,
  caption_face = "plain", caption_margin = 10,
  axis_text_size = base_size,
  axis_title_family = base_family,
  axis_title_size = 15,
  axis_title_face = "plain",
  axis_title_just = "rt",
  plot_margin = margin(5, 3, 5, 3),
  grid_col = "#666666",
  axis_col = "#333333",
  axis.title.colour = "#2b2b2b",axis.ticks.colour = "#333333") 
{
  ret <- theme_minimal(base_family = base_family, base_size = base_size)
  ret <- ret + theme(legend.background=element_blank())
  ret <- ret + theme(legend.key=element_blank())
  
  if (inherits(grid, "character") | grid == TRUE | yAxisNoTitle) {
    
    ret <- ret + theme(panel.grid=element_line(color=grid_col, size=0.2, linetype = "dotted"))
    ret <- ret + theme(panel.grid.major=element_line(color=grid_col, size=0.2, linetype = "dotted"))
    ret <- ret + theme(panel.grid.minor=element_line(color=grid_col, size=0.15, linetype = "dotted"))
    
    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y=element_blank())
    }
    
  } else {
    ret <- ret + theme(panel.grid=element_blank())
  }
  
  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + theme(axis.line=element_line(color=axis_col, size=0.15))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(axis.line.x=element_blank())
      } else {
        ret <- ret + theme(axis.line.x=element_line(color=axis_col, size=0.15))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(axis.line.y=element_blank())
      } else {
        ret <- ret + theme(axis.line.y=element_line(color=axis_col, size=0.15))
      }
    } else {
      ret <- ret + theme(axis.line.x=element_line(color=axis_col, size=0.15))
      ret <- ret + theme(axis.line.y=element_line(color=axis_col, size=0.15))
    }
  } else {
    ret <- ret + theme(axis.line=element_blank())
  }
  
  if (!ticks) {
    ret <- ret + theme(axis.ticks = element_blank())
    ret <- ret + theme(axis.ticks.x = element_blank())
    ret <- ret + theme(axis.ticks.y = element_blank())
  } else {
    ret <- ret + theme(axis.ticks = element_line(size=0.1))
    ret <- ret + theme(axis.ticks.x = element_line(size=0.1))
    ret <- ret + theme(axis.ticks.y = element_line(size=0.1))
    ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
  }
  
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  ret <- ret + 
    theme(axis.text.x=element_text(size=axis_text_size, margin=margin(t=0)))
  ret <- ret + 
    theme(axis.text.y=element_text(size=axis_text_size, margin=margin(r=0)))
  ret <- ret + 
    theme(axis.title=element_text(size=axis_title_size, family=axis_title_family))
  ret <- ret + 
    theme(axis.title.x=element_text(hjust=xj, size=axis_title_size,
          family=axis_title_family, face=axis_title_face))
  ret <- ret + 
    theme(axis.title.y=element_text(hjust=yj, size=axis_title_size,
          family=axis_title_family, face=axis_title_face))
  ret <- ret + 
    theme(axis.title.y.right=element_text(hjust=yj, size=axis_title_size, 
          angle=90,family=axis_title_family, face=axis_title_face))
  ret <- ret + 
    theme(strip.text=element_text(hjust=0, size=strip_text_size,
          face=strip_text_face, family=strip_text_family))
  ret <- ret + theme(panel.spacing=grid::unit(2, "lines"))
  
  ret <- ret + theme(plot.title=element_text(hjust=0, size=plot_title_size,
                     margin=margin(b=plot_title_margin),
                     family=plot_title_family, face=plot_title_face))
  ret <- ret + theme(plot.subtitle=element_text(hjust=0, size=subtitle_size,
                     margin=margin(b=subtitle_margin),
                     family=subtitle_family, face=subtitle_face))
  ret <- ret + theme(plot.caption=element_text(hjust=1, size=caption_size,
                     margin=margin(t=caption_margin),
                     family=caption_family, face=caption_face))
  ret <- ret + theme(plot.margin=plot_margin)
  
  if(yAxisNoTitle) {
    ret <- ret + theme(
      # remove y line & tick
      axis.line.y = element_blank(),
      axis.ticks.y = element_blank(),
      # shift ticks
      axis.text.y = element_text(margin = margin(r=-5)),
      axis.title.y = element_blank()
      )
  }
  ret
}


#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#' @rdname theme_tam
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family="Roboto Condensed", face="plain", size=3.5,
                                      color = "#2b2b2b") {
  update_geom_defaults("text", list(family=family, face=face, size=size, color=color))
  update_geom_defaults("label", list(family=family, face=face, size=size, color=color))
}