#' Le Temps and Heidi.news ggplot2 themes
#'
#' Built from https://github.com/hrbrmstr/hrbrthemes
#'
#' @rdname theme_lt
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
#' @param axis.title.colour,axis.ticks.colour,axis.text.colour a string, a colour
#' @import ggplot2 
#' @import gridExtra
#' @importFrom grid unit
#' @importFrom extrafont loadfonts choose_font
#' @importFrom ggtext element_textbox_simple
#' @export
#' @examples
#' \dontrun{
#' require(ggplot2)
#' require(dqnTheme)
#' 
#' qplot(1:10, 1:10, size = 10:1) + 
#'   xlab("axis x label") + 
#'   ylab ("y axis label") + 
#'   theme_lt() +
#'   labs(title = "A catchy long <span style = 'color:red;'>title</span>, that should be wrapped which is pretty awesome", 
#'     subtitle = "A descriptive subtitle, that is also wrapped, **pure awesomeness** too.",
#'     caption = "caption: Lorem ipsum dolor sit amet, consectetur adipiscing elit. A long caption that wraps too yo!")
#' 
#' # based on https://rud.is/b/2016/03/16/supreme-annotations/
#' qplot(1:10, 1:10, size = 10:1) + 
#'   xlab("axis x label") + 
#'   ylab ("y axis label") + 
#'   theme_lt(yAxisNoTitle = TRUE, grid = 'x') +
#'   labs(
#'     title = "A catchy title", 
#'     subtitle = "A descriptive subtitle", caption = "source: ofs | Le Temps") +
#'   annotate(geom = "label", x = 0.2, y = 10, 
#'     label = "super unité", hjust = 0, vjust = 0.5, 
#'    label.padding = unit(0.15, "lines"),
#'    label.size = 0)
#'
#' qplot(mtcars$mpg) + 
#'   labs(title = "A catchy title", 
#'   subtitle = "a descriptive subtitle") +
#' theme_lt()
#' # seminal scatterplot
#' gp <- ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 scatterplot example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'")
#' gp + theme_lt()
#' gp + theme_lt(ticks = T)
#' gp + theme_lt(axis = F)
#' gp + theme_lt(grid = '')
#' gp + theme_lt(axis_col = "#d6d7dd")
#' gp + theme_lt( axis.text.colour = "#d6d7dd", axis_col = "#d6d7dd")
#' }
theme_lt <- function(
  ticks = FALSE, 
  grid = 'XY',
  axis = T,
  yAxisNoTitle = F,
  base_family = "Titillium Web", 
  base_size = 15,
  plot_title_family = base_family, 
  plot_title_size = 20,
  plot_title_face = "bold", 
  plot_title_margin = 12,
  
  subtitle_family = "Titillium Web Light", 
  subtitle_size = 15,
  subtitle_face = "plain", 
  subtitle_margin = 8,
  
  strip_text_family = base_family, 
  strip_text_size = 16, 
  strip_text_face = "plain",
  caption_family= "Titillium Web Light", 
  caption_size = 11,
  caption_face = "plain", 
  caption_margin = 12,
  axis_text_size = base_size - (base_size/10),
  axis_title_family = base_family,
  axis_title_size = 15,
  axis_title_face = "bold",
  axis_title_just = "rt",
  plot_margin = margin(9, 12, 7, 3),
  grid_col = "#d6d7dd",
  axis_col = "#333333",
  axis.text.colour = "#333333",
  axis.title.colour = "#202346", 
  axis.ticks.colour = "#393d60") 
{
  ret <- theme_minimal(base_family = base_family, base_size = base_size)
  ret <- ret + theme(legend.background=element_blank())
  ret <- ret + theme(legend.key=element_blank())
  
  if (inherits(grid, "character") | grid == TRUE | yAxisNoTitle) {
    
    ret <- ret + theme(panel.grid=element_line(color=grid_col, size=0.2))
    ret <- ret + theme(panel.grid.major=element_line(color=grid_col, size=0.2))
    ret <- ret + theme(panel.grid.minor=element_line(color=grid_col, size=0.1))
    
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
    ret <- ret + theme(axis.line=element_line(color=axis_col, size=0.25))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(axis.line.x = element_blank())
      } else {
        ret <- ret + theme(axis.line.x = element_line(color=axis_col, size=0.25))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(axis.line.y=element_blank())
      } else {
        ret <- ret + theme(axis.line.y=element_line(color=axis_col, size=0.25))
      }
    } else {
      ret <- ret + theme(axis.line.x=element_line(color=axis_col, size=0.25))
      ret <- ret + theme(axis.line.y=element_line(color=axis_col, size=0.25))
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
    ret <- ret + theme(axis.ticks.length = grid::unit(4, "pt"))
  }
  
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  ret <- ret + 
    theme(axis.text.x=element_text(
      colour = axis.text.colour,
      size=axis_text_size, margin=margin(t=0)))
  ret <- ret + 
    theme(axis.text.y=element_text(
      colour = axis.text.colour,
      size=axis_text_size, margin=margin(r=0)))
  ret <- ret + 
    theme(axis.title=element_text(
      size=axis_title_size, family=axis_title_family, colour = axis.title.colour))
  ret <- ret + 
    theme(axis.title.x=element_text(hjust=xj, size=axis_title_size,
          family=axis_title_family, face=axis_title_face, colour = axis.title.colour))
  ret <- ret + 
    theme(axis.title.y=element_text(hjust=yj, size=axis_title_size,
          family=axis_title_family, face=axis_title_face, colour = axis.title.colour))
  ret <- ret + 
    theme(axis.title.y.right=element_text(hjust=yj, size=axis_title_size, 
          angle=90,family=axis_title_family, face=axis_title_face))
  ret <- ret + 
    theme(strip.text=element_text(hjust=0, size=strip_text_size,
          face=strip_text_face, family=strip_text_family))
  ret <- ret + theme(panel.spacing=grid::unit(2, "lines"))
  
  ret <- ret + theme(plot.title.position = "plot")
  
  ret <- ret + theme(
    plot.title = element_textbox_simple(
      size = plot_title_size,
      family = plot_title_family, 
      face = plot_title_face,
      colour = "#202346",
      margin = margin(b=plot_title_margin)
    ))
  ret <- ret + theme(
    plot.subtitle = element_textbox_simple(
      size=subtitle_size,
      lineheight = 1.2,
      margin = margin(b=subtitle_margin),
      family=subtitle_family, 
      face=subtitle_face,
      colour = "#999baa"
    ))
  ret <- ret + theme(
    plot.caption = element_textbox_simple(
      halign = 1,
      size=caption_size,
      margin=margin(t=caption_margin),
      family=caption_family,
      face=caption_face,
      colour = "#a1a2a3")
    )
  ret <- ret + theme(
    plot.margin=plot_margin,
    legend.position = "top",
    legend.justification = "left",
    legend.direction = "horizontal"
  )
  
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

#' theme tam for map: no axis, no ticks, ...
#' @rdname theme_lt
#' @inheritDotParams theme_lt
#' @examples
#' require(ggplot2)
#' require(dqnTheme)
#' qplot(1:10, 1:10, size = 10:1) + theme_ltmap()
#' @export
theme_ltmap = function(...)
{
  theme_new <- theme_lt(...)
  theme_new <- theme_update(
    legend.position = "top", 
    plot.margin = unit(c(0, 0, 0, 0), "lines"),
    legend.key.height = unit(0.6, "lines"),
    legend.key.width = unit(3, "lines"),
    panel.background = element_rect(fill = "transparent", colour = "white"),
    panel.grid = element_line(colour = 'transparent'),
    axis.line = element_blank(),
    axis.ticks = element_blank(), 
    axis.title = element_blank(),
    axis.text = element_blank()
  )
  theme_new
}

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#' @rdname theme_lt
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family="Titillium Web", face="plain", size=3.5,
                                      color = "#222222") {
  update_geom_defaults("text", 
                       list(family=family, face=face, size=size, color=color))
  update_geom_defaults("label", 
                       list(family=family, face=face, size=size, color=color))
}

