suppressWarnings(library(tm))
suppressWarnings(library(stringr))
suppressWarnings(library(shiny))

##Reading Input files 
One_gram <- read.csv("https://raw.githubusercontent.com/abinashi-prakash/Capstone_Project/master/One_gram.csv",header = TRUE,stringsAsFactors = F);
Two_gram <- read.csv("https://raw.githubusercontent.com/abinashi-prakash/Capstone_Project/master/Two_gram.csv",header = TRUE,stringsAsFactors = F);
Three_gram <- read.csv("https://raw.githubusercontent.com/abinashi-prakash/Capstone_Project/master/Three_gram.csv",header = TRUE,stringsAsFactors = F);
echo <<- ""
Possible_10_Match <<- NULL

# Cleaning of user input
Predict <- function(x) {
  Possible_10_Match <<- NULL
  echo <<- NULL
  clean_input_words <- removeNumbers(removePunctuation(tolower(x)))
  Input_word <- strsplit(clean_input_words, " ")[[1]]

#Prediction Logic
  if(length(Input_word) >= 2)
  {
      Input_word <- tail(Input_word,2)
      if(length(head(Three_gram[Three_gram$Str1 == Input_word[1] & Three_gram$Str2 == Input_word[2], 3],1)) > 0)
        {
            Possible_10_Match <<- head(Three_gram[Three_gram$Str1 == Input_word[1] & Three_gram$Str2 == Input_word[2], 3],10);
            echo<<- "Match Found in Three Gram"; 
            head(Three_gram[Three_gram$Str1 == Input_word[1] & Three_gram$Str2 == Input_word[2], 3],1)
            
        }
      else {Predict(Input_word[2])}
      
  } 
   else if(length(Input_word)==1)
       {
         if(length(head(Two_gram[Two_gram$Str1 == Input_word[1], 2],1))>0)
         {
           Possible_10_Match <<- head(Two_gram[Two_gram$Str1 == Input_word[1],2],10);
           echo <<- "Match Found in Two Gram";head(Two_gram[Two_gram$Str1 == Input_word[1],2],1)
         }
         else{
              echo<<-"No match found";
              Possible_10_Match <<- "No match found"
             }
        
       }
  else {""}
  }

shinyServer(function(input, output) {
    ##output$prediction <- renderPrint({""});
    output$prediction <- renderPrint({
    result <- Predict(input$User_Input)
    output$msg2 <- renderText({echo})
    output$Probabale_Words <- renderPrint({cat(Possible_10_Match,sep = ' ;')})
    cat(result)
  });
    output$msg1 <- renderText({input$User_Input});
    output$New_Sentence <- renderText({
          complete_Sentence <- ifelse(Predict(input$User_Input) == "No match found",input$User_Input,paste(input$User_Input,Predict(input$User_Input),sep = " "))
          complete_Sentence})
  
    })

    
