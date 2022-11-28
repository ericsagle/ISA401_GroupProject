if(require(robotstxt)==FALSE) install.packages("robotstxt")
pacman::p_load(tidyverse, rvest)

step0_wc_possesion = "https://fbref.com/en/comps/1/possession/World-Cup-Stats"

step1_wc_possesion = read_html(step0_wc_possesion)
step1_wc_possesion

step2_wc_possesion = html_elements(
  x = step1_wc_possesion,
  css = "#div_stats_squads_possession_for")
#results202211B_overall

step2_wc_possesion
tail(step2_wc_possesion)

step3_wc_possesion = html_table(step2_wc_possesion, header = T)[[1]]
step3_wc_possesion

write_csv(step3_wc_possesion, 'Possesion.csv')