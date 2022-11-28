if(require(robotstxt)==FALSE) install.packages("robotstxt")
pacman::p_load(tidyverse, rvest)

step0_wc_c= "https://fbref.com/en/comps/1/gca/World-Cup-Stats"

step1_wc_c = read_html(step0_wc_c)
step1_wc_c 

step2_wc_c = html_elements(
  x = step1_wc_c,
  css = "#stats_squads_gca_for")
#results202211B_overall

step2_wc_c
tail(step2_wc_c)

step3_wc_c  = html_table(step2_wc_c,  header = T)[[1]]
step3_wc_c 

creations_final <- step3_wc_c[ -c(5:11) ]
creations_final <- creations_final[ -c(6:12) ]
possesion_final

write_csv(step3_wc_c,'Creations.csv')
