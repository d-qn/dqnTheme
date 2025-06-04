#' Teaser image helper functions
#' 
#' Misc functions to generate cool teasery image based on ggplot2 graphic


library(ggfx)
library(ggplot2)
library(dqnTheme)

gp <- ggplot(mtcars) +
  geom_point(aes(x = mpg, y = disp, color = cyl), size = 10, stroke = 0) +
  scale_color_continuous(limits = c(0, 8)) +
  theme_lt()

#library(rayimage)
# https://github.com/tylermorganwall/MusaMasterclass
# gp
# tmpf <- tempfile(fileext = ".png")
# ggsave(tmpf)
# plot_image(tmpf) |> 
#   render_reorient(flipx = TRUE) |> 
#   plot_image()



library(rayshader)
plot_gg(
  gp, width = 10,
  height = 7,
  multicore = TRUE,
  scale = 127,
  lineantialias = T,
  windowsize = c(2000, 1500),
  fov = 70,  #Default `0`--isometric. Field-of-view angle.
  zoom = 0.25,
  theta = 27,  #Default `45`. Rotation around z-axis.
  phi = 30 ## Default `45`. Azimuth angle.
)




#render_depth(focus = 1.5, bokehintensity =  2, focallength = 200,clear=TRUE)
# Output with depth of field
render_depth(focus = 0.2, bokehintensity = 2, rotation = 3, lookfrom = c(-7,0,-7))
render_camera(theta = 0, 83, zoom = 0.5) 




