#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# use the libraries
library(shiny)
library(plotly)
library(medicaldata)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
    output$plot1 <- renderPlotly({
        # add space to the variable name for later use 
        variable_here <- gsub('([[:upper:]])', ' \\1', input$names)
        # delete left and right blank for the variable name of input for later use
        variable_here <- trimws(variable_here)
        # draw the histogram with the specified number of bins
        ggplot_here <- ggplot(blood_storage, aes_string(input$names)) + 
          geom_histogram(bins = input$bins,
                         fill = "grey",
                         col = "white") +
          xlab(variable_here) + 
          ylab("Count") + 
          ggtitle(paste("Distribution of", variable_here))
        
        # use ggplotly
        ggplotly(ggplot_here)

    })
    
    
    output$plot2 <- renderPlotly({
      # change the value of variable "Group" for later use
      smartpill$Group <- as.character(smartpill$Group)
      smartpill$Group[smartpill$Group == "0"] <- 'Trauma Patient'
      smartpill$Group[smartpill$Group == "1"] <- 'Healthy Volunteers'
      
      # change the format of user input variable for later use
      if(input$names2 == "GE.Time"){
        variable_here2 <- "Gastric Emptying Time"
      }else if(input$names2 == "SB.Time"){
        variable_here2 <- "Small Bowel Transit Time"
      }else{
        variable_here2 <- "Whole Gut Time"
      }
      
      # the boxplot 
      ggplot_here2 <- ggplot(smartpill, aes_string("Group", input$names2)) + 
        geom_boxplot(aes(fill = Group)) +
        xlab("Study Group") + 
        ylab(variable_here2) +  
        ggtitle(paste("Boxplot of", variable_here2, "for different Groups")) +
        scale_fill_discrete(name = "Group", labels = c("Trauma Patients", 
                                                       "Healthy Volunteers"))
      
      # adjust the layout for the legend and plot using ggplotly
      ggplotly(ggplot_here2) %>%
        layout(legend = list(
          orientation = "h",
          y = -0.2
        )
        )
    })
    
    
    output$plot3 <- renderPlotly({
      # change the value of variable "Group" for later use
      smartpill$Group <- as.character(smartpill$Group)
      smartpill$Group[smartpill$Group == "0"] <- 'Trauma Patient'
      smartpill$Group[smartpill$Group == "1"] <- 'Healthy Volunteers'
      
      # add the scatter-plot
      ggplot_here2 <- ggplot(smartpill, aes_string(x = input$names3,
                                                   y = "WG.Time",
                                                   color = "Group")) + 
        geom_point(alpha = .7) +
        xlab(input$names3) + 
        ylab("Whole Gut Time") + 
        ggtitle(paste("Scatterplot of", input$names3, "Over Gastric Emptying Time")) +
        scale_color_discrete(name = "Group", labels = c("Trauma Patients", 
                                                       "Healthy Volunteers")) 
      
      # plot using ggplotly
      ggplotly(ggplot_here2) 
    })

})
