
##' Color palettes
##'
##' Just a bunch of hex color vectors... 
##' Color palette as vector (no function). Colors can be sequential (one color), diverging (2 colors)
##' 
##' tam_pal: 8 categorical tam colors 
##' 
##' tam_dpal: diverging color palette with 13 levels
##' 
##' tam_spal: single hue blueish 
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

##' Le Temps-Bontron categorical colour palette for the web 
##' https://projects.susielu.com/viz-palette?colors=[%22#3EB7E4%22,%22#D90065%22,%22#76B82A%22,%22#FFD100%22,%22#7E1E70%22,%22#F18500%22,%22#E30613%22,%22#0064B0%22,%22#009764%22]&backgroundColor=%22white%22&fontColor=%22black%22&mode=%22normal%22
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(temps_pal)), col=temps_pal)
temps_pal <- c(
  "#3eb7e4",
   "#d90065",
   "#76b82a",
   "#ffd100",
   "#7e1e70",
   "#f18500",
   "#e30613",
   "#0064b0",
   "#009764"
)

##' Another single hue sequential red color palette 
##' https://gka.github.io/palettes/#/10|s|c20027,b78d95,f8f5f8|ffffe0,ff005e,93003a|1|1
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(temps_spal)), col=temps_spal)
temps_spal <- c(
  '#c20027', '#c53f43', '#c95e5d', '#cd7776', '#d18e8e', 
  '#d6a3a5', '#dcb9bb', '#e4cdd0', '#ede1e5', '#f8f5f8'
)


##' Le Temps categorical colour palette for the web
##' https://projects.susielu.com/viz-palette?colors=[%22#4a668f%22,%22#bfa6a2%22,%22#ad312f%22,%22#64386F%22,%22#5c7c2d%22,%22#bc8800%22,%22#007685%22,%22#b84a89%22,%22#7e4800%22]&backgroundColor=%22#ffffff%22&fontColor=%22black%22&mode=%22normal%22
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(lt_pal)), col=lt_pal)
lt_pal <- c(
  "#4a668f",
   "#bfa6a2",
   "#ad312f",
   "#64386f",
   "#5c7c2d",
   "#bc8800",
   "#007685",
   "#b84a89",
   "#7e4800"
)


##' Single hue sequential red color palette
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(lt_spal)), col=lt_spal)
lt_spal <- c(
  '#4a0009', '#6f1b28', '#913a43', 
  '#b55a60', '#d8797e', '#f89da1', '#ffcbce'
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

##' Diverging color palette
##' @rdname colors_tam
##' @export
##' @examples
##' pie(rep(1,length(lt_dpal)), col=lt_dpal)
lt_dpal <- c(
  '#003a1c', '#136a48', '#379e77', '#70d2a9', 
   '#f5f5f5', '#fca2e8', '#cd6bb0', '#9a367c', '#63004a'
)

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
