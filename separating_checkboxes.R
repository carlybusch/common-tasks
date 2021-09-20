
my_data_new <- my_data %>%
  select(student.ID, checkboxdata) %>% #data should  be series of letters separated by commas for each item in the list of checkboxes
  mutate(student.ID = student.ID) %>%
  mutate(checkboxdata = strsplit(checkboxdata, split = ",")) %>%
  unnest(cols = c(checkboxdata)) %>% #splits each student into multiple rows, depending on the options they picked
  mutate(Value = 1) %>%
  spread(checkboxdata, Value, fill = 0)
write.csv(my_data_new, "file_name.csv")