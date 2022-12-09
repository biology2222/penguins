#Cleaning penguin data functions in R

#the function required to make the names usable in R, remove empty columns, remove any 
#columns starting with delta and nay comments 

cleaning <- function(data_raw){
  data_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    select(-comments)
}
#the function required to remove all columns apart from species, culmen length and 
# flipper length, in this function we also remove the the parts of the rows and columns filled with na 

remove_empty_culmen_flipper_length <- function(data_clean){
  data_clean %>%
    filter(!is.na(culmen_length_mm)) %>%
    select(flipper_length_mm, culmen_length_mm, species) %>%
    filter(!is.na(flipper_length_mm)) %>%
    select(culmen_length_mm, flipper_length_mm, species)
}
