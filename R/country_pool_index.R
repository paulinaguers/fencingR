#' Calculate Average Pool Win Rate by Country
#'
#' @description
#' Computes the average win rate in the pool stage for each country, filtering
#' out delegations with insufficient sample sizes to ensure robust statistical comparison.
#'
#' @details
#' This function aggregates individual fencer pool performance (\code{pool_win_rate})
#' at the national federation level.
#'
#' \strong{Analytical Rationale:}
#' Evaluating pool performance by country highlights structural dominance and the depth
#' of talent across national teams from the very first phase of the tournament.
#' By enforcing a minimum sample size filter (\code{n() > 5}), the function mitigates
#' distortion caused by delegations with very few competitors.
#'
#' @param dataset A data.frame or tibble containing fencing competition data with
#'   the required columns: \code{country} and \code{pool_win_rate}.
#'
#' @return A tibble containing the country code and its corresponding average pool win rate,
#'   arranged in descending order.
#' @export
#'
#' @examples
#' \dontrun{
#' country_pool_index(fencing_data)
#' }
#'
country_pool_index <- function(dataset) {
  pool_win_rate_by_country <- dataset |>
    dplyr::group_by(country) |>
    dplyr::filter(dplyr::n() > 5) |>
    dplyr::summarise(
      average_pool_win_rate = mean(pool_win_rate, na.rm = TRUE),
      .groups = "drop"
    ) |>
    dplyr::arrange(dplyr::desc(average_pool_win_rate))

  return(pool_win_rate_by_country)
}
