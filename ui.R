library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
    
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
    ),
    
    pageWithSidebar(
        # Application title
        headerPanel("Animals Classification"),
        
        sidebarPanel(
            h4("Choose an animal and describe it by answering the following questions"),
            h4("We will predict its type"),
            h4(""),
            h5("Ex : Elephant"),
            h6("Hair: Yes, Feathers : No, Eggs : No, Milk : Yes, Airborne: No, 
               Aquatic : No, Predator: No, Toothed : Yes, Backbone : Yes, 
               Breathes : Yes, Venomous : No, Fins : No, Legs : 4,
               Tail : Yes, Domestic : No, Catsize : Yes "),
            
            checkboxInput("hair", "hair", FALSE),
            checkboxInput("feathers", "feathers", FALSE),
            checkboxInput("eggs", "eggs", FALSE),
            checkboxInput("milk", "milk", FALSE),
            checkboxInput("airborne", "airborne", FALSE),
            checkboxInput("aquatic", "aquatic", FALSE),
            checkboxInput("predator", "predator", FALSE),
            checkboxInput("toothed", "toothed", FALSE),
            checkboxInput("backbone", "backbone", FALSE),
            checkboxInput("breathes", "breathes", FALSE),
            checkboxInput("venomous", "venomous", FALSE),
            checkboxInput("fins", "fins", FALSE),
            sliderInput("legs", "legs", value = 2, min=0, max =8, step = 1),
            checkboxInput("tail", "tail", FALSE),
            checkboxInput("domestic", "domestic", FALSE),
            checkboxInput("catsize", "catsize", FALSE),
            submitButton("Submit"),
            h5('jetzgetzlos, 27/05/2017')
        ),
        mainPanel(
            h2('Results of prediction'),
            h4('According to our analysis (machine learning algorithm) on the UCI (University of California Irvine) ML Zoo Data Set'),
            h4('The animal classication is : '),
            verbatimTextOutput("prediction"),
            h3(''),
            h3(''),
            h3(''),
            h4('Documentation:'),
            h5('Class# Set of animals:'),
            
            tags$ul(
                tags$li(tags$b("Class #1")," : (41) aardvark, antelope, bear, boar, buffalo, calf,
            cavy, cheetah, deer, dolphin, elephant,
                        fruitbat, giraffe, girl, goat, gorilla, hamster,
                        hare, leopard, lion, lynx, mink, mole, mongoose,
                        opossum, oryx, platypus, polecat, pony,
                        porpoise, puma, pussycat, raccoon, reindeer,
                        seal, sealion, squirrel, vampire, vole, wallaby,wolf"), 
                tags$li(tags$b("Class #2")," : (20) chicken, crow, dove, duck, flamingo, gull, hawk,
            kiwi, lark, ostrich, parakeet, penguin, pheasant,
               rhea, skimmer, skua, sparrow, swan, vulture, wren"), 
                tags$li(tags$b("Class #3")," : (5)  pitviper, seasnake, slowworm, tortoise, tuatara "),
                tags$li(tags$b("Class #4")," : (13) bass, carp, catfish, chub, dogfish, haddock,
            herring, pike, piranha, seahorse, sole, stingray, tuna"),
                tags$li(tags$b("Class #5")," : (4)  frog, frog, newt, toad "),
                tags$li(tags$b("Class #6")," : (8)  flea, gnat, honeybee, housefly, ladybird, moth, termite, wasp"),
                tags$li(tags$b("Class #7")," : (10) clam, crab, crayfish, lobster, octopus,scorpion, seawasp, slug, starfish, worm")
            ),
            h3(""),
            h3(""),
            a("UCI Machine Learning Repository: Zoo Data Set", href="http://archive.ics.uci.edu/ml/datasets/zoo"),
            h3(""),
            tags$i("Lichman, M. (2013). UCI Machine Learning Repository ["),
            a("http://archive.ics.uci.edu/ml", href="http://archive.ics.uci.edu/ml"),
            tags$i("]. Irvine, CA: University of California, School of Information and Computer Science.")
        )
    )
))
