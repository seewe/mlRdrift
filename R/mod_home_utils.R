# Logo carousel
{
  card_logo <- bsutils::carousel(
    indicators = TRUE,
    controls = FALSE,
    bsutils::carouselItem(
      card(
        full_screen = FALSE,
        card_image(
          src = "./www/img/logo.png",
          alt = "d4k", 
          height = "90%"
        )
      )),
    bsutils::carouselItem(
      card(
        full_screen = FALSE,
        card_image(
          src = "./www/img/logo.png",
          alt = "d4k", 
          height = "90%"
        )
      ))
  )
}

# Method definition

## Metric preset -------------------------------------------------------------
{
  card_home_DQ <-card(
    full_screen = TRUE,
    card_body(
      fill = FALSE, 
      gap = 0,
      card_title(a("Data Quality", href = "https://docs.evidentlyai.com/presets/data-quality")),
      p(class = "text-muted", 
        "Shows the dataset statistics and feature behavior."
      ),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model inputs."
      )
    )
  )
  
  card_home_DD <-card(
    card_body(
      fill = FALSE, 
      gap = 0,
      card_title(a("Data Drift", href = "https://docs.evidentlyai.com/presets/data-drift")),
      p(class = "text-muted",
        "Explores the distribution shift in the model features."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", "model inputs, a reference dataset.")
    )
  )
  
  card_home_TD <-card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("Target Drift", href = "https://docs.evidentlyai.com/presets/target-drift")),
      p(class = "text-muted",
        "Explores the distribution shift in the model predictions/target."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model predictions/target, a reference dataset.")
    )
  )
  
  card_home_CL <- card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("Classification", href = "https://docs.evidentlyai.com/presets/class-performance")),
      p(class = "text-muted",
        "Evaluates the classification model quality and errors."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model predictions and true labels.")
    )
  )
  
  card_home_RG <- card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("Regression", href = "https://docs.evidentlyai.com/presets/reg-performance")),
      p(class = "text-muted",
        "Evaluates the regression model quality and errors."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model predictions and actuals.")
    )
  )
  
  card_home_TO <- card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("Text Overview", href = "https://docs.evidentlyai.com/presets/text-overview")),
      p(class = "text-muted",
        "Evaluates text data drift and descriptive statistics."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model inputs (raw text data)")
    )
  )
}


## Test preset ---------------------------------------------------------------
{
  
  card_home_NTP <-card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("NoTargetPerformance", href = "https://docs.evidentlyai.com/presets/no-target-performance")),
      p(class = "text-muted",
        "Tests the model performance without ground truth or actuals."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model inputs, predictions, a reference dataset.")
    )
  )
  
  card_home_DDT <-card(
    card_body(
      fill = FALSE, 
      gap = 0,
      card_title(a("Data Drift", href = "https://docs.evidentlyai.com/presets/data-drift#data-drift-test-suite")),
      p(class = "text-muted",
        "Tests for distribution drift per column and overall dataset drift."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", "model inputs, a reference dataset.")
    )
  )
  
  card_home_DST <-card(
    card_body(
      fill = FALSE, 
      gap = 0,
      card_title(a("Data Stability", href = "https://docs.evidentlyai.com/presets/data-quality#data-stability-test-suite")),
      p(class = "text-muted",
        "Tests if a data batch is similar to reference. Checks schema, data ranges, etc."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", "inputs, a reference dataset.")
    )
  )
  
  card_home_DQT <-card(
    full_screen = TRUE,
    card_body(
      fill = FALSE, 
      gap = 0,
      card_title(a("Data Quality", href = "https://docs.evidentlyai.com/presets/data-quality#data-quality-test-suite")),
      p(class = "text-muted", 
        "Tests if the data quality is suitable for (re)training. Checks nulls, duplicates, etc."
      ),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model inputs."
      )
    )
  )
  
  card_home_RGT <- card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("Regression", href = "https://docs.evidentlyai.com/presets/reg-performance#regression-performance-test-suite")),
      p(class = "text-muted",
        "Tests the performance of the regression model against expectation."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model predictions and actuals.")
    )
  )
  
  card_home_MCC <- card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("Multi-class Classification", href = "https://docs.evidentlyai.com/presets/class-performance#classification-performance-test-suite")),
      p(class = "text-muted",
        "Tests the performance of a multi-class classification model against expectation."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model predictions, true labels.")
    )
  )
  
  card_home_BCT <- card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("Binary Classification", href = "https://docs.evidentlyai.com/presets/class-performance#classification-performance-test-suite")),
      p(class = "text-muted",
        "Tests the performance of a binary classification model against expectation."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model predictions and true labels.")
    )
  )
  
  card_home_BCK <- card(
    card_body(
      fill = TRUE, 
      gap = 0,
      card_title(a("Binary Classification top-K", href = "https://docs.evidentlyai.com/presets/class-performance#classification-performance-test-suite")),
      p(class = "text-muted",
        "Tests the performance of a binary classification model at top-K."),
      strong(class = "text-muted", "Requirements: "),
      p(class = "text-muted", 
        "model predictions and true labels.")
    )
  )
}

# Global definition carousel

{
caroussel_1 <- bsutils::carousel(
  indicators = TRUE,
  controls = FALSE,
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
}