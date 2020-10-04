<h1 align="center">
  <img src="https://github.com/akenny430/lamar_reu_2019/blob/master/misc/img/3D_lasso_contour.png" width="250px" height="250px" />
  <img src="https://github.com/akenny430/lamar_reu_2019/blob/master/misc/img/3D_glasso_contour.png" width="250px" height="250px" />
    <img src="https://github.com/akenny430/lamar_reu_2019/blob/master/misc/img/cluster.png" width="250px" height="250px" />
</h1>

# Lamar University REU -- Summer 2019

This repo contains the code used during my experience at Lamar University's Research Experience for Undergraduates (REU) in summer 2019. 
Our research topic was high-dimensional statistics; we wanted to compare the effectiveness of ungrouped regularization against grouped regularization *where 
we created the feature groups ourselves*. We used two types of clustering algorithms, K-means clustering and heierarchical clustering, to split the predictors 
into non-overlapping groups. Our hope was that the clustering would be able to discover some sort of structure within the data that could then be leveraged by 
regularizing the groups. We worked with two high-dimensional gene expression datasets. We concluded that clustering the predictors **does not** help with 
final prediction accuracy. 

## Report

The final report for this research experience can be found [here](https://github.com/akenny430/lamar_reu_2019/blob/master/report/report.pdf). 

## Presentations

There are two presentations that are included in this repo:
1. The final presentation for the summer, slides can be found [here](https://github.com/akenny430/lamar_reu_2019/blob/master/presentations/pres_final.pdf).
2. A follow-up presentation I gave at Millersville University talking about my experience to interested students, slides can be found 
[here](https://github.com/akenny430/lamar_reu_2019/blob/master/presentations/pres_mill.pdf).

## Code

The code files used during the experience can be found in the [code folder](https://github.com/akenny430/lamar_reu_2019/tree/master/code).
For each dataset, there are two code files. One implements all of the algorithms, and the other creates all of the visualizations. To anyone trying to 
re-run this code, be wary: the SGL package in R was extremely slow, and more often than not actually crashed the entire R session. 


The data used for this project can be found in the [data folder](https://github.com/akenny430/lamar_reu_2019/tree/master/data).
The arrangement of the folders now vs. when we were working on the project originally are very different, which will probably 
cause the R code to not run until the data folders are moved into the right place. 

## Miscellaneous

The images found in the [miscellanous folder](https://github.com/akenny430/lamar_reu_2019/tree/master/misc/img) were made from modifying code shared with
me by [Kenneth Tay](https://kjytay.github.io), a Ph.D. student at Stanford University. Throughout the summer Kenneth was very helpful with answering any 
questions I had for him, both about statistics (he is the leading author of the pcLasso paper) and graduate school in general. 
