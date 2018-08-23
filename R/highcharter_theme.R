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
##' require(tamTheme)
##' data(diamonds, mpg, package = "ggplot2")
##' hchart(mpg, "scatter", 
##'   hcaes(x = displ, y = hwy, group = class)) %>% 
##'   hc_add_theme(hc_theme_tg) %>% 
##'   hc_title(text = "super catchy title") %>% 
##'   hc_subtitle(text = "a description of what the hell is shown")
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
      fontFamily = 'Titillium Web',
      fontWeight = 200,
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
    padding = 4,
    style = list (
      fontFamily = 'Titillium Web',
      fontSize = "0.8em"
    )
  )
)

##' @rdname tam_highcharter
##' @export
##' @examples
##' style_tam_highcharter()
style_tam_highcharter <- function() {
  list.files(system.file("extdata", package="tamTheme"), 'tam_highcharter.css', full.names = T)
}