install.packages("RSQLite")
install.packages("dbplyr")
library("RSQLite")
library("dplyr")
library("dbplyr")

my_database = src_sqlite("./mydatabase", create=T)
copy_to(my_database, applenews, temporary=F)

# read
tbl(my_database, "applenews")
tbl(my_database, "applenews") %>% collect()

category_stat = tbl(my_database,"applenews") %>% 
    group_by(category) %>%
    summarise_at(.funs=funs(min,max,mean), .vars=vars(matches('clicked'))) %>%
    arrange(desc(mean)) %>%
    collect()

library('ggplot2')
g <- ggplot(category_stat,aes(x=category,y=mean))
g + geom_bar(stat='identity') + theme(text=element_text(size=16,  family="Songti SC")) + scale_x_discrete(limits=category_stat$category)

