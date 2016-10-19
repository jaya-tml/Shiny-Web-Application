library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Twitter Sentiment Analysis"),
  
  # Getting User Inputs
  
  sidebarPanel(
    
    selectInput("category","Enter category for analysis", c("Movie","Product","Service","People"),selected="Movie", selectize=TRUE
               ),
    textInput("searchTerm", "Enter data to be searched with '#'", "#"),
    sliderInput("maxTweets","Number of recent tweets to use for analysis:",min=5,max=1500,value=1500), 
	#sliderInput("noOfDays","Number of recent days upto which tweets are retrieved:",min=1,max=7,value=7)
    submitButton(text="Analyse")
    
  ),
  
  mainPanel(
      

    tabsetPanel(
      
	 tabPanel("Top Trending Tweets Today",HTML("<div>Top Trending Tweets according to location</div>"),
	
	 selectInput("trendingTable","Choose location to extract trending tweets",c("Worldwide" ,  "Abu Dhabi" ,"Acapulco" , "Accra" , 
										    "Adana" , "Adela", "Aguascalientes" , "Ahmedabad" ,         
   "Ahsa" , "Albuquerque" , "Alexandria" , "Algeria" , "Algiers" , "Amman" , "Amritsar" , "Amsterdam",  "Ankara" , "Ansan" ,
	"Antalya" , "Antipolo" , "Argentina" ,  "Athens" ,  
  "Atlanta" ,             "Auckland" ,            "Austin" ,              "Australia" ,           "Austria"  ,            "Bahrain"     ,         "Baltimore"  ,         
  "Bandung"   ,           "Bangalore" ,           "Bangkok",              "Barcelona" ,           "Barcelona",            "Barquisimeto",         "Barranquilla"  ,      
  "Baton Rouge" ,         "Bekasi"    ,           "Belarus",              "Belem"     ,           "Belfast"  ,            "Belgium"     ,         "Belo Horizonte",      
  "Benin City"  ,         "Bergen"    ,           "Berlin" ,              "Bhopal"    ,           "Bilbao"   ,            "Birmingham"  ,         "Birmingham"    ,      
  "Blackpool"   ,         "Bogota"    ,           "Bologna",              "Bordeaux"  ,           "Boston"   ,            "Bournemouth" ,         "Brasilia"      ,      
  "Brazil"      ,         "Bremen"    ,           "Brest"  ,              "Brighton"  ,           "Brisbane" ,            "Bristol"     ,         "Bucheon"       ,      
  "Buenos Aires",         "Bursa"     ,           "Busan"  ,              "Cagayan de Oro" ,      "Cairo"    ,            "Calgary"     ,         "Cali"      ,          
  "Calocan"     ,         "Campinas"  ,           "Can Tho",              "Canada"    ,           "Canberra"  ,           "Cape Town"   ,         "Caracas"   ,          
  "Cardiff"     ,         "Cebu City" ,           "Changwon" ,            "Charlotte" ,           "Chelyabinsk" ,         "Chennai"     ,         "Chiba"     ,          
  "Chicago"     ,         "Chihuahua" ,           "Chile"    ,            "Cincinnati",           "Ciudad Guayana" ,      "Ciudad Juarez",        "Cleveland" ,          
  "Cologne"     ,         "Colombia"  ,           "Colorado Springs",     "Columbus"  ,           "Concepcion" ,          "Cordoba"      ,        "Cork"      ,          
  "Coventry"    ,         "Culiacan"  ,           "Curitiba"    ,         "Da Nang"   ,           "Daegu"      ,          "Daejeon"      ,        "Dallas-Ft. Worth" ,   
 "Dammam"  , "Darwin" ,"Davao City", "Delhi", "Den Haag" , "Denmark" ,"Denver" ,  "Depok" , "Derby" , "Detroit" , "Diyarbakir" , "Dnipropetrovsk" ,"Dominican Republic","Donetsk",
 "Dortmund"  ,           "Dresden" ,             "Dubai"         ,       "Dublin"      ,         "Durban"       ,        "Dusseldorf"    ,       "Ecatepec de Morelos", 
 "Ecuador"       ,       "Edinburgh" ,           "Edmonton"      ,       "Egypt"       ,         "El Paso"      ,        "Eskisehir"     ,       "Essen"    ,           
 "Faisalabad"    ,       "Fortaleza"  ,          "France"        ,       "Frankfurt"   ,         "Fresno"       ,        "Fukuoka"       ,       "Galway"   ,           
 "Gaziantep"    ,        "Gdansk"      ,         "Geneva"       ,        "Genoa"       ,         "Germany"      ,        "Ghana"         ,       "Giza"     ,           
 "Glasgow"      ,        "Goiania"     ,         "Gomel"        ,        "Gothenburg"  ,         "Goyang"       ,        "Greece"        ,       "Greensboro" ,         
 "Grodno"       ,        "Guadalajara" ,         "Guarulhos"    ,        "Guatemala"   ,         "Guatemala City"  ,     "Guayaquil"     ,       "Gwangju"  ,           
 "Hai Phong"    ,        "Haifa"       ,         "Hamamatsu"    ,        "Hamburg"     ,         "Hanoi"      ,          "Harrisburg"    ,       "Hermosillo"     ,     
 "Hiroshima"    ,        "Ho Chi Minh City" ,    "Honolulu"     ,        "Houston"     ,         "Hull"       ,          "Hulu Langat"   ,       "Hyderabad"      ,     
 "Ibadan"       ,        "Incheon"      ,        "India"        ,        "Indianapolis",         "Indonesia" ,           "Indore"        ,       "Ipoh"           ,     
 "Ireland"      ,        "Irkutsk"       ,       "Israel"       ,        "Istanbul"    ,         "Italy"     ,           "Izmir"         ,       "Jackson"        ,     
 "Jacksonville" ,        "Jaipur"        ,       "Jakarta"      ,        "Japan"       ,         "Jeddah"    ,           "Jerusalem"     ,       "Johannesburg"   ,     
 "Johor Bahru"  ,        "Jordan"        ,       "Kaduna"       ,        "Kajang"      ,         "Kano"      ,           "Kanpur"        ,       "Kansas City"    ,     
 "Karachi"      ,        "Kawasaki"      ,       "Kayseri"      ,        "Kazan"       ,         "Kenya"     ,           "Khabarovsk"    ,       "Kharkiv"        ,     
 "Kitakyushu"   ,        "Klang"         ,       "Kobe"         ,        "Kolkata"      ,        "Konya"     ,           "Korea"         ,       "Krakow"         ,     
 "Krasnodar"    ,        "Krasnoyarsk"   ,       "Kuala Lumpur" ,        "Kumamoto"    ,         "Kumasi"    ,           "Kuwait"        ,       "Kyiv"           ,     
"Kyoto" ,               "Lagos"    ,            "Lahore"       ,        "Las Palmas",           "Las Vegas"   ,         "Latvia" ,              "Lausanne"       ,     
"Lebanon" ,              "Leeds"   ,             "Leicester",            "Leipzig" ,             "Leon"        ,         "Lille"  ,              "Lima" ,               
"Liverpool" ,           "Lodz"     ,            "London"      ,         "Long Beach" ,          "Los Angeles"  ,        "Louisville"       ,    "Lucknow"  ,           
"Lviv"       ,          "Lyon"          ,       "Madrid"       ,        "Makassar"    ,         "Makati"      ,         "Malaga"          ,     "Malaysia"  ,          
 "Manaus"     ,          "Manchester"  ,         "Manila"       ,        "Maracaibo"   ,         "Maracay"   ,           "Marseille"     ,       "Maturin"   ,   
 "Mecca"       ,         "Medan"      ,          "Medellin"      ,       "Medina"       ,        "Melbourne"  ,          "Memphis"      ,        "Mendoza"    ,         
 "Merida"       ,        "Mersin"    ,           "Mesa"           ,      "Mexicali"      ,       "Mexico"    ,           "Mexico City" ,         "Miami"       ,        
 "Middlesbrough" ,       "Milan"    ,            "Milwaukee"       ,     "Minneapolis"    ,      "Minsk"      ,          "Mombasa"    ,          "Monterrey"    ,       
"Montpellier"     ,     "Montreal" ,            "Morelia"           ,   "Moscow"           ,    "Multan"    ,           "Mumbai"     ,          "Munich" ,     
 "Murcia"  ,             "Muscat" ,              "Nagoya"       ,    "Nagpur"            ,   "Nairobi"  ,            "Nantes"    ,           "Naples"          ,    
 "Nashville" , "Netherlands",  "New Haven" , "New Orleans" , "New York","New Zealand" , "Newcastle", "Nigeria" , "Niigata" ,"Nizhny Novgorod" , "Norfolk", "Norway", 
"Nottingham"   ,        "Novosibirsk"      ,    "Odesa"         ,       "Okayama"      ,        "Okinawa"         ,     "Oklahoma City"     ,   "Omaha"    ,           
"Oman"          ,       "Omsk"            ,     "Orlando"        ,      "Osaka"        ,        "Oslo"              ,   "Ottawa"           ,    "Pakistan"  ,          
"Palembang"      ,      "Palermo"        ,      "Palma"            ,    "Panama"        ,       "Paris"            ,    "Pasig"           ,     "Patna"      ,         
"Pekanbaru"       ,     "Perm"          ,       "Perth"           ,     "Peru"           ,      "Petaling"        ,     "Philadelphia"   ,      "Philippines" ,        
"Phoenix"    ,          "Pittsburgh"   ,        "Plymouth"  ,           "Poland"          ,     "Port Elizabeth" ,      "Port Harcourt" ,       "Portland"     ,       
"Porto Alegre" ,        "Portsmouth"  ,         "Portugal"   ,          "Poznan"           ,    "Preston"       ,       "Pretoria"     ,        "Providence"    ,      
"Puebla"        ,       "Puerto Rico"    ,      "Pune"        ,         "Qatar"             ,   "Quebec"       ,        "Queretaro"           , "Quezon City"    ,     
 "Quito"    ,            "Rajkot"       ,        "Raleigh"     ,         "Ranchi"            ,   "Rawalpindi" ,          "Recife"            ,   "Rennes"         ,     
"Richmond"   ,          "Riga"         ,        "Rio de Janeiro",       "Riyadh"      ,         "Rome"       ,          "Rosario"           ,   "Rostov-on-Don"    ,   
 "Rotterdam"  ,          "Russia"     ,          "Sacramento"    ,       "Sagamihara"  ,         "Saint Petersburg",     "Saitama"         ,     "Salt Lake City"  ,    
"Saltillo"     ,        "Salvador"   ,          "Samara"          ,     "San Antonio"   ,       "San Diego"       ,     "San Francisco"   ,     "San Jose"  ,  
"San Luis Potosi",      "Santiago"  ,           "Santo Domingo"    ,  "Sao Paulo"      ,      "Sapporo"        ,      "Saudi Arabia"       , 
"Seattle"   ,           "Semarang"      ,       "Sendai"            ,   "Seongnam"        ,     "Seoul"         ,       "Seville"       ,       "Sharjah"   ,          
 "Sheffield" ,           "Singapore"   ,         "Singapore"         ,   "South Africa"    ,     "Soweto"      ,         "Spain"       ,         "Srinagar"  ,          
 "St. Louis"  ,          "Stockholm"  ,          "Stoke-on-Trent"     ,  "Strasbourg"       ,    "Stuttgart"  ,          "Surabaya"   ,          "Surat"      ,         
"Suwon"        ,        "Swansea"    ,          "Sweden"     ,          "Switzerland"        ,  "Sydney"     ,          "Taguig"     ,          "Takamatsu"    ,       
 "Tallahassee"  ,        "Tampa"    ,            "Tangerang"  ,          "Tel Aviv"           ,  "Thailand" ,            "Thane"    ,            "Thessaloniki" ,       
"Tijuana"        ,      "Tokyo"    ,            "Toluca"       ,        "Toronto"   ,           "Toulouse"          ,   "Tucson"   ,            "Turin"          ,     
"Turkey"    ,           "Turmero"     ,         "Ufa"           ,       "Ukraine"    ,          "Ulsan"            ,    "United Arab Emirates", "United Kingdom"   ,   
 "United States" ,       "Utrecht"   ,           "Valencia"      ,       "Valencia"   ,          "Valparaiso"     ,      "Vancouver"   ,         "Venezuela"      ,     
"Vienna"      ,         "Vietnam"   ,           "Virginia Beach"  ,     "Vladivostok"  ,        "Volgograd"      ,      "Voronezh"    ,         "Warsaw"  ,            
 "Washington"  ,         "Winnipeg",  "Wroclaw"      ,        "Yekaterinburg",        "Yokohama"  ,  "Yongin",              
"Zamboanga City" ,      "Zapopan",              "Zaporozhye"       ,    "Zaragoza"       ,      "Zurich"  ), selected = "Worldwide", selectize = FALSE),
            HTML("<div> The table below shows the top 20 trending 
	hashtags on Twitter of the location you have chosen. These are the hot topics today! </div>"),
			HTML
               ("<div> </div>")),


       tabPanel("WordCloud",HTML("<div>Most used words associated with the hashtag</div>"),verbatimTextOutput("wordcloud"),plotOutput("word"),
               HTML
               ("<div>A word cloud is a visual representation of text data, typically used to depict keyword metadata (tags) on websites, or to visualize free form text.
This format is useful for quickly perceiving the most prominent terms and for locating a term alphabetically to determine its relative prominence.
                </div>")),
      
      tabPanel("Histogram",plotOutput("histPos"),plotOutput("histNeg"),plotOutput("histScore"),
               HTML
               ("<div> Histograms graphically depict the positivity or negativity of peoples' opinions of the hastag</div>")),
      
      tabPanel("Pie Chart",HTML("<div>Depicting sentiment on a scale of 5</div>"), plotOutput("piechart"), 
		HTML   
		("<div> A pie chart is a circular statistical graphic, which is divided into slices to illustrate the sentiment of the hastag. 
In a pie chart, the arc length of each slice (and consequently its central angle and area), is proportional to the quantity it represents.</div>")
               
               ),
      
      tabPanel("Table",HTML
               ("<div> Depicting sentiment in a tabular form on a scale of 5</div>"),
               tableOutput('tabledata'),
		HTML   
		("<div> The table depicts the sentiment (positive, negative or neutral) of the tweets associated withy the search hastag by showing the score 
            for each type of sentiment</div>")
            
		),
      
      tabPanel("Top tweeters",HTML
               ("<div> Top 15 tweeters of hastag</div>"),plotOutput("entity1wcplot")),
      
      tabPanel("Timeline plot",plotOutput("timelineTable"),HTML
               ("<div> This plot shows timeline of tweets of upto 7 recent days for frequency of tweets hour wise</div>"))
    )#end of tabset panel
  )#end of main panel
  
))#end of shinyUI
