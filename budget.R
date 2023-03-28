survey <- read_csv("data/SCOOPS_survey_filtered_2022-12-05.csv")

rates <- survey |> count(date) |> pull(n)
mean(rates)
quantile(rates, 0.9)

days <- survey |> count(date)
ggplot(days, aes(x = date, y = n)) + geom_col()

weights_summary <- read_rds("data/weights_summary_2022-12-13.rds")
weights_summary |>
  filter(meal == "lunch", source == "study") |>
  distinct(date, swipes) |>
  pull(swipes) |>
  mean()
