#' Plot Medallists by Country and Weapon
#'
#' Generates a bar plot showing the distribution of medallists (Gold,
#' Silver, and Bronze) across countries, categorized by weapon type.
#'
#' @param dataset A data.frame or tibble containing fencing competition data.
#'
#' @return A \code{ggplot} object representing the medallists breakdown.
#' @export
#'
#' @examples
#' \dontrun{
#' plot_medallists_by_country(fencing_data)
#' }

plot_medallists_by_country <- function(dataset) {
  medals_data <- get_medallists(dataset)

  p <- ggplot2::ggplot(medals_data, ggplot2::aes(x = country, fill = weapon)) +
    ggplot2::geom_bar(
      position = ggplot2::position_dodge(width = 0.8),
      width = 0.7
    ) +
    ggplot2::scale_y_continuous(breaks = function(x) seq(0, max(x, na.rm = TRUE), by = 1)) +
    ggplot2::scale_x_discrete(expand = ggplot2::expansion(add = 0.8)) +
    ggplot2::scale_fill_discrete(labels = function(x) tools::toTitleCase(x)) +
    ggplot2::labs(
      title = "Medallists Distribution by Country and Weapon",
      x = "Country",
      y = "Number of Medallists",
      fill = "Weapon"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, vjust = 1),
      panel.grid.minor = ggplot2::element_blank()
    )

  return(p)
}
