#' Palettes de couleurs Le Temps 
#'
#' Toutes les palettes de couleurs selon le styleguide Le Temps 2024
#'
#' @rdname temps_colors
#' @export
#' @examples
#' # Palette principale
#' pie(rep(1, length(temps_pal)), col = temps_pal)
#' 
#' # Couleurs des partis
#' barplot(1:7, col = temps_partis_pal)

# Palette principale Le Temps
temps_pal <- c(
  "#005578",   # Mineral (couleur principale)
  "#2D695F",   # Foret
  "#467887",   # Teal
  "#4BAFA5",   # Turquoise
  "#AAD250",   # Guacamole
  "#E6A05F",   # Mandarine
  "#AFA050",   # Or
  "#820019",   # Bordeaux
  "#9B2350",    # Cerise
  
  "#AFAFA0",  # Sable
  "#4B4B4B"   # Gris foncé
)

#' @rdname temps_colors
#' @export
# Couleurs pour les partis politiques suisses
temps_partis_pal <- c(
  "PS" = "#E10014",
  "Les Vert-e-s" = "#AAD250", 
  "Le Centre" = "#E6A05F",
  "Vert libéraux" = "#5F9B64",
  "PLR" = "#005578",
  "UDC" = "#2D695F",
  "Autre" = "#6B517A"
)

#' @rdname temps_colors
#' @export
# Séquentielle 1 (Mineral-Turquoise)
temps_seq1_pal <- c("#002119", "#03453D", "#2F6B61", "#437F74", "#579388", "#80BDB1", "#AAE8DC")

#' @rdname temps_colors
#' @export  
# Séquentielle 2 (Bordeaux-Rose)
temps_seq2_pal <- c("#430009", "#760133", "#A02854", "#B33B64", "#C64D74", "#EE7196", "#FFA2C5")

#' @rdname temps_colors
#' @export
# Séquentielle 3 (Bleu foncé-Bleu clair)
temps_seq3_pal <- c("#00213F", "#004566", "#286A8F", "#407DA3", "#5691B7", "#80B9E1", "#ACE5FF")

#' @rdname temps_colors
#' @export
# Divergent 1 (Oui/Non)
temps_div1_pal <- c("#005578", "#426E8B", "#90A3B3", "#CA948F", "#AB4B48")

#' @rdname temps_colors
#' @export
# Divergent 2
temps_div2_pal <- c("#467887", "#839FA8", "#BEC7CA", "#DCDCDC", "#CBC6B6", "#A79B6D", "#7F7324")

#' @rdname temps_colors
#' @export
# Divergent 3  
temps_div3_pal <- c("#234640", "#6A7F7A", "#B5BCBA", "#DCDCDC", "#C0B7C6", "#8A719A", "#543070")

#' Fonction pour obtenir une palette séquentielle
#' @rdname temps_colors
#' @param type type de palette séquentielle (1, 2, ou 3) 
#' @param n nombre de couleurs désirées
#' @importFrom grDevices colorRampPalette
#' @export
get_temps_sequential <- function(type = 1, n = 7) {
  palette <- switch(as.character(type),
                    "1" = temps_seq1_pal,
                    "2" = temps_seq2_pal, 
                    "3" = temps_seq3_pal,
                    temps_seq1_pal)
  
  if (n <= length(palette)) {
    return(palette[1:n])
  } else {
    return(colorRampPalette(palette)(n))
  }
}

#' Fonction pour obtenir une palette divergente
#' @rdname temps_colors
#' @param type type de palette divergente (1, 2, ou 3)
#' @param n nombre de couleurs désirées
#' @importFrom grDevices colorRampPalette
#' @export
get_temps_divergent <- function(type = 1, n = 5) {
  palette <- switch(as.character(type),
                    "1" = temps_div1_pal,
                    "2" = temps_div2_pal,
                    "3" = temps_div3_pal, 
                    temps_div1_pal)
  
  if (n <= length(palette)) {
    return(palette[1:n])
  } else {
    return(colorRampPalette(palette)(n))
  }
}

#' Fonction pour obtenir les couleurs des partis
#' @rdname temps_colors
#' @param partis vecteur des noms de partis
#' @export
get_temps_partis <- function(partis) {
  colors <- temps_partis_pal[partis]
  colors[is.na(colors)] <- temps_partis_pal[["Autre"]]  # Couleur par défaut
  return(unname(colors))
}