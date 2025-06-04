#' Highchart(er) themes
#' 
#' Some helpers to get a Le Temps look for highcharter
#'
#' @rdname theme_highcharter
#' @importFrom highcharter hc_theme
#' @export
#' @seealso http://jkunst.com/highcharter/themes.html#create-themes
#' @examples
#' \dontrun{
#' data(diamonds, mpg, package = "ggplot2")
#' hchart(mpg, "scatter", 
#'   hcaes(x = displ, y = hwy, group = class)) |> 
#'   hc_add_theme(hc_theme_lt) |> 
#'   hc_title(text = "Super cool catchy title") |> 
#'   hc_subtitle(text = "A long detailed description of what the hell is shown")
#' }

hc_theme_lt <- highcharter::hc_theme(
  colors = lt_pal,
  chart = list(
    # backgroundColor = "#f2f2f2",
    style = list (
      fontFamily = 'Raleway'
    ),
    spacing = c(20, 5, 2, 0)
  ),
  title = list(
    align = "left",
    x = 4, 
    style = list(
      color = '#240f13',
      fontFamily = "Montserrat",
      fontSize = "1.4em",
      fontWeight = "700"
    ),
    useHTML = T
  ),
  subtitle = list(
    align = "left",
    x = 4, 
    style = list(
      color = '#5e5557',
      fontFamily = 'Raleway',
      fontWeight = 200,
      fontSize = "1.1em"
    ),
    useHTML = T
  ),
  legend = list(
    itemStyle = list(
      fontFamily = 'Raleway',
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
        fontWeight = 700,
        fontSize = '1.2em',
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
        fontWeight = 700,
        fontSize = '1.2em',
        color = "#202346"
      )
    )
  ),
  tooltip = list(
    borderRadius = 10,
    padding = 4,
    style = list (
      fontFamily = 'Raleway',
      fontSize = "0.9em"
    )
  )
)

#' @rdname theme_highcharter
#' @export
#' @examples
#' style_tam_highcharter()
style_tam_highcharter <- function() {
  list.files(system.file("extdata", package="dqnTheme"), 'tam_highcharter.css', full.names = T)
}

#' @rdname theme_highcharter
#' @export
#' @examples
#' # A modified version of highcharter's htmlwdgtgrid.css, with much less margin on mobile
#' htmlwidgetgrid_css()
htmlwidgetgrid_css <- function() {
  list.files(system.file("extdata", package="dqnTheme"), 'htmlwdgtgrid.css', full.names = T)
}
