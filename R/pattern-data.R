#' Design Pattern for an R Data Package
#'
#' Setups an R Package for Data Use
#' @inheritParams pattern_pkg_init
#' @export
pattern_data = function(
  path,
  title = "What the Package Does (One Line, Title Case)",
  description = "What the package does (one paragraph)",
  license = "What license it uses"
  ) {

  proj = pattern_pkg_init(path, title, description)

  name_of_dataset = data.frame(x = 1:2, y = 3:4)

  usethis::use_data_raw()
  usethis::use_data(name_of_dataset)
  usethis::use_directory("R")
  usethis::use_template(
    "roxygen2-dataset-documentation.R",
    save_as = "data-documentation.R",
    ignore = FALSE,
    open = FALSE,
    package = "pkgdesign"
  )
  usethis::ui_todo("Add data set documentation into usethis::ui_value(data-documentation.R)")


  pattern_pkg_end()
}
