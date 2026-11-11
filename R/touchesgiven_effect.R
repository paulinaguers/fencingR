#' Plot Touches Given Effect by Round Reached, Weapon, and Sex
#'
#' @description
#' Generates a horizontal point-and-line plot displaying the average
#' touches given during the pool stage grouped chronologically by the final round
#' reached in the tournament, faceted by weapon type and categorized by sex.
#'
#' @details
#' This function investigates the relationship between pool stage offensive performance
#' (\code{touches_given}) and final tournament progression (\code{round_reached}).
#'
#' \strong{Analytical Rationale:}
#' In competitive fencing, pool stage performance directly dictates the initial seeding
#' (ranking) for direct elimination brackets. Fencers who dominate their pools with a higher
#' volume of touches given secure more favorable seeds, bypassing early encounters with top
#' competitors and displaying a consistent performance gradient from early pool elimination
#' up to podium finishes (\emph{Bronze}, \emph{Silver}, \emph{Gold}).
#'
#' The visualization uses a horizontal orientation (\code{y = round_reached}, \code{x = mean_touches})
#' with a minor dodge adjustment to prevent overlapping lines between sexes.
#'
#' @param dataset A data.frame or tibble containing fencing competition data with
#'   the required columns: \code{fencer}, \code{country}, \code{sex}, \code{weapon},
#'   \code{round_reached}, and \code{touches_given}.
#'
#' @return A \code{ggplot} object representing the average touches trend across tournament rounds.
#' @export
#'
#' @examples
#' \dontrun{
#' touchesgiven_effect(fencing_data)
#' }
touchesgiven_effect <- function(dataset) {
  # Chronological competition order
  round_levels <- c(
    "Pools", "Table of 64", "Table of 32",
    "Table of 16", "Table of 8", "Bronze", "Silver", "Gold"
  )

  # Clean and group data
  summary_data <- dataset |>
    dplyr::filter(!is.na(round_reached), sex %in% c("Female", "Male")) |>
    dplyr::mutate(
      round_reached = factor(round_reached, levels = round_levels),
      sex = tools::toTitleCase(as.character(sex)),
      weapon = tools::toTitleCase(as.character(weapon))
    ) |>
    dplyr::filter(!is.na(round_reached)) |>
    dplyr::group_by(round_reached, weapon, sex) |>
    dplyr::summarise(
      mean_touches = mean(touches_given, na.rm = TRUE),
      .groups = "drop"
    )

  # Avoid overlapping:
  pd <- ggplot2::position_dodge(width = 0.25)

  p <- ggplot2::ggplot(
    summary_data,
    ggplot2::aes(x = mean_touches, y = round_reached, color = sex, group = sex)
  ) +
    ggplot2::geom_line(linewidth = 1, alpha = 0.8, position = pd) +
    ggplot2::geom_point(size = 2.5, position = pd) +
    ggplot2::facet_wrap(~ weapon, ncol = 3) +
    ggplot2::labs(
      title = "Average Pool Touches by Final Round Reached",
      subtitle = "Progression from pool stage to tournament podium",
      x = "Average Touches Given in Pool",
      y = "Round Reached",
      color = "Sex"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      panel.grid.minor = ggplot2::element_blank(),
      strip.text = ggplot2::element_text(face = "bold", size = 11),
      legend.position = "bottom",
      axis.text.y = ggplot2::element_text(size = 9)
    )

  return(p)
}
