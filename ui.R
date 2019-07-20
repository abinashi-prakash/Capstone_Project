
library(shiny)
library(markdown)
shinyUI(navbarPage("Capstone Project",
                   tabPanel("Word Prediction App",
                            sidebarLayout(
                              sidebarPanel(
                                textInput("User_Input", "Enter word/s",value = ""),
                                ##strong("Click to get predicted words."),
                                ##submitButton("Refresh", icon("Refresh")),
                                helpText("Enter the word so that next word can be predicted using Three Gram or Two Gram dataset."),
                                br()
                              ),
                              mainPanel(
                                h3(strong("Most Preferred Predicted Word")),
                                verbatimTextOutput("prediction"),
                                strong("Note:"),
                                textOutput('msg2'),
                                br(),
                                h3(strong("Probable Words")),
                                verbatimTextOutput('Probabale_Words'),
                                br(),
                                strong("Predicted Senetence:"),
                                textOutput('New_Sentence'),
                                br(),
                                br(),
                                strong("User Input:"),
                                textOutput('msg1'),
                                br()
                              )
                            )
                            
                   )
)
)
