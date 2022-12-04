if(require(robotstxt)==FALSE) install.packages("robotstxt")
pacman::p_load(tidyverse, rvest)

step0_wc_groups = "https://fbref.com/en/comps/1/World-Cup-Stats"

step1_wc_groups = read_html(step0_wc_groups)
step1_wc_groups

##--------------- Group A
step2_wc_groups_A = html_elements(
  x = step1_wc_groups,
  css = "#results202211A_overall")
#results202211B_overall

step2_wc_groups_A
tail(step2_wc_groups_A)

step3_wc_groups_A = html_table(step2_wc_groups_A, header = T)[[1]]
step3_wc_groups_A
step3_wc_groups_A$Group = 'A'

##---------------- Group B
step2_wc_groups_B = html_elements(
  x = step1_wc_groups,
  css = "#results202211B_overall")
#results202211B_overall

step2_wc_groups_B
tail(step2_wc_groups_B)

step3_wc_groups_B = html_table(step2_wc_groups_B, header = T)[[1]]
step3_wc_groups_B
step3_wc_groups_B$Group = 'B'

##---------------- Group C
step2_wc_groups_C = html_elements(
  x = step1_wc_groups,
  css = "#results202211C_overall")
#results202211B_overall

step2_wc_groups_C
tail(step2_wc_groups_C)

step3_wc_groups_C = html_table(step2_wc_groups_C, header = T)[[1]]
step3_wc_groups_C
step3_wc_groups_C$Group = 'C'

##--------------- Group D
step2_wc_groups_D = html_elements(
  x = step1_wc_groups,
  css = "#results202211D_overall")
#results202211B_overall

step2_wc_groups_D
tail(step2_wc_groups_D)

step3_wc_groups_D = html_table(step2_wc_groups_D, header = T)[[1]]
step3_wc_groups_D
step3_wc_groups_D$Group = 'D'

##--------------- Group E
step2_wc_groups_E = html_elements(
  x = step1_wc_groups,
  css = "#results202211E_overall")
#results202211B_overall

step2_wc_groups_E
tail(step2_wc_groups_E)

step3_wc_groups_E = html_table(step2_wc_groups_E, header = T)[[1]]
step3_wc_groups_E
step3_wc_groups_E$Group = 'E'

##--------------- Group F
step2_wc_groups_F = html_elements(
  x = step1_wc_groups,
  css = "#results202211F_overall")
#results202211B_overall

step2_wc_groups_F
tail(step2_wc_groups_F)

step3_wc_groups_F = html_table(step2_wc_groups_F, header = T)[[1]]
step3_wc_groups_F
step3_wc_groups_F$Group = 'F'

##-------------- Group G
step2_wc_groups_G = html_elements(
  x = step1_wc_groups,
  css = "#results202211G_overall")
#results202211B_overall

step2_wc_groups_G
tail(step2_wc_groups_G)

step3_wc_groups_G = html_table(step2_wc_groups_G, header = T)[[1]]
step3_wc_groups_G
step3_wc_groups_G$Group = 'G'

##------------- Group H
step2_wc_groups_H = html_elements(
  x = step1_wc_groups,
  css = "#results202211H_overall")
#results202211B_overall

step2_wc_groups_H
tail(step2_wc_groups_H)

step3_wc_groups_H = html_table(step2_wc_groups_H, header = T)[[1]]
step3_wc_groups_H$Group = 'H'

##------------ Combine Groups 
wc_groups_tbl = 
  rbind(
    step3_wc_groups_A, step3_wc_groups_B, step3_wc_groups_C,step3_wc_groups_D, step3_wc_groups_E, step3_wc_groups_F, step3_wc_groups_G, step3_wc_groups_H
  ) %>% relocate(Group)

groups_final <- wc_groups_tbl[ -c(12:16) ]
groups_final

write_csv(wc_groups_tbl, 'Groups.csv')

