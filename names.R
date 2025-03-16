
library(ggplot2)
library(ggwordcloud)
library(dplyr)

set.seed(42)

names <- data.frame(
  name = c("Molly", "Mookie", "Mamookie", "Mollymook", "Molly Ann",
           "Mook Mook", "Mooklehound", "Mookle", "Das Mook", "DM",
           "Polly", "Lockdown Folly", "Lamington", "Lamb", "Poppet",
           "Nunu", "Vanilla Posset", "Waggle Butt", "Waggle D. Bottom",
           "Spindle", "Thumper", "Warboy", "Humper", "Chomper", "Chomple Paws",
           "Pud", "Puddle", "Pretty Patel", "Captain Crunch",
           "Gurrlfriend", "Slobbered-on Milosevic", "Colonel Sanders",
           "Baby Gurl")) |>
  mutate(
    size = c(300, 200, round(rnorm(n() - 2, 100, 30))),
    angle = 90 * sample(c(0, 1), n(), replace = TRUE, prob = c(70, 30)))


n <- nrow(names)


ggplot(
  names,
  aes(
    label = name, size = size, angle = angle,
    color = sample(RColorBrewer::brewer.pal(8, "Set2"), n, replace = TRUE))) +
  geom_text_wordcloud_area(shape = "circle") +
  scale_size_area(max_size = 30) +
  theme_minimal() +
  theme(
    plot.background = element_rect(color = "transparent", fill = "black")
  )

ggsave(here::here("images/nicknames.png"),
       height = 5, width = 7, units = "in")
