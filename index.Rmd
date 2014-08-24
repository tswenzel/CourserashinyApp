---
title       : Tracker using dummy firm data
subtitle    : Shiny App for Coursera Data Products Class
author      : TSWenzel
job         : Analyst
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Overview
- This shiny App allows you to plot 2 variables for a particular firm.
- You can see the output both plotted over time, as well as detailed in the table below. 
- The underlying data will be sorted ascendingly for y1 and the table is dynamic in the sense that you can click on a column which will sort the selected column for you.

--- .class #id 

## How to use this tracker

- Both the graph and the data table can be displayed for a particular firm or for the entire set of firms. 
- Moreover, you can display this in your desired frequency using the drop down menu options. 

  1. Last month will display the data in daily frequency
  2. Last Quarter will display the data in weekly frequency
  3. "Last year" and  "All" will display the data in monthly frequency


--- .class #id 
## Example
