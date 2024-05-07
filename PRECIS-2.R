if (!require("pacman", quietly = TRUE)) {
  install.packages("pacman")
}

pacman::p_load(
  tidyverse,
  ggiraphExtra,
  table1
)

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

ggsave("Figure_PRECIS2.png",
       plot = figure,
       width = 10,
       height = 5,
       units = "in", 
       dpi = 300
)

pacman::p_unload(negate = TRUE)

rm(list = ls())
