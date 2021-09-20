#running multiple regression models as a function and saving output as df
mod_outdf <- do.call(rbind, lapply(c("outcome1", "outcome2", "outcome3", "outcome4", "outcome5", ...), function(x){
  mod_out <- as.data.frame(summary(lm(formula = as.formula(paste0(x, "~ predictor1 + predictor2 + predictor3 + predictor4 + ...")), data = my_data))$coefficients[-1,-3]) #removes intercepts and t-values
  mod_out$outcome <- x
  mod_out$predictor <- rownames(mod_out)
  return(mod_out)
}))
mod_outdf <- mod_outdf %>%
  rename(est = Estimate, se = `Std. Error`, pval = `Pr(>|t|)`) %>% #update this with colnames if using different regression type
  as.data.frame()