#### About this script ####
## Title: PRECIS-2 trial comparation figure
## Author: Javier Mancilla-Galindo
## ORCiD: https://orcid.org/0000-0002-0718-467X
##
## Purpose: Creates a figure of 2 "radar" or "spider-web" diagrams to
## compare two hypothetical trials according to the elements in PRECIS-2.
## For more information about the PRECIS-2 tool, refer to:
## https://www.precis-2.org/Help/Documentation/Help

#### Load packages ####

if (!require("pacman", quietly = TRUE)) {
  install.packages("pacman")
}

pacman::p_load(
  tidyverse,
  ggiraphExtra,
  table1
)

#### Assign values for each trial ####

data <- data.frame(
  Trial = c("Trial 1","Trial 2"),
  Eligibility = c(2,5),
  Recruitment = c(1,5),
  Setting = c(1,5),
  Organization = c(1,5),
  Flexibility_delivery = c(1,5),
  Flexibility_adherence = c(2,4),
  Followup = c(1,3),
  Outcome = c(2,5),
  Analysis = c(3,5)
  )

#### Labels to render figure ####

table1::label(data$Trial) <- "Trial"
table1::label(data$Eligibility) <- "Eligibility"
table1::label(data$Recruitment) <- "Recruitment"
table1::label(data$Setting) <- "Setting"
table1::label(data$Organization) <- "Organization"
table1::label(data$Flexibility_delivery) <- "Flexibility (delivery)"
table1::label(data$Flexibility_adherence) <- "Flexibility (adherence)"
table1::label(data$Followup) <- "Follow up"
table1::label(data$Outcome) <- "Primary outcome"
table1::label(data$Analysis) <- "Primary analysis"

#### Plot ####

figure <- ggRadar(
  data = data,
  aes(
    colour = Trial,
    facet = Trial
    ),
  scales = "fixed",
  ylim = c(0,5),
  rescale = FALSE,
  interactive = FALSE,
  legend.position = "none",
  use.label = TRUE
  ) + 
  scale_color_manual(values = c("aquamarine3","cadetblue")) + 
  scale_fill_manual(values = c("aquamarine3","cadetblue")) +
  theme_bw() + 
  theme(
    panel.border = element_blank(),
    panel.grid.major = element_line(colour = "grey90"),
    axis.line = element_blank(),
    axis.text.x = element_text(size=rel(0.89),face="bold"),
    axis.text.y = element_text(size=rel(1),face="bold"),
    strip.background = element_blank(),
    strip.text = element_text(size=rel(1.2),face="bold"),
    legend.position = "none"
  )

#### Save ####

ggsave("Figure_PRECIS2.png",
       plot = figure,
       width = 10,
       height = 5,
       units = "in", 
       dpi = 300
)

#### Unload packages and clean global environment ####
pacman::p_unload(negate = TRUE)

rm(list = ls())
