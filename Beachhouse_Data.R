#### Zillow Sanata Rosa Viz ####


#install.packages('Quandl')

library(Quandl)


Quandl.api_key('JJLzxHGAE8n9mFR1pLbb')


Zillow_Turnover_AllHomes <- Quandl('ZILLOW/Z32459_TURNAH')
Zillow_Median_Listing_Santa_Rosa <- Quandl('ZILLOW/Z32459_MLPAH')
Zillow_Med_List_3BR_Santa_Rosa <- Quandl('ZILLOW/Z32459_MLP3B')
Zillow_Days_on_Zillow_Santa_Rosa <- Quandl('ZILLOW/CO1291_DOZP')
Zill_Med_Rental_3BR_Santa_Rosa <- Quandl('ZILLOW/Z32459_MRP3B')
Zillow_Listing_Price_SQFT_3BR_Santa_Rosa <- Quandl('ZILLOW/CO1291_MLPF3B')
Zillow_Listing_Price_SQFT_3BR_Santa_Rosa$Date <- as.Date(Zillow_Listing_Price_SQFT_3BR_Santa_Rosa$Date,"%Y/%m")


library(ggplot2)
library(plotly)

Listing_lp <- ggplot(Zillow_Listing_Price_SQFT_3BR_Santa_Rosa,aes(Date,Value)) + geom_line() + geom_point() + labs(title = 'Price per SQ FT (2010-2018) 3 Br ')
Listing_lp_plotly <- ggplotly(Listing_lp)

Rental_lp <- ggplot(Zill_Med_Rental_3BR_Santa_Rosa,aes(Date,Value)) + geom_line() + geom_point() + labs(title = 'Median Rental Price per Monthly')
Rental_lp_plotly <- ggplotly(Rental_lp)
Rental_lp_plotly

TurnOver_lp <- ggplot(Zillow_Turnover_AllHomes,aes(Date,Value)) + geom_line() + geom_point() + labs(title = 'Turnover for 3 Br ')
TurnOver_lp_plotly <- ggplotly(TurnOver_lp)

Days_on_lp <- ggplot(Zillow_Days_on_Zillow_Santa_Rosa,aes(Date,Value)) + geom_line() + geom_point() + labs(title = 'Days on Zillow for 3 Br ')
Days_on_lp_plotly <- ggplotly(Days_on_lp)

Days_on_bp <- ggplot(Zillow_Days_on_Zillow_Santa_Rosa,aes(Date,Value,group = Date)) + geom_boxplot(aes(fill = Date)) + labs(title = 'Days on Zillow for 3 Br ')
Days_on_bp

ListPrice_on_lp <- ggplot(Zillow_Median_Listing_Santa_Rosa,aes(Date,Value)) + geom_line() + geom_point() + labs(title = 'Median List Price for 3 Br ')
ListPrice_on_lp_plotly <- ggplotly(ListPrice_on_lp)

#install.packages('cowplot')
library(cowplot)
Beachhouse_Data <- plot_grid(Listing_lp, Rental_lp,Days_on_lp,ListPrice_on_lp)

#png('Beachhouse_Data.png',width = 1000,height = 1000)
#Beachhouse_Data
#dev.off()


api_create(Listing_lp_plotly, filename = "Listing Price over Time")
api_create(Rental_lp_plotly, filename = "Rental Price over Time")
api_create(TurnOver_lp_plotly, filename = "Turnover over Time")
api_create(Days_on_lp_plotly, filename = "Days on Zillow (All Homes 2010-2018")
api_create(ListPrice_on_lp_plotly, filename = "List Price on Zillow (2010-2018")
