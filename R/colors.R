
##' Tamedia TG color palette
##'
##' Just a bunch of hex color vectors... 
##' Color palette as vector (no function). Colors can be sequential (one color), diverging (2 colors)
##' 
##' tam_pal: 8 categorical tam colors 
##' 
##' tam_dpal: diverging color palette with 13 levels
##' 
##' tam_spal:  single hue blueish 
##' 
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(tam_pal)), col=tam_pal)
tam_pal <- c(
  "#2a3589", "#c6266d", "#64baaa",
  "#ff5c4d", "#2c647e", "#ffa600",
  "#a95c9a", "#5ca0f7"
)

##' Diverging color palette
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(tam_dpal)), col=tam_dpal)
tam_dpal <- c(
  "#2a3589", "#5b4e9a","#826aac","#a589bf","#c5a9d3",
  "#e3cbe8", "#ffefff", "#f8d3ee", "#f3b7d7", "#ef99bc",
  "#ea7b9c", "#e15d78", "#d43d51")

##' Single hue divering color palette
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(tam_spal)), col=tam_spal)
tam_spal <- rev(c(
  "#2a3589",
  "#4d4897",
  "#6a5da4",
  "#8473b2",
  "#9d8bc1",
  "#b5a3d0",
  "#ccbcdf",
  "#e3d5ef",
  "#f9f0ff"
))
