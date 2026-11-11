#' Get medallists: Extract medallists by weapon and sex
#'
#' Filters the fencing dataset to retain only the athletes who reached the
#' podium (Gold, Silver, and Bronze medals), selecting key identification
#' and performance variables.
#'
#' @param dataset A data.frame or tibble containing fencing competition data,
#'   which must include the columns \code{round_reached}, \code{fencer},
#'   \code{country}, \code{sex}, and \code{weapon}.
#'
#' @return A tibble containing the filtered and selected data of the medallists.
#' @export
#'
#' @examples
#' \dontrun{
#' medallists <- get_medallists(fencing_data)
#' }

get_medallists <- function(dataset) {
  medallists<- dataset |>
    dplyr::filter(round_reached %in% c("Gold", "Silver", "Bronze")) |>
    dplyr::group_by(weapon, sex) |>
    dplyr::select(fencer, country, sex, weapon, round_reached)

  return(medallists)
}


