#' Calculate Average Pool Win Rate by Country
#'
#' @description
#' Computes the average win rate in the pool stage for each country, filtering
#' out delegations with fewer competitors than the specified minimum threshold
#' to ensure robust statistical representation.
#'
#' @details
#' This function aggregates individual fencer pool performance (\code{pool_win_rate})
#' at the national federation level.
#'
#' \strong{Analytical Rationale & Sample Size Criterion:}
#' Evaluating pool performance by country highlights structural dominance and the depth
#' of talent across national teams. By enforcing a minimum threshold (\code{min_fencers},
#' defaulting to 12), the function guarantees that a national federation has sufficient
#' representation across categories (e.g., accounting for multiple entries across sexes
#' and weapon types), preventing statistical distortion caused by delegations with
#' very few competitors or isolated individual entries.
#'
#' @param dataset A data.frame or tibble containing fencing competition data with
#'   the required columns: \code{country} and \code{pool_win_rate}.
#' @param min_fencers Numeric. The minimum number of entries required for a country
#'   to be included in the ranking. Default is \code{12}, ensuring multi-entry representation
#'   across weapon types and sexes.
#'
#' @return A tibble containing the country code and its corresponding average pool win rate,
#'   arranged in descending order.
#' @export
#'
#' @examples
#' \dontrun{
#' country_pool_index(fencing_data, min_fencers = 12)
#' }
country_pool_index <- function(dataset, min_fencers = 12) {
  pool_win_rate_by_country <- dataset |>
    dplyr::group_by(country) |>
    dplyr::filter(dplyr::n() >= min_fencers) |>
    dplyr::summarise(
      average_pool_win_rate = mean(pool_win_rate, na.rm = TRUE),
      .groups = "drop"
    ) |>
    dplyr::arrange(dplyr::desc(average_pool_win_rate))

  return(pool_win_rate_by_country)
}
