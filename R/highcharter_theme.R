#' Highchart(er) TG-Tamedia theme
#' 
#' Some helpers to get a TG look for highcharter
#'
#' @rdname tam_highcharter
#' @importFrom highcharter hc_theme
#' @export
#' @seealso http://jkunst.com/highcharter/themes.html#create-themes
#' @examples
#' require(highcharter)
#' require(dqnTheme)
#' data(diamonds, mpg, package = "ggplot2")
#' hchart(mpg, "scatter", 
#'   hcaes(x = displ, y = hwy, group = class)) %>% 
#'   hc_add_theme(hc_theme_tg) %>% 
#'   hc_title(text = "super catchy title") %>% 
#'   hc_subtitle(text = "a description of what the hell is shown")

hc_theme_tg <- highcharter::hc_theme(
  colors = tam_pal,
  chart = list(
   # backgroundColor = "#f2f2f2",
    style = list (
      fontFamily = 'Roboto Condensed'
    ),
    spacing = c(20, 5, 2, 0)
  ),
  title = list(
    align = "left",
    x = 4, 
    style = list(
      color = '#1a1a1a',
      fontFamily = "Roboto Condensed",
      fontSize = "1.6em",
      fontWeight = "bold"
    )
  ),
  subtitle = list(
    align = "left",
    x = 4, 
    style = list(
      color = '#262626',
      fontFamily = 'Roboto Condensed',
      fontWeight = 200,
      fontSize = "1.3em"
    )
  ),
  legend = list(
    itemStyle = list(
      fontFamily = 'Roboto Condensed',
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
      align = "left",
      x = 0,
      y = -3,
      tickLength = 0,
      tickColor = "#CEC6B9",
      tickWidth = 1,
      style = list (
        fontWeight = 200,
        fontSize = '1em',
        color = "#333333"
      )
    ),
    title = list(
      align = "high",
      style = list (
        fontWeight = 400,
        fontSize = '1.3em',
        color = "#333333"
      )
    )
  ),
  xAxis = list(
    lineColor =  "#CEC6B9",
    tickLength = 6,
    tickColor = "#CEC6B9",
    labels = list(
      distance = 5,
      style = list (
        fontWeight = 200,
        fontSize = '1em',
        color = "#333333"
      )
    ),
    title = list(
      align = "high",
      margin = 3,
      style = list (
        fontWeight = 400,
        fontSize = '1.3em',
        color = "#333333"
      )
    )
  ),
  tooltip = list(
    borderRadius = 10,
    padding = 4,
    style = list (
      fontFamily = 'Roboto Condensed',
      fontSize = "0.9em"
    )
  )
)

#' @rdname tam_highcharter
#' @export
#' @examples
#' require(highcharter)
#' require(dqnTheme)
#' data(diamonds, mpg, package = "ggplot2")
#' hchart(mpg, "scatter", 
#'   hcaes(x = displ, y = hwy, group = class)) %>% 
#'   hc_add_theme(hc_theme_TA) %>% 
#'   hc_title(text = "Super catchy title") %>% 
#'   hc_subtitle(text = "a description of what the hell is shown")
hc_theme_TA <- highcharter::hc_theme(
  colors = tam_pal,
  chart = list(
    # backgroundColor = "#f2f2f2",
    style = list (
      fontFamily = 'IBM Plex Sans'
    ),
    spacing = c(20, 5, 2, 0)
  ),
  title = list(
    align = "left",
    x = 4, 
    style = list(
      color = '#202346',
      fontFamily = "IBM Plex Sans",
      fontSize = "1.6em",
      fontWeight = "bold"
    )
  ),
  subtitle = list(
    align = "left",
    x = 4, 
    style = list(
      color = '#5c5f78',
      fontFamily = 'IBM Plex Sans',
      fontWeight = 300,
      fontSize = "1.3em"
    )
  ),
  legend = list(
    itemStyle = list(
      fontFamily = 'IBM Plex Sans',
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
    gridLineColor = "#8c8ea6",
    lineColor =  "#333333",
    gridLineDashStyle = "Dot",
    labels = list(
      align = "left",
      x = 0,
      y = -3,
      tickLength = 0,
      tickColor = "#333333",
      tickWidth = 1,
      style = list (
        fontWeight = 200,
        fontSize = '1em',
        color = "#333333"
      )
    ),
    title = list(
      align = "high",
      style = list (
        fontWeight = 400,
        fontSize = '1.3em',
        color = "#202346"
      )
    )
  ),
  xAxis = list(
    lineColor =  "#333333",
    tickLength = 6,
    tickColor = "#333333",
    labels = list(
      distance = 5,
      style = list (
        fontWeight = 200,
        fontSize = '1em',
        color = "#333333"
      )
    ),
    title = list(
      align = "high",
      margin = 3,
      style = list (
        fontWeight = 400,
        fontSize = '1.3em',
        color = "#202346"
      )
    )
  ),
  tooltip = list(
    borderRadius = 10,
    padding = 4,
    style = list (
      fontFamily = 'IBM Plex Sans',
      fontSize = "0.9em"
    )
  )
)

#' @rdname tam_highcharter
#' @export
#' @examples
#' style_tam_highcharter()
style_tam_highcharter <- function() {
  list.files(system.file("extdata", package="dqnTheme"), 'tam_highcharter.css', full.names = T)
}

#' @rdname tam_highcharter
#' @export
#' @examples
#' style_ta_highcharter()
style_ta_highcharter <- function() {
  list.files(system.file("extdata", package="dqnTheme"), 'ta_highcharter.css', full.names = T)
}

#' @rdname tam_highcharter
#' @export
#' @examples
#' # A modified version of highcharter's htmlwdgtgrid.css, with much less margin on mobile
#' htmlwidgetgrid_css()
htmlwidgetgrid_css <- function() {
  list.files(system.file("extdata", package="dqnTheme"), 'htmlwdgtgrid.css', full.names = T)
}
