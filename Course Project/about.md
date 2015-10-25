## Fandango Movie Rating Explorer

This Shiny App is for exploring the movie rating from different popular movie rating website (Fandango, IMDB, Metacritic and Rotten Tomato). 

Right now, online movie review has become a serious catalyst for the movie industry, but are those ratings from different websites significantly different? 

I always purchase ticket on the Fandango App on my phone, and their ratings in stars has become an important tie breaker for me to decide which movie to watch. But I always had this feeling that some mediocre movies get handsomely rated. But as a company that make money on selling movie tickets, will their rating significantly differ from others?

***

To answer the questions above, users of this Shiny App could do the following:

### Tab 1: Movies & Rating

1. Specify the movie rating website they want to compare to Fandango by selecting in the drop down box. 

2. Specify the movies in 2015 and 2014 they want to explore by checking the movie list on the side panel. 

#### How to read the chart:
  
The lollipop chart has the ratings in 5 stars system on the x axis (all the ratings are users rating instead of critic's ratings, all the other websites' rating has been converted and normalized into a scale of 0 - 5 to be comparable with Fandango's rating) and movie names on the y axis. 

By scrolling down and hover over, user can see the specific ratings for specific movie from all the movie rating websites. The further on the right, the higher the rating. 

**Note:** Blue dots (Fandango's Star) are on average associated with higher ratings.

### Tab 2: Rating Error & Rating Counts

A reliable rating system should be consistent and representative, so in tab 2, user can use the rating error and rating counts chart to gauge how reliable the ratings are by:

1. specify the range of rating error to compare among three movie rating websites. (Rotten Tomato doesn't have rating counts)

#### How to read the chart:

The scatter plot has the rating error, which is the difference between the specific rating and the average rating for that movies by all the websites, on the y axis and the rating count on the x axis. 

Therefore, the rating above 0 rating error means rated higher than average, and the further it goes on the x axis, the more representative the rating (aggregated from a larger users population). 

**Note:** It is clear that Fandango's rating are usually above the average and based on smaller population compare to IMDB. 

***

Author: 

Aaron Ran An | [LinkedIn](https://www.linkedin.com/in/aaronranan) | [Github](https://github.com/AaronRanAn)

Data Source:

Five Fourty 

