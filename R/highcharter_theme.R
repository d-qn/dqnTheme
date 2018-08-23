##' Highchart(er) TG-Tamedia theme
##' 
##' Some helpers to get a TG look for highcharter
##'
##' @rdname tam_highcharter
##' @importFrom highcharter hc_theme
##' @export
##' @seealso http://jkunst.com/highcharter/themes.html#create-themes
##' @examples
##' \dontrun{
##' require(highcharter)
##' data(diamonds, mpg, package = "ggplot2")
##' hchart(mpg, "scatter", x = displ, y = hwy, group = class) %>% hc_add_theme(hc_theme_swi)
##' }

hc_theme_tg <- highcharter::hc_theme(
  colors = tam_pal,
  chart = list(
   # backgroundColor = "#f2f2f2",
    style = list (
      fontFamily = 'Titillium Web'
    )
  ),
  title = list(
    align = "left",
    x = 4, 
    style = list(
      color = '#1a1a1a',
      fontFamily = "Titillium Web",
      fontSize = "1.6em",
      fontWeight = "bold"
    )
  ),
  subtitle = list(
    align = "left",
    x = 4, 
    style = list(
      color = '#262626',
      fontFamily = 'Titillium Web Light',
      fontSize = "1.2em"
    )
  ),
  legend = list(
    itemStyle = list(
      fontFamily = 'Titillium Web',
      fontSize = "1em",
      color = 'black',
      fontWeight = 300
    ),
    itemHoverStyle = list(
      color = 'gray'
    )   
  ),
  # copied from the FT theme hc_theme_ft()
  yAxis = list(
    gridLineColor = "#CEC6B9",
    lineColor =  "#CEC6B9",
    gridLineDashStyle = "Dot",
    labels = list(
      algn = "left",
      x = 0,
      y = -2,
      tickLength = 0,
      tickColor = "#CEC6B9",
      tickWidth = 1,
      style = list (
        fontSize = '1em',
        color = "#333333"
      )
    ),
    title = list(
      style = list (
        fontSize = '1.5em',
        color = "#333333"
      )
    )
  ),
  xAxis = list(
    lineColor =  "#CEC6B9",
    labels = list(
      style = list (
        fontSize = '1em',
        color = "#333333"
      )
    ),
    title = list(
      margin = 17,
      style = list (
        fontSize = '1.5em',
        color = "#333333"
      )
    )
  ),
  tooltip = list(
    borderRadius = 10,
    padding = 3,
    style = list (
      fontFamily = 'OTitillium Web Light',
      fontSize = "0.8em"
    )
  )
)

##' @rdname tam_highcharter
##' @export
##' @examples
##' style_swi_highcharter()
style_swi_highcharter <- function() {
  list.files(system.file("extdata", package="swiRcharts"), 'stylesHighcharter.html', full.names = T)
}

##' @rdname tam_highcharter
##' @export
##' @examples
##' style_swi_highcharter_centered()
style_swi_highcharter_centered <- function() {
  list.files(system.file("extdata", package="swiRcharts"), 'stylesHighcharter_centered.html', full.names = T)
}

##' @rdname tam_highcharter
##' @export
swi_highlight_css <- function() {
  list.files(system.file("extdata", package="swiRcharts"), 'swi_highlight.css', full.names = T)
}