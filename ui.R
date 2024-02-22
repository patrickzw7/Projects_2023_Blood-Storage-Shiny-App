#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# use the libraries
library(shiny)
library(plotly)
library(medicaldata)
library(markdown)

# Define a navigation bar page
navbarPage("Data Challenge 4", 

    # Create the first tab panel
    tabPanel("Plot 1: Histogram for Blood Storage",
             
             # Sidebar with a slider input for number of bins
             # and radio buttons for variable of interest
             sidebarLayout(
               sidebarPanel(
                 # h4 for the dataset name in description
                 h4("Blood Storage Data", style = "font-weight: bold"),
                 # dataset description
                 p("The data set, from the study \"Blood Storage
                   Duration and Biochemical Recurrence of Cancer after Radical
                   Prostatectomy\"
                   contains 316 men who had undergone radical 
                   prostatectomy and received transfusion during or within 
                   30 days of the surgical procedure and had available
                   follow up data. Variables are binned RBC storage duration and
                   other demographic, 
                   baseline and prognostic factors like their age. The outcome here
                   is the time for biochemical cancer recurrence. "),
                 
                 # h4 for using the app instruction
                 h4("Instructions", style = "font-weight: bold"),
                 # instruction text
                 p("To change to the other two plots, 
                  click on the navigation bar above.
                  For the plot 1 that is displayed here, it is the histogram of a 
                  user selected variable of interest among all participants for the
                  blood storage data collection, including Age and Time to Recurrence.
                  The user can also slide through the slider to select the number of bins
                  for the distribution histogram in order
                  to have a better understanding of the distribution of the two variables."),
                 
                 # sliding 
                 sliderInput(inputId = "bins",
                             "Number of bins:",
                             min = 1,
                             max = 10,
                             value = 5
                             ),
                 #radio buttons
                 radioButtons(inputId = "names",
                              label = "Variable of Interest",
                              choices = c("Age" = "Age",
                                        "Time to Recurrence" = "TimeToRecurrence"),
                              selected = "Age")
                           ),
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("plot1", height = "600px")
             )
            )
    ),
    
    tabPanel("Plot 2: Boxplot for Smart Pill",
             
             # Sidebar with a radio buttons input for variable of interest
             sidebarLayout(
               sidebarPanel(
                 # h4 for the dataset name
                 h4("Smart Pill Data", style = "font-weight: bold"), 
                 # text for the dataset description
                 p("This study, \" Use of Wireless Utility Capsule to 
                   Determine Gastric Emptying and Small Intestinal
                   Transit Times in Critically Ill Trauma Patients \"
                   evaluated gastric emptying, 
                   small bowel transit time, and total intestinal
                   transit time in 8 critically ill trauma patients.
                   They were compared with those
                   obtained in 87 healthy volunteers 
                   from a separate trial.
                   Variables are the time for the three periods and total time, 
                   with others like pH, pressure and temperature also collected, 
                   however just very few of them have data collected for these other parameters. 
                   "),
                 
                 # h4 for the instruction title
                 h4("Instructions", style = "font-weight: bold"),
                 # text for the instruction
                 p("To change to the other two plots, 
                  click on the navigation bar above.
                  For the plot 2 that is displayed here, it is the boxplot
                  of a user-selected variable in the smart pill dataset,
                  with options of different digestion time periods,
                  displaying two side-by-side boxplots of different groups (patient or 
                  healthy volunteer) colored by groups."),
                 
                 # the radio buttons for user interaction
                 radioButtons(inputId = "names2",
                              label = "Variable of Interest",
                              choices = c("Gastric Emptying Time" = "GE.Time",
                                          "Small Bowel Transit Time" = "SB.Time",
                                          "Whole Gut Time" = "WG.Time"),
                              selected = "GE.Time")
                              ),
               
      # Show a plot of the generated distribution
      mainPanel(
        plotlyOutput("plot2", height = "600px")
      )
     )
    ),
    
    tabPanel("Plot 3: Scatterplot for Smart Pill",
             # Sidebar with a slider input for number of bins
             sidebarLayout(
               sidebarPanel(
                 
                 # h4 for the dataset name
                 h4("Smart Pill Data", style = "font-weight: bold"),
                 # text for the dataset description
                 p("This study, \" Use of Wireless Utility Capsule to 
                   Determine Gastric Emptying and Small Intestinal
                   Transit Times in Critically Ill Trauma Patients \"
                   evaluated gastric emptying, 
                   small bowel transit time, and total intestinal
                   transit time in 8 critically ill trauma patients.
                   They were compared with those
                   obtained in 87 healthy volunteers 
                   from a separate trial.
                   Variables are the time for the three periods and total time, 
                   with others like pH, pressure and temperature also collected, 
                   however just very few of them have data collected for these other parameters. "),
                 
                 # h4 for the running instruction
                 h4("Instructions", style = "font-weight: bold"),
                 # text for the instruction
                 p("To change to the other two plots, 
                  click on the navigation bar above.
                  For the plot 3 that is displayed here, it is the scatterplot
                  of whole gut time over 
                  a user-selected variable in the smart pill dataset,
                  with options of height, weight and age which can be selected,
                  displaying a scatterplot of whole gut time over the user-select variable
                  colored by different groups (patient or 
                  healthy volunteer), showing their overall relationship. "),
                 
                 # select input interaction interface 
                 selectInput(inputId = "names3",
                             "Variable of Interest",
                             choices = c("Height" = "Height",
                                          "Weight" = "Weight",
                                          "Age" = "Age"))
               ),
               
      # Show a plot of the generated distribution
      mainPanel(
        plotlyOutput("plot3", height = "600px")
      )
    )
  )
)

    
                       
