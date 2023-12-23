# Install and load necessary packages
if (!require(shiny)) {
  install.packages("shiny")
}
if (!require(shinydashboard)) {
  install.packages("shinydashboard")
}
if (!require(DT)) {
  install.packages("DT")
}

library(shiny)
library(shinydashboard)
library(DT)

# Define UI with custom CSS for pink theme
ui <- dashboardPage(
  dashboardHeader(title = "Women's Wellness Resource Hub"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home"),
      menuItem("Reproductive Health", tabName = "repro"),
      menuItem("Sexual Wellness", tabName = "sexual"),
      menuItem("Menopause", tabName = "menopause"),
      menuItem("Forum", tabName = "forum")
    )
  ),
  dashboardBody(
    tags$head(
      tags$style(HTML("
        .skin-blue .main-header .logo {
          background-color: #FFC0CB;
        }
        .skin-blue .main-header .navbar {
          background-color: #FFC0CB;
        }
        .content-wrapper, .right-side {
          background-color: #FFF0F5;
        }
        .box {
          border-top-color: #FFC0CB;
        }
      "))
    ),
    tabItems(
      tabItem(tabName = "home", fluidPage(
        h2("Welcome to the Women's Wellness Resource Hub"),
        p("Find articles, videos, and join discussions on various topics related to women's health.")
      )),
      tabItem(tabName = "repro", fluidPage(
        h2("Reproductive Health"),
        dataTableOutput("reproTable")
      )),
      tabItem(tabName = "sexual", fluidPage(
        h2("Sexual Wellness"),
        dataTableOutput("sexualTable")
      )),
      tabItem(tabName = "menopause", fluidPage(
        h2("Menopause"),
        dataTableOutput("menopauseTable")
      )),
      tabItem(tabName = "forum", fluidPage(
        h2("Forum"),
        dataTableOutput("forumTable")
      ))
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Reproductive Health Dataset
  repro_data <- data.frame(
    Title = c("Assisted Reproductive Technology Impacts", "CDC Reproductive Health Reports", "Research into Reproductive Health and Disease",
              "Secondary Sex Ratio and ART", "Maternal Health Surveillance", "Pregnancy and Breastfeeding During COVID-19",
              "Fertility Clinic Summary Report", "Reproductive Health and Disease", "Women's Reproductive Health Issues",
              "Advancements in Reproductive Technology"),
    Link = c("https://reproductive-health-journal.biomedcentral.com/articles",
             "https://www.cdc.gov/reproductivehealth/index.html",
             "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5954612/",
             "https://reproductive-health-journal.biomedcentral.com/articles",
             "https://www.cdc.gov/reproductivehealth/maternalinfanthealth/pmss.html",
             "https://www.cdc.gov/coronavirus/2019-ncov/vaccines/recommendations/pregnancy.html",
             "https://www.cdc.gov/art/reports/index.html",
             "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5954612/",
             "https://www.cdc.gov/reproductivehealth/womensrh/index.html",
             "https://reproductive-health-journal.biomedcentral.com/articles")
  )
  
  # Sexual Wellness Dataset
  sexual_data <- data.frame(
    Title = c("Sexual Wellbeing and Public Health", "Women's Sexual Health - Harvard Health", "All Sexual Health Articles - Everyday Health",
              "The Health Benefits of Sex", "Sexual Wellness Trends", "Understanding Sexual Health",
              "Sexual Health for Women", "Sexual Wellness Information", "Sexual Health Education",
              "Promoting Sexual Wellness"),
    Link = c("https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(19)31978-9/fulltext",
             "https://www.health.harvard.edu/topics/sexual-health",
             "https://www.everydayhealth.com/sexual-health/",
             "https://www.healthline.com/health/benefits-of-sex",
             "https://psychcentral.com/health/sexual-wellness-trends",
             "https://www.health.harvard.edu/topics/sexual-health",
             "https://www.everydayhealth.com/sexual-health/",
             "https://www.healthline.com/health/benefits-of-sex",
             "https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(19)31978-9/fulltext",
             "https://psychcentral.com/health/sexual-wellness-trends")
  )
  
  # Menopause Dataset
  menopause_data <- data.frame(
    Title = c("Menopause - Symptoms and Causes", "Improving Menopausal Quality of Life", "Menopause: Symptoms, Causes, Treatment",
              "Staying Healthy at Menopause", "Understanding Menopause", "Menopause Health and Wellness",
              "Managing Menopause Symptoms", "Lifestyle Changes for Menopause", "Menopause Research and Studies",
              "Navigating Menopause Challenges"),
    Link = c("https://www.mayoclinic.org/diseases-conditions/menopause/symptoms-causes/syc-20353397",
             "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5986027/",
             "https://www.healthline.com/health/menopause",
             "https://www.menopause.org/for-women",
             "https://www.nia.nih.gov/health/menopause",
             "https://www.mayoclinic.org/diseases-conditions/menopause/symptoms-causes/syc-20353397",
             "https://www.healthline.com/health/menopause",
             "https://www.menopause.org/for-women",
             "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5986027/",
             "https://www.nia.nih.gov/health/menopause")
  )
  
  # Forum Dataset
  forum_data <- data.frame(
    Forum = c("Glow Community", "Patient - Women's Health Forums", "Talk Health Partnership - Women's Health Forums",
              "Women's Health Conversations", "General Women’s Health Forum", "Supportive Women's Health Network",
              "Female Health Discussions", "Wellness and Women's Health Forum", "Community for Women’s Health",
              "Informative Women's Health Space"),
    # Forum Dataset (continued)
    Link = c("https://glowing.com",
             "https://patient.info/forums",
             "https://www.talkhealthpartnership.com/talkhealth-forums",
             "https://glowing.com",
             "https://patient.info/forums",
             "https://www.talkhealthpartnership.com/talkhealth-forums",
             "https://glowing.com",
             "https://patient.info/forums",
             "https://www.talkhealthpartnership.com/talkhealth-forums",
             "https://glowing.com")
  )
  
  # Output tables for each tab
  output$reproTable <- renderDataTable({ repro_data })
  output$sexualTable <- renderDataTable({ sexual_data })
  output$menopauseTable <- renderDataTable({ menopause_data })
  output$forumTable <- renderDataTable({ forum_data })
}

# Run the Shiny app
shinyApp(ui, server)
