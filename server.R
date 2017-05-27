library(shiny)
library(caret)
library(randomForest)
library(e1071)



prediction <- function(modFit_rf, input){
    
    animal <- NULL
    
    animal$hair <- as.numeric(input$hair)
    animal$feathers <- as.numeric(input$feathers)
    animal$eggs <- as.numeric(input$eggs)
    animal$milk <- as.numeric(input$milk)
    animal$airborne <- as.numeric(input$airborne)
    animal$aquatic <- as.numeric(input$aquatic)
    animal$predator <- as.numeric(input$predator)
    animal$toothed <- as.numeric(input$toothed)
    animal$backbone <- as.numeric(input$backbone)
    animal$breathes <- as.numeric(input$breathes)
    animal$venomous <- as.numeric(input$venomous)
    animal$fins <- as.numeric(input$fins)
    animal$legs <- as.numeric(input$legs)
    animal$tail <- as.numeric(input$tail)
    animal$domestic <- as.numeric(input$domestic)
    animal$catsize <- as.numeric(input$catsize)
    
    as.numeric(predict(modFit_rf,animal))
}





class_string <- function(class_id) {
    
    type <- "unknown"
    
    if (class_id == 1){
        type <- "Type #1 : -- (41) aardvark, antelope, bear, boar, buffalo, calf, cavy, cheetah, deer, dolphin, elephant, fruitbat, giraffe, girl, goat, gorilla, hamster, hare, leopard, lion, lynx, mink, mole, mongoose, opossum, oryx, platypus, polecat, pony, porpoise, puma, pussycat, raccoon, reindeer, seal, sealion, squirrel, vampire, vole, wallaby,wolf"
    }
    
    if (class_id == 2){
        type <-"Type #2 : chicken, crow, dove, duck, flamingo, gull, hawk, kiwi, lark, ostrich, parakeet, penguin, pheasant, rhea, skimmer, skua, sparrow, swan, vulture, wren"
    }
    
    if (class_id == 3){
        type <- "Type #3 : pitviper, seasnake, slowworm, tortoise, tuatara"
    }
    
    if (class_id == 4){
        type <-"Type #4 : bass, carp, catfish, chub, dogfish, haddock, herring, pike, piranha, seahorse, sole, stingray, tuna"
    }
    
    if (class_id == 5){
        type <-"Type #5 : frog, frog, newt, toad"
    }
    
    if (class_id == 6){
        type <- "Type #6 : flea, gnat, honeybee, housefly, ladybird, moth, termite, wasp"
    }
    
    if (class_id == 7){
        type <-"Type #7 : clam, crab, crayfish, lobster, octopus, scorpion, seawasp, slug, starfish, worm"
    }
    
    type
}
    
shinyServer(
    function(input, output) {
        #Load dataset
        zoo_df <- read.csv("data/zoo.data")
        
        names(zoo_df) <- c("animal_name", "hair", "feathers",
                           "eggs", "milk", "airborne", "aquatic",
                           "predator", "toothed", "backbone", "breathes",
                           "venomous", "fins", "legs", "tail","domestic",
                           "catsize", "type")
        
        zoo_df$type <- as.factor(zoo_df$type)
        
        #Classification with Random Forest Algp
        set.seed(2605)
        #delete the first column : Animal name
        zoo_df <- zoo_df[,-c(1)]
        
        #Split the dataset in two subsets: training and testing
        inTrain <- createDataPartition(y = zoo_df$type, p=0.7, list=FALSE)
        train <- zoo_df[inTrain,]
        test <- zoo_df[-inTrain,]
        
        #RF model
        modFit_rf <- train(type ~ ., method="rf", data =train, verbose = F)
        
        
       output$prediction <- renderPrint({class_string(prediction(modFit_rf,input))})
    }
)
