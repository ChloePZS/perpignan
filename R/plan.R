plan <- drake::drake_plan(

    data       =  read.csv('data/gapminder-FiveYearData.csv', stringsAsFactors = FALSE),
    data_1982  =  data[data$year == 1982, ],
    
    model  = lme4::lmer(log(lifeExp) ~ log(gdpPercap) + (1 + log(gdpPercap) | year), data = data),
    out    = coef(model),

    figure1 = makefigure1(data_1982, output_filename = 'output/figure1.pdf')
)