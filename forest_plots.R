library(tidyverse)
library(ggplot2)
library(RColorBrewer)

#creating forest plot by hand of results from linear regression
mod_out_df %>%
  mutate(predictor = fct_relevel(predictor,"predictor1", "predictor2",
                                 "predictor3" + "predictor4" + ...)) %>%
  ggplot(aes(x = est, y = predictor, color = predictor)) +
  geom_point(size = 5) +
  geom_vline(aes(xintercept = 0), linetype="dashed", size=.7, color = "grey25") + 
  geom_errorbarh(aes(xmin = est-(1.96*se), xmax = est+(1.96*se)), 
                 position=ggstance::position_dodgev(height=0.5), alpha = 1, size = 1.5) +  
  labs(x = "", y = "", title = "") + 
  theme_classic() +
  theme(legend.position = "right", 
        axis.title.x = element_blank(), 
        axis.text.x = element_text(family="Helvetica", color = "black", size = 14, face = "bold"),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(), 
        axis.ticks.y = element_blank(),
        axis.line.y = element_blank(),
        axis.text.y = element_blank(), 
        legend.key.height = unit(1.25, "cm"),
        legend.title = element_text(family="Helvetica", color = "black", size = 16, face = "bold"),
        legend.text = element_text(family="Helvetica", color = "black", size = 14, face = "bold"),
        plot.title = element_text(family="Helvetica", color = "black", size = 14, face = "bold")) +
  scale_color_brewer(palette = "Dark2", direction = -1) +
  xlim(-.9, .9) +
  guides(colour = guide_legend(reverse = T, override.aes = list(size=4, shape = 19, linetype = 0)))