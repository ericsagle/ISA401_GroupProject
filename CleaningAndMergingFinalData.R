 x= merge(x = groups_final, y = creations_final, by = "Squad")
x <- x[ -c(12:13) ]
final_data = merge(x = x, y = possesion_final, by = "Squad")
final_data <- final_data[ -c(14) ]
final_data <- final_data %>% 
 mutate(Squad = str_replace(Squad, "^\\S* ", ""))
final_data
final_data <- final_data %>% 
  mutate(Squad = str_replace(Squad, "IR Iran", "Iran"))
final_data
write_csv(final_data,'final_data.csv')
