
suppressWarnings(library(shiny))
suppressWarnings(library(markdown))
shinyUI(navbarPage("Capstone Project",
                   tabPanel("Word Prediction App",
                            sidebarLayout(
                              sidebarPanel(
                                textInput("User_Input", "Enter word/s",value = ""),
                                helpText("Enter the word so that next word can be predicted using Three Gram or Two Gram dataset."),
                                br(),
                                strong("Click to get predicted words."),
                                submitButton("Submit", icon("Refresh")),
                                br(),
                                strong("Note:"),
                                helpText("We will not get any prediction if we are giving only,"),  
                                strong("special characters,punctuations, 
                                          numbers,whitespace,Stopwords,  stemDocument and Offensive words as these are cleaned 
                                          in supporting dataset being used for prediction."),
                                br()
                              ),
                              mainPanel(
                                h3(strong("Most Preferred Predicted Word")),
                                verbatimTextOutput("prediction"),
                                tags$head(tags$style("#prediction{color:white;font-weight: bold;font-size: 20px;background-color:black}")),
                                strong("Note:"),
                                textOutput('msg2'),
                                br(),
                                h3(strong("Probable Words")),
                                verbatimTextOutput('Probabale_Words'),
                                tags$head(tags$style("#Probabale_Words{color:black;font-weight: bold;font-size: 15px}")),
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
