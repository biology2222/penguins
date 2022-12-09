#Plot functions


# This is the function required to plot a regression plot for the effect of flipper length, species and their interrcation on culmen length

plot_penguin_figure <- function(culmen_flippers_species){
  culmen_flippers_species %>% 
  ggplot(aes(x = flipper_length_mm, y = culmen_length_mm, colour = species)) + 
    geom_point(alpha = 0.8) + geom_smooth(method = "lm") +
    labs(x = 'Flipper length (mm)', y = 'Culmen length (mm)', title = "The Variation in Culmen length as a function of Flipper length,\n Penguin species and their interaction") +  scale_color_manual(values=c("#F4A582","#B2182B","2166AC")) + theme_bw()
}

#This is the function for svaing the penguin plot as per the right dimensions and resolution

save_penguin_plot_png <- function(culmen_flippers_species, 
                                  filename, size, res, scaling){
  agg_png(filename, width   =  16, 
          height  =  12, 
          units   =  "cm", 
          res     =  600, 
          scaling =  0.75)
  penguin_figure <- plot_penguin_figure(culmen_flippers_species)
  print(penguin_figure)
  dev.off()
}



