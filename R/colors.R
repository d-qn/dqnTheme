
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

##' Single hue divering 7 color palette copied from https://carto.com/carto-colors/ : BluYi
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(tam_spal)), col=tam_spal)
tam_spal <- c(
  "#f7feae",
  "#b7e6a5",
  "#7ccba2",
  "#46aea0",
  "#089099",
  "#00718b",
  "#045275"
)
