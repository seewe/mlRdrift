card_logo <- bsutils::carousel(
  indicators = TRUE,
  controls = TRUE,
  bsutils::carouselItem(
    shiny::img("www/logo.png"),
    p("First carousel slide"),
    class = "bg-primary rounded p-4"
  ),
  bsutils::carouselItem(
    h5("Second"),
    p("Second carousel slide"),
    class = "bg-info rounded p-4"
  )
)
  
  
  
  
#   card(
#   full_screen = TRUE,
#   card_image(
#     src = "./inst/app/www/img/logo.png",
#     alt = "d4k",
#     href = "https://github.com/seewe/mlRdrift"
#   ),
#   card_body(
#     fill = FALSE
#   ),
#   card_footer(
#     class = "fs-6",
#     "(c) dataforknow(d4k), 2024"
#   )
# )

card_home_1 <-card(
  full_screen = TRUE,
  card_header(
    "Home 1"
  ),
  card_body(
    lorem::ipsum(paragraphs = 1, sentences = 5)
  ),
  card_footer(
    class = "fs-6",
    "(c) dataforknow(d4k), 2024"
  )
)

card_home_2 <-card(
  full_screen = TRUE,
  card_header(
    "Home 2"
  ),
  card_body(
    lorem::ipsum(paragraphs = 1, sentences = 5)
  ),
  card_footer(
    class = "fs-6",
    "(c) dataforknow(d4k), 2024"
  )
)

card_home_3 <-card(
  full_screen = TRUE,
  card_header(
    "Home 3"
  ),
  card_body(
    lorem::ipsum(paragraphs = 1, sentences = 5)
  ),
  card_footer(
    class = "fs-6",
    "(c) dataforknow(d4k), 2024"
  )
)

card_home_4 <- card(
  full_screen = TRUE,
  card_header(
    "Home 4"
  ),
  card_body(
    lorem::ipsum(paragraphs = 1, sentences = 5)
  ),
  card_footer(
    class = "fs-6",
    "(c) dataforknow(d4k), 2024"
  )
)


caroussel_1 <- bsutils::carousel(
  indicators = TRUE,
  controls = TRUE,
  bsutils::carouselItem(
    h5("First"),
    p("First carousel slide"),
    class = "bg-primary rounded p-4"
  ),
  bsutils::carouselItem(
    h5("Second"),
    p("Second carousel slide"),
    class = "bg-info rounded p-4"
  )
)
