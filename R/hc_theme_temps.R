#' Nouveau thème Highcharter Le Temps basé sur le styleguide 2024
#' 
#' Thème moderne pour highcharter suivant les nouvelles spécifications visuelles de Le Temps
#'
#' @rdname hc_theme_temps
#' @importFrom highcharter hc_theme
#' @export
#' @seealso http://jkunst.com/highcharter/themes.html#create-themes
#' @examples
#' \dontrun{
#' require(highcharter)
#' require(dqnTheme)
#' data(diamonds, mpg, package = "ggplot2")
#' 
#' hchart(mpg, "scatter", 
#'   hcaes(x = displ, y = hwy, group = class)) %>% 
#'   hc_add_theme(hc_theme_temps) %>% 
#'   hc_title(text = "Titre principal \u2013 Max 40 caract\u00e8res") %>% 
#'   hc_subtitle(text = "Description \u2013 Max 150 caract\u00e8res. Aliquam dictum dolor tellus, vel egestas lacus mollis.")
#' }

hc_theme_temps <- highcharter::hc_theme(
  colors = temps_pal,
  chart = list(
    backgroundColor = "#f7f7f7",
    style = list(
      fontFamily = 'Inter, sans-serif'
    ),
    spacing = c(20, 15, 15, 15),
    plotBorderWidth = 0
  ),
  
  title = list(
    align = "left",
    x = 0, 
    y = 20,
    style = list(
      color = '#1d1d1b',
      fontFamily = "Merryweather, serif",
      fontSize = "18px",
      fontWeight = "400",
      lineHeight = "1.2em"
    ),
    useHTML = TRUE
  ),
  
  subtitle = list(
    align = "left",
    x = 0,
    y = 45,
    style = list(
      color = '#4a4a49',
      fontFamily = 'Inter, sans-serif',
      fontWeight = "300",
      fontSize = "13px",
      lineHeight = "1.3em"
    ),
    useHTML = TRUE
  ),
  
  caption = list(
    align = "right",
    style = list(
      color = '#7c7c7b',
      fontFamily = 'Inter, sans-serif',
      fontWeight = "300",
      fontSize = "10px"
    ),
    useHTML = TRUE
  ),
  
  legend = list(
    align = "left",
    verticalAlign = "top",
    layout = "horizontal",
    itemStyle = list(
      fontFamily = 'Inter, sans-serif',
      fontSize = "11px",
      color = '#4a4a49',
      fontWeight = "300"
    ),
    itemHoverStyle = list(
      color = '#1d1d1b'
    ),
    itemMarginBottom = 5,
    symbolPadding = 8
  ),
  
  plotOptions = list(
    series = list(
      marker = list(
        radius = 4,
        lineWidth = 1,
        lineColor = "#ffffff"
      )
    )
  ),
  
  yAxis = list(
    gridLineColor = "#e6e6e6",
    gridLineWidth = 1,
    gridLineDashStyle = "Solid",
    lineColor = "#7c7c7b",
    lineWidth = 1,
    tickColor = "#7c7c7b",
    tickWidth = 1,
    tickLength = 3,
    labels = list(
      align = "right",
      x = -5,
      y = 4,
      style = list(
        fontFamily = 'Inter, sans-serif',
        fontWeight = "300",
        fontSize = '10px',
        color = "#7c7c7b"
      )
    ),
    title = list(
      align = "high",
      offset = -10,
      rotation = 0,
      y = -15,
      style = list(
        fontFamily = 'Inter, sans-serif',
        fontWeight = "300",
        fontSize = '11px',
        color = "#4a4a49"
      )
    )
  ),
  
  xAxis = list(
    gridLineColor = "#e6e6e6",
    gridLineWidth = 0,
    lineColor = "#7c7c7b",
    lineWidth = 1,
    tickColor = "#7c7c7b",
    tickWidth = 1,
    tickLength = 3,
    labels = list(
      y = 15,
      style = list(
        fontFamily = 'Inter, sans-serif',
        fontWeight = "300",
        fontSize = '10px',
        color = "#7c7c7b"
      )
    ),
    title = list(
      align = "high",
      margin = 10,
      style = list(
        fontFamily = 'Inter, sans-serif',
        fontWeight = "300",
        fontSize = '11px',
        color = "#4a4a49"
      )
    )
  ),
  
  tooltip = list(
    backgroundColor = "rgba(247, 247, 247, 0.95)",  # Fond gris avec transparence
    borderRadius = 4,
    borderWidth = 1,
    borderColor = "#e6e6e6",
    shadow = list(
      color = "rgba(0, 0, 0, 0.1)",
      offsetX = 1,
      offsetY = 2,
      opacity = 0.3,
      width = 3
    ),
    style = list(
      fontFamily = 'Inter, sans-serif',
      fontSize = "11px",
      padding = "8px"
    )
  ),
  
  credits = list(
    enabled = FALSE
  )
)


#' Update matching font defaults for text geoms - Le Temps theme
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#' to match the Le Temps styleguide
#' @rdname theme_temps
#' @param family font family name (default: "Inter" as per Le Temps styleguide)
#' @param face font face 
#' @param size font size
#' @param color font color (default: Le Temps text color)
#' @importFrom ggplot2 update_geom_defaults
#' @export
#' @examples
#' \dontrun{
#' # Configurer les polices d'abord
#' setup_temps_fonts()
#' 
#' # Puis mettre à jour les defaults des geoms
#' update_geom_font_temps()
#' 
#' # Maintenant tous les geom_text/geom_label utiliseront les bonnes polices
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   geom_text(aes(label = rownames(mtcars)), nudge_y = 0.1) +
#'   theme_temps()
#' }
update_geom_font_temps <- function(family = "Inter", face = "plain", size = 3.5,
                                   color = "#4a4a49") {
  
  # S'assurer que les polices sont chargées
  if (!family %in% sysfonts::font_families() && family == "Inter") {
    message("Chargement de la police Inter...")
    setup_temps_fonts()
  }
  
  ggplot2::update_geom_defaults("text", 
                                list(family = family, face = face, size = size, color = color))
  ggplot2::update_geom_defaults("label", 
                                list(family = family, face = face, size = size, color = color))
  
  message("G\u00e9oms text/label mis \u00e0 jour avec les param\u00e8tres Le Temps")
  invisible(TRUE)
}
