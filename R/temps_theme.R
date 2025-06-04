#' Nouveau thème Le Temps ggplot2 basé sur le styleguide 2025
#'
#' Thème moderne pour ggplot2 suivant les nouvelles spécifications visuelles de Le Temps
#'
#' @rdname theme_temps
#' @param ticks \code{logical} show axis ticks?
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param axis add x or y axes? `TRUE`, `FALSE`, "`xy`"
#' @param yAxisNoTitle a logical, should the y title, y-axis and y-ticks be removed?
#' @param base_family,base_size base font family and size
#' @param plot_title_family,plot_title_face,plot_title_size,plot_title_margin plot title family, face, size and margin
#' @param subtitle_family,subtitle_face,subtitle_size plot subtitle family, face and size
#' @param subtitle_margin plot subtitle margin bottom (single numeric value)
#' @param strip_text_family,strip_text_face,strip_text_size facet label font family, face and size
#' @param caption_family,caption_face,caption_size,caption_margin plot caption family, face, size and margin
#' @param axis_title_family,axis_title_face,axis_title_size axis title font family, face and size
#' @param axis_title_just axis title font justification, one of `[blmcrt]`
#' @param plot_margin plot margin (specify with [ggplot2::margin()])
#' @param grid_col,axis_col grid & axis colors
#' @param axis_text_size font size of axis text
#' @param axis.title.colour,axis.ticks.colour,axis.text.colour colors for axis elements
#' @import ggplot2 
#' @import gridExtra
#' @importFrom grid unit
#' @importFrom showtext showtext_auto
#' @importFrom sysfonts font_families font_add_google
#' @importFrom ggtext element_textbox_simple
#' @export
#' @examples
#' \dontrun{
#' require(ggplot2)
#' require(dqnTheme)
#' require(showtext)
#' 
#' # Configurer les polices (optionnel, fait automatiquement)
#' setup_temps_fonts()
#' 
#' # Exemple avec les nouvelles couleurs Le Temps
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point(color = "#005578") + 
#'   labs(
#'     title = "Titre principal \u2013 Max 40 caract\u00e8res",
#'     subtitle = "Description \u2013 Max 150 caract\u00e8res. Aliquam dictum dolor tellus, vel egestas lacus mollis at duis sit amet ipsum.",
#'     caption = "Graphique: Le Temps | Source: mtcars"
#'   ) +
#'   theme_temps()
#'   
#' # Exemple avec palette de couleurs
#' library(dplyr)
#' mtcars %>%
#'   mutate(cyl = as.factor(cyl)) %>%
#'   ggplot(aes(mpg, wt, color = cyl)) +
#'   geom_point(size = 3) +
#'   scale_color_manual(values = temps_pal[1:3]) +
#'   labs(
#'     title = "Consommation vs Poids des voitures",
#'     subtitle = "Donn\u00e9es par nombre de cylindres",
#'     caption = "Source: mtcars dataset"
#'   ) +
#'   theme_temps()
#'   
#' # seminal scatterplot
#' gp <- ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 scatterplot example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'")
#' gp + theme_temps()
#' gp + theme_temps(ticks = T)
#' gp + theme_temps(axis = F)
#' gp + theme_temps(grid = '')
#' gp + theme_temps(axis_col = "red")
#' gp + theme_temps( axis.text.colour = "red", axis_col = "blue")
#' }

theme_temps <- function(
    ticks = FALSE, 
    grid = 'XY',
    axis = TRUE,
    yAxisNoTitle = FALSE,
    base_family = "Inter", 
    base_size = 11,
    plot_title_family = "Merriweather", 
    plot_title_size = 18,
    plot_title_face = "plain", 
    plot_title_margin = margin(b = 8),
    
    subtitle_family = "Inter", 
    subtitle_size = 13,
    subtitle_face = "plain", 
    subtitle_margin = 10,
    
    strip_text_family = "Inter", 
    strip_text_size = 11, 
    strip_text_face = "plain",
    
    caption_family = "Inter", 
    caption_size = 10,
    caption_face = "plain", 
    caption_margin = 12,
    
    axis_text_size = 10,
    axis_title_family = "Inter",
    axis_title_size = 11,
    axis_title_face = "plain",
    axis_title_just = "rt",
    plot_margin = margin(15, 15, 15, 15),
    
    # Couleurs basées sur le styleguide
    grid_col = "#e6e6e6",
    axis_col = "#7c7c7b",
    axis.text.colour = "#7c7c7b",
    axis.title.colour = "#4a4a49", 
    axis.ticks.colour = "#7c7c7b") 
{
  
  # Charger les polices Google avec sysfonts si pas déjà fait
  if (!"Inter" %in% sysfonts::font_families()) {
    sysfonts::font_add_google("Inter", "Inter")
  }
  if (!"Merriweather" %in% sysfonts::font_families()) {  
    sysfonts::font_add_google("Merriweather", "Merriweather")
  }
  
  # Activer showtext pour ggplot2
  showtext::showtext_auto()
  
  ret <- theme_minimal(base_family = base_family, base_size = base_size)
  
  # Background principal
  ret <- ret + theme(
    plot.background = element_rect(fill = "#f7f7f7", colour = NA),
    panel.background = element_rect(fill = "#f7f7f7", colour = NA)
  )
  
  # Légende
  ret <- ret + theme(
    legend.background = element_blank(),
    legend.key = element_blank(),
    legend.position = "top",
    legend.justification = "left",
    legend.direction = "horizontal",
    legend.text = element_text(
      family = base_family,
      size = 10,
      color = "#4a4a49"
    )
  )
  
  # Grille
  if (inherits(grid, "character") | grid == TRUE | yAxisNoTitle) {
    ret <- ret + theme(
      panel.grid = element_line(color = grid_col, size = 0.3),
      panel.grid.major = element_line(color = grid_col, size = 0.3),
      panel.grid.minor = element_blank()
    )
    
    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x = element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y = element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x = element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y = element_blank())
    }
  } else {
    ret <- ret + theme(panel.grid = element_blank())
  }
  
  # Axes
  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + theme(axis.line = element_line(color = axis_col, size = 0.3))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(axis.line.x = element_blank())
      } else {
        ret <- ret + theme(axis.line.x = element_line(color = axis_col, size = 0.3))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(axis.line.y = element_blank())
      } else {
        ret <- ret + theme(axis.line.y = element_line(color = axis_col, size = 0.3))
      }
    } else {
      ret <- ret + theme(
        axis.line.x = element_line(color = axis_col, size = 0.3),
        axis.line.y = element_line(color = axis_col, size = 0.3)
      )
    }
  } else {
    ret <- ret + theme(axis.line = element_blank())
  }
  
  # Ticks
  if (!ticks) {
    ret <- ret + theme(
      axis.ticks = element_blank(),
      axis.ticks.x = element_blank(),
      axis.ticks.y = element_blank()
    )
  } else {
    ret <- ret + theme(
      axis.ticks = element_line(size = 0.3, color = axis.ticks.colour),
      axis.ticks.x = element_line(size = 0.3, color = axis.ticks.colour),
      axis.ticks.y = element_line(size = 0.3, color = axis.ticks.colour),
      axis.ticks.length = grid::unit(3, "pt")
    )
  }
  
  # Justification des titres d'axes
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  
  # Texte des axes
  ret <- ret + theme(
    axis.text.x = element_text(
      colour = axis.text.colour,
      size = axis_text_size, 
      family = base_family,
      margin = margin(t = 5)
    ),
    axis.text.y = element_text(
      colour = axis.text.colour,
      size = axis_text_size, 
      family = base_family,
      margin = margin(r = 5)
    )
  )
  
  # Titres des axes
  ret <- ret + theme(
    axis.title = element_text(
      size = axis_title_size, 
      family = axis_title_family, 
      colour = axis.title.colour
    ),
    axis.title.x = element_text(
      hjust = xj, 
      size = axis_title_size,
      family = axis_title_family, 
      face = axis_title_face, 
      colour = axis.title.colour,
      margin = margin(t = 8)
    ),
    axis.title.y = element_text(
      hjust = yj, 
      size = axis_title_size,
      family = axis_title_family, 
      face = axis_title_face, 
      colour = axis.title.colour,
      margin = margin(r = 8)
    ),
    axis.title.y.right = element_text(
      hjust = yj, 
      size = axis_title_size, 
      angle = 90,
      family = axis_title_family, 
      face = axis_title_face,
      colour = axis.title.colour
    )
  )
  
  # Facets
  ret <- ret + theme(
    strip.text = element_text(
      hjust = 0, 
      size = strip_text_size,
      face = strip_text_face, 
      family = strip_text_family,
      color = "#4a4a49"
    ),
    panel.spacing = grid::unit(1.5, "lines")
  )
  
  # Position du titre
  ret <- ret + theme(plot.title.position = "plot")
  
  # Titre principal - Merryweather 400, couleur #1d1d1b
  ret <- ret + theme(
    plot.title = element_textbox_simple(
      size = plot_title_size,
      family = plot_title_family, 
      face = plot_title_face,
      colour = "#1d1d1b",
      margin = plot_title_margin,
      lineheight = 1.2
    )
  )
  
  # Sous-titre - Inter 300, couleur #4a4a49
  ret <- ret + theme(
    plot.subtitle = element_textbox_simple(
      size = subtitle_size,
      lineheight = 1.3,
      margin = margin(b = subtitle_margin),
      family = subtitle_family, 
      face = subtitle_face,
      colour = "#4a4a49"
    )
  )
  
  # Caption/Source - Inter 300, couleur #7c7c7b
  ret <- ret + theme(
    plot.caption = element_textbox_simple(
      halign = 1,
      size = caption_size,
      margin = margin(t = caption_margin),
      family = caption_family,
      face = caption_face,
      colour = "#7c7c7b"
    )
  )
  
  # Marges générales
  ret <- ret + theme(plot.margin = plot_margin)
  
  # Option pour supprimer l'axe Y
  if(yAxisNoTitle) {
    ret <- ret + theme(
      axis.line.y = element_blank(),
      axis.ticks.y = element_blank(),
      axis.text.y = element_text(margin = margin(r = -5)),
      axis.title.y = element_blank()
    )
  }
  
  ret
}

#' Nouvelle palette de couleurs Le Temps basée sur le styleguide
#' @rdname temps_colors
#' @export
temps_pal <- c(
  "#005578",   # Mineral (couleur principale)
  "#2D695F",   # Forêt
  "#467887",   # Teal
  "#4BAFA5",   # Turquoise
  "#AAD250",   # Guacamole
  "#E6A05F",   # Mandarine
  "#AFA050",   # Or
  "#820019",   # Bordeaux
  "#9B2350"    # Cerise
)

#' Couleurs pour les partis politiques suisses
#' @rdname temps_colors
#' @export
temps_partis_pal <- c(
  "PS" = "#E10014",
  "Les Vert-e-s" = "#AAD250", 
  "Le centre" = "#E6A05F",
  "Vert libéraux" = "#5F9B64",
  "PLR" = "#005578",
  "UDC" = "#2D695F",
  "Autre" = "#6B517A"
)

#' Palettes séquentielles Le Temps
#' @rdname temps_colors
#' @export
# Séquentielle 1 (Mineral-Turquoise)
temps_seq1_pal <- c("#002119", "#03453D", "#2F6B61", "#437F74", "#579388", "#80BDB1", "#AAE8DC")

# Séquentielle 2 (Bordeaux-Rose)
temps_seq2_pal <- c("#430009", "#760133", "#A02854", "#B33B64", "#C64D74", "#EE7196", "#FFA2C5")

# Séquentielle 3 (Bleu foncé-Bleu clair)
temps_seq3_pal <- c("#00213F", "#004566", "#286A8F", "#407DA3", "#5691B7", "#80B9E1", "#ACE5FF")

#' Palettes divergentes Le Temps
#' @rdname temps_colors
#' @export
# Divergent 1 (Oui/Non)
temps_div1_pal <- c("#005578", "#426E8B", "#90A3B3", "#CA948F", "#AB4B48")

# Divergent 2
temps_div2_pal <- c("#467887", "#839FA8", "#BEC7CA", "#DCDCDC", "#CBC6B6", "#A79B6D", "#7F7324")

#' Fonction pour configurer les polices Le Temps avec showtext
#' @rdname temps_colors
#' @export  
#' @examples
#' \dontrun{
#' # Configurer les polices avant d'utiliser le thème
#' setup_temps_fonts()
#' 
#' # Puis utiliser le thème normalement
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   theme_temps()
#' }
setup_temps_fonts <- function() {
  if (!requireNamespace("showtext", quietly = TRUE)) {
    stop("Le package 'showtext' est requis. Installez-le avec: install.packages('showtext')")
  }
  
  if (!requireNamespace("sysfonts", quietly = TRUE)) {
    stop("Le package 'sysfonts' est requis. Installez-le avec: install.packages('sysfonts')")
  }
  
  # Charger les polices Google si pas déjà fait
  current_fonts <- sysfonts::font_families()
  
  if (!"Inter" %in% current_fonts) {
    message("Chargement de la police Inter depuis Google Fonts...")
    sysfonts::font_add_google("Inter", "Inter")
  }
  
  if (!"Merriweather" %in% current_fonts) {
    message("Chargement de la police Merriweather depuis Google Fonts...")  
    sysfonts::font_add_google("Merriweather", "Merriweather")
  }
  
  # Activer showtext
  showtext::showtext_auto()
  
  message("\u2713 Polices Le Temps configur\u00e9es avec succ\u00e8s!")
  message("Polices disponibles:", paste(sysfonts::font_families(), collapse = ", "))
  
  invisible(TRUE)
}

# Divergent 3  
temps_div3_pal <- c("#234640", "#6A7F7A", "#B5BCBA", "#DCDCDC", "#C0B7C6", "#8A719A", "#543070")