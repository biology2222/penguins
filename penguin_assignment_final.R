title: "Question4"

source("functions/cleaning.data.R")
source("functions/library.functions.R")

write.csv(penguins_raw, "data_raw/penguins_raw.csv")

#To begin with I save my raw data in order to have a written version of it accessible to me 
penguins_clean <- cleaning(penguins_raw)
head(penguins_clean)

write.csv(penguins_clean, "data_clean/penguins_clean.csv")

culmen_flippers_species <- remove_empty_culmen_flipper_length(penguins_clean)
head(culmen_flippers_species)

penguinmodel1 <- lm(culmen_length_mm ~ species * flipper_length_mm, culmen_flippers_species)
anova(penguinmodel1)

## species, flipper length and the interaction between species and flipper length are all significant to culmen length
#This is evident form the fact that all the p values are under 0.05 so we can say with 95%
#confidnece that these results were not down to chance

#here I source the plotting functions to make a regression plot of my linear model

source("functions/plotting.functions.R")

penguin_figure <- plot_penguin_figure(culmen_flippers_species)
penguin_figure

#here I write the final piece of code required to save the figure

agg_png("figures/fig01_16x12_penguin.png", 
        width = 16, height = 12, units = "cm", res = 600, scaling = 0.75)
penguin_figure
dev.off()

#here is a function for saving the figure, this code is also in the plot functions

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

