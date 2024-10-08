library(glue)
library(stringr)

extdata_path <- function (...) {
  system.file("extdata", ..., package = "WONDER")
}

test_that("import_WONDER_UCD() works on inst/extdata examples", {

  for (timespan in c("2003-2012", "2007-2016", "2011-2020")) {
    for (geography in c("ByCounty", "Regional")) {
      for (variant in c("Hispanic", "NH-ByRace", "AllRaceEth")) {

        test_fn <- glue::glue("UCD-{timespan}-SFBA-{geography}-{variant}.txt")
        test_path <- extdata_path("UCD", timespan, test_fn)
        expect_true(file.exists(test_path))
        test_data <- import_WONDER_UCD(test_path)

        expect_s3_class(test_data, "tbl_df")
        expect_setequal(names(test_data), c("cnty_name", "numer", "denom", "raceeth", "rate_adj", "rate_crude"))
        expect_s3_class(test_data$denom, "units")
        expect_s3_class(test_data$rate_adj, "vctrs_rcrd")

        if (str_detect(geography, "ByCounty")) {
          expect_setequal(
            test_data$cnty_name,
            c("Alameda", "Contra Costa", "Marin", "Napa", "San Francisco",
              "San Mateo", "Santa Clara", "Solano", "Sonoma"))
        } else {
          expect_setequal(test_data$cnty_name, NA_character_)
        }

        if (str_detect(variant, "Hispanic")) {
          expect_setequal(test_data$raceeth, "HspLt")
        } else if(str_detect(variant, "ByRace")) {
          expect_setequal(test_data$raceeth, c("NatAm", "AsnPI", "AABlk", "White"))
        } else {
          expect_setequal(test_data$raceeth, NA_character_)
        }

      }
    }
  }

})
