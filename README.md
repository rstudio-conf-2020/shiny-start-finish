Shiny From Start To Finish
================

### rstudio::conf 2020 

by Danny Kaplan

-----

:spiral_calendar: January 27 and 28, 2020  
:alarm_clock:     09:00 - 17:00  
:hotel:           Continental Ballroom 1-3  
:writing_hand:    [Community page](https://community.rstudio.com/t/shiny-from-start-to-finish-workshop-rstudio-conf-2020/49093)   
[rstudio.cloud/project/865256](https://rstudio.cloud/project/865256)     
GitHub repo: [https://github.com/rstudio-conf-2020/shiny-start-finish](https://github.com/rstudio-conf-2020/shiny-start-finish)  
wifi: rstudio20, password: tidyverse20    
birds of a feather [document](https://docs.google.com/document/d/13kFAdDLXiOBx6Krz9lBzRxXHnNGDZqmBGRzuKPnUueg/edit?usp=sharing): <http://bit.ly/shinyBoF2020>
-----

## Overview

Shiny is the leading R-based system for writing interactive web-based apps. These give your clients, users, or students the power and sophistication of R with a friendly, no-code interface custom designed to your purpose. The workshop will start at the beginning: designing and creating user interfaces, learning and mastering the reactive model that connects your R code to the interface, and deploying apps publicly and privately. Then we'll work with intermediate-level tools: communicating with outside files and databases, debugging, modularizing. You'll build a range of (closely related) app formats in wide use: interactive Rmd, browser-page apps, tutorials, and dashboards. In the end, you'll be a confident Shiny craftsperson, able to design interactive apps to achieve your purpose and produce a polished and professional implementation.


## Learning objectives

Workshop participants will learn to create and deploy a professional Shiny app from scratch.

## Is this course for me?

You should be comfortable with routine R programming tasks (such as writing functions, indexing vectors and lists).

Your (lack of) previous experience with Shiny is not an issue. If you have experience, you'll see things in a new way. If you don't, we'll get you started on the right footing.

## Prework

1. Bookmark this page. This is where the most up-to-date schedule will be shown. This repo contains the materials for the workshop: Slides, projects, ... The file organization is explained in `Slides/file_organization.Rmd`.

2. Read the [general information](https://docs.google.com/document/d/1_-uhk9dQt_LhpdUrmrCMgcznS79xyZ6EDQHrY1rhfhI/edit) for workshop participants posted by RStudio. 

3. Shortly before the workshop starts, open up a new project in `rstudio.cloud` by following this link: [rstudio.cloud/project/865256](https://rstudio.cloud/project/865256). 
    - You may be prompted to set up an account, which is free. If you already have an account, use that.
    - Your `rstudio.cloud` project is yours and you can leave it for future reference or delete it after the workshop: your choice.
    - Packages will be pre-installed on `rstudio.cloud`
    
4. (An alternative to (3) if you want to use your own RStudio system--e.g. a laptop or an institutional server.) First, think again; it's probably  easier to use the `rstudio.cloud` server. [.. pause while contemplating ...] OK, we understand.
    - Scroll up on this GitHub page to the green "clone or download" button. Copy the link and use it on your system to create a new project with "New project/Version control system/GitHub".
    - When your project is created, look at the file `packages-for-workshop.R`. Install any packages there that you don't already have installed. 

5. One topic of the workshop is deploying apps. If you don't already have a system for deploying apps, or if you don't know what that means, there are two easy options: 

    a. Go to `shinyapps.io` and set  up a free account. Keep track of your account ID etc., you'll need it for the workshop.  '
    
    b. RStudio has set up a Connect server for our workshop. This will disappear soon after the workshop, but it is better than (a) in that you can deploy as many apps as you like. Go to <https://workshops.rstudio.com/rsconnect> and "Sign up". Again, keep track of your account name and password.


## Schedule

### Monday

| Time          | Topic            | 
| :------------ | :--------------- |
| 09:00 - 10:30 | Intro & widgets  | 
| 10:30 - 11:00 | *Coffee break*   |
| 11:00 - 12:00 | UI structure     |
| 12:30 - 13:30 | *Lunch break*    |
| 13:30 - 15:00 | "server" and code |
| 15:00 - 15:30 | *Coffee break*   |
| 15:30 - 17:00 | Reactive logic   |

### Tuesday

| Time          | Topic            |
| :------------ | :--------------- |
| 09:00 - 10:30 | Recap & Debugging        | <!--learnr here -->
| 10:30 - 11:00 | *Coffee break*   |
| 11:00 - 12:30 | Documents & dashboards       | 
| 12:30 - 13:30 | *Lunch break*    |
| 13:30 - 15:00 | Deployment       |  <!-- including persistent storage -->
| 15:00 - 15:30 | *Coffee break*   |
| 15:30 - 16:45 | Modules          |
| 16:45 - 17:00 | [Feedback](http://rstd.io/ws-survey) |

## Instructor and Teaching Assistants

* Danny Kaplan, `kaplan@macalester.edu`
* Sara Altman
* Dean Attali, AttaliTech Ltd, <http://AttaliTech.com>
* Homer White, Georgetown College
* Randall Pruim, Calvin College



-----

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is
licensed under a [Creative Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
