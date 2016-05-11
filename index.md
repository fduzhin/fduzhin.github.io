---
title: "Pedicting future population"
author: "Fedor Duzhin"
highlighter: highlight.js
output: pdf_document
job: Nanyang Technological University
knit: slidify::knit2slides
mode: selfcontained
hitheme: tomorrow
subtitle: Lecture and PBL for Singapore Poly
framework: io2012
widgets:
- mathjax
- quiz
---

<!-- Limit image width and height -->
<style type='text/css'>
img {
    max-height: 400px;
    max-width: 964px;
}
</style>

<!-- Center image on slide -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.min.js"></script>
<script type='text/javascript'>
$(function() {
    $("p:has(img)").addClass('centered');
});
</script>

# Plan

> 1. Scatterplots
> 2. Linear regression
> 3. Differential equations for population growth
> 4. PBL


--- .class #id 


# Scatterplots

===============================


<img src="figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

Rental price vs floor area at Reflections at Keppel Bay in Apr 2015 - Mar 2016. 


--- .class #id 

# Scatterplots

===============================


<img src="figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

Fuel consumption (miles per gallon) vs engine displacement (cubic inches).

--- .class #id 

# Scatterplots

===============================



<img src="figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

Ordinary differential equations class at NTU: Final exam score vs PBL score.

--- .class #id 

# Scatterplots

===============================



<img src="figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

Prices of diamonds depending on weight and colour.

--- .class #id 

# Scatterplots

==================================

<img src="figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

Height of children (blue=male, pink=female) depending on father's height and mother's height.

--- .class #id

# Scatterplots

===============================

![Nobel laureates vs chocolate consumption](chocolate.png)

Number of Nobel laureates per capita vs chocolate consumption

--- &twocol w1:30% w2:70%

# Linear regression

*** =left

Ohm's Law: 
$$
V=IR
$$

> 1. Clearly, the blue line captures the trend better than the green line.
> 2. Try to find $R$ that captures the data best
> 3. For each $R$, define $E(R)$ to be deviation of the line $I=RV$ from observed data
> 4. Optimization problem
$$
E(R)=\quad\leadsto\quad\min
$$
> 5. To find the minimum,
$$
\frac{dE}{dR}=0
$$

*** =right

Data points $(V_k,I_k)$ from measurement:

<img src="figure/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" style="display: block; margin: auto;" />

--- &radio

### Question

What is a correct form of $E(R)$?

1. 1 $E(R)=(RV_k-I_k)^2$
2. 2 $E(R)=\sum_{k=1}^{n}(RV_k-I_k)$
3. _3_ $E(R)=\sum_{k=1}^{n}|RV_k-I_k|$ 

*** .hint
Which quantity depends on all data points and cannot be negative?

*** .explanation
The right answer is 
$$
E(R)=\sum_{k=1}^{n}|RV_k-I_k|
$$
$|RV_k-I_k|$ is deviation of the line $I=RV$ from each data point. It cannot be negative. The sum of all these values measures the total deviation of the line from all data points.

--- .class #id

## Ordinary least squares:

> 1. There are different forms of $E(R)$
> 2. Possible: 
$$
E(R)=\sum_{k=1}^{n}|RV_k-I_k|
$$
> 3. But the most common is
$$
E(R)=\sum_{k=1}^{n}(RV_k-I_k)^2
$$
> 4. Why?

--- .class #id

# Linear regression

> 1. OLS error
$$
E(R)=\sum_{k=1}^{n}(RV_k-I_k)^2\quad\leadsto\quad\min
$$
> 2. First derivative
$$
\frac{dE}{dR}=\sum_{k=1}^{n}2V_k(RV_k-I_k)=0
$$
> 3. Simplifying
$$
R\cdot \sum_{k=1}^{n}V_k^2-\sum_{k=1}^{n}V_kI_k=0\quad\iff\quad
R=\frac{\sum_{k=1}^{n}V_kI_k}{ \sum_{k=1}^{n}V_k^2}
$$
> 4. Linear regression - the line $I=RV$, where $R$ is found as above.

--- .class #id

# Linear regression

<img src="figure/unnamed-chunk-7-1.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />

Discuss the meaning of the shadowed region

--- .class #id


## Linear regression: more general case

Data points $(x_1,y_1),\dots,(x_n,y_n)$. Assumption: $Y=aX+b$.

> 1. OLS error
$$
E(a,b)=\sum_{k=1}^{n}(ax_k+b-y_k)^2\quad\leadsto\quad\min
$$
> 2. First derivatives
$$
\frac{\partial E}{\partial a}=\frac{\partial E}{\partial b}=0
$$
> 3. System of linear equations on $a$ and $b$

--- .class #id

### Rental prices at Reflections

<img src="figure/unnamed-chunk-8-1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" style="display: block; margin: auto;" />

Is linear regression a true model?

--- .class #id

### Fuel consumption 


<img src="figure/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />

Is linear regression a true model?

--- .class #id

### Stopping distance of vintage cars

<img src="figure/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" style="display: block; margin: auto;" />

What should be the right model?

--- &radio

### Stopping distance of a car

If $v$ is the speed and $s(v)$ is the stopping distance, what's the right model?

1. 1 $s(v)=av$
2. 2 $s(v)=av^2$
3. 3 $s(v)=av+b$ 
4. _4_ $s(v)=av^2+bv$ 


*** .hint
The stopping distance consists of reaction distance and braking distance. 

*** .explanation
The right answer is 
$$
s(v)=av^2+bv
$$
The first term is braking distance, i.e., proportional to the kinetic energy. The second term is reaction distance, i.e., proportional
to the speed of the car.

--- .class #id

### Fedor's ODE class

<img src="figure/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" style="display: block; margin: auto;" />

Is linear regression a true model?


--- .class #id

### Diamonds of a particular colour

<img src="figure/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" style="display: block; margin: auto;" />

What would be the best model? Square? Exponential function?

--- .class #id

### Diamonds of a particular colour

<img src="figure/unnamed-chunk-13-1.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" style="display: block; margin: auto;" />

What does it mean?

--- .class #id

# Population growth

![Too many people](too_many_people.jpg)

Exponential growth
$$
\frac{dP}{dt}=rP\quad\leadsto\quad P(t)=P_0e^{rt}
$$

--- &twocol w1:30% w2:70%

## Turkmenistan population

[Desmos graph](https://www.desmos.com/calculator/vniaezuolh)

*** =left

<img src="figure/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" style="display: block; margin: auto;" />

*** =right

<img src="figure/unnamed-chunk-15-1.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" style="display: block; margin: auto;" />


--- .class #id

# Population growth

![Fish in a lake](fish.jpg)

Logistic growth
$$
\frac{dP}{dt}=r\cdot P\cdot \left(1-\frac{P}{K}\right)
$$


--- .class #id

# Population growth

> 1. Logistic differential equation
$$
\frac{dP}{dt}=r\cdot P\cdot \left(1-\frac{P}{K}\right)
$$
> 2. $r$ - intrinsic growth rate
> 3. $K$ - carrying capacity
> 4. $P_0$ - initial population
> 5. [Desmos graph](https://www.desmos.com/calculator/pc10scmpjb)

--- .class #id

### True story

In 1992, collapse of the Atlantic northwest cod fishery cost 35000 jobs. The industry operated on the ODE
$$
\frac{dP}{dt}=r\cdot P\cdot \left(1-\frac{P}{K}\right)-\alpha P,
$$
where $\alpha$ is the number of fishing boats. The government misinterpreted the data and overestimated the existing fish population.


--- .class #id

### True story

![Time series of cod catch](cod_catches.png)

--- .class #id

# PBL

Choose a country. Find its historical population data (it's a part of the challenge). Then you've got to model the population, produce a scatterplot with the model superimposed on data points, and make a prediction. There will be three versions of the challenge and you need to choose one. The harder the challenge, the higher your grade will be.

### Easy version

Assuming the exponential model $P(t)=P_0e^{rt}$, where $P_0$ is directly observed as initial population, fit the model into data and calculate $r$. According to the model, when is the country's population going to reach 6 bln?

--- .class #id

# PBL

Choose a country. Find its historical population data (it's a part of the challenge). Then you've got to model the population, produce a scatterplot with the model superimposed on data points, and make a prediction. There will be three versions of the challenge and you need to choose one. The harder the challenge, the higher your grade will be.



### Medium version

Assume the logistic model
$$
\frac{dP}{dt}=r\cdot P\cdot\left(1-\frac{P}{K}\right).
$$
It depends on 3 parameters, $r$, $K$, and $P_0$. Assign a reasonable value to $K$. Solve the differential equation. Fit $r$ and $P_0$ into data. According to the model, when is the country's population is going to reah 95% of its carrying capacity?

--- .class #id

# PBL

Choose a country. Find its historical population data (it's a part of the challenge). Then you've got to model the population, produce a scatterplot with the model superimposed on data points, and make a prediction. There will be three versions of the challenge and you need to choose one. The harder the challenge, the higher your grade will be.


### Hard version

Assume the logistic model
$$
\frac{dP}{dt}=r\cdot P\cdot\left(1-\frac{P}{K}\right).
$$
It depends on 3 parameters, $r$, $K$, and $P_0$. Solve the differential equation. Fit $r$, $K$, and $P_0$ into data. According to the model, what is the country's carrying capacity?

