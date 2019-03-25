#' Package Initialization and Finalization Routines
#'
#' Common package initialization features.
#'
#' @param path         Where should the package be located and named?
#' @param title        What the package does?
#' @param description  What does the package do?
#' @param license      What is the package licensed under?
#' @keywords internal
pattern_pkg_init = function(path,
                            title = "What the Package Does (One Line, Title Case)",
                            description = "What the package does (one paragraph)",
                            license = "What license it uses") {

  # Create the skeleton
  init_proj = usethis::create_package(
    path,
    open = FALSE,   # Avoid immediately opening
    rstudio = TRUE, # Always create an RStudio project.
    fields = list(`Title` = title,
                  `Description` = description,
                  `License` = license)
  )

  # Change working directory
  usethis::proj_set(init_proj)

  # Begin filling the skeleton with common items
  usethis::use_package_doc()
  usethis::use_roxygen_md()
  usethis::use_readme_rmd(open = FALSE)

  # And we're done.
  invisible(init_proj)
}

pattern_pkg_end = function() {

  # usethis::use_git() # Disable asking for a commit?
  # usethis::use_news_md(open = FALSE) # Requires git

  usethis::ui_done("Package has been setup!")
}
