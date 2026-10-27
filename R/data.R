#' World Fencing Championships Hong Kong 2026- Dataset
#'
#' A dataset containing pool phase and direct elimination round results for
#' a sample of athletes that competed at the 2026 World Fencing Championships.
#'
#' @format A data frame with multiple rows and 10 variables:
#' \describe{
#'   \item{fencer}{Full name of the athlete}
#'   \item{country}{Country represented by the athlete (3-letter ISO/FIE code)}
#'   \item{sex}{Gender category (Male / Female)}
#'   \item{weapon}{Weapon discipline (sabre, foil, epee)}
#'   \item{passed_pool}{Indicates whether the fencer qualified for the direct elimination round (yes / no)}
#'   \item{touches_given}{Touches scored by the fencer during the pool phase}
#'   \item{touches_received}{Touches received by the fencer during the pool phase}
#'   \item{pool_index}{Net touch indicator in the pool phase (touches_given - touches_received)}
#'   \item{pool_win_rate}{Victory ratio in pool bouts}
#'   \item{round_reached}{Highest competition stage reached in the tournament}
#' }
#' @source International Fencing Federation (FIE)
#' #' @section Warning:
#' This dataset contains synthetic data generated via Artificial Intelligence .
#' It is intended solely for data analysis practice, package development testing,
#' and demonstration purposes, not for official sports statistics.


"fencing_wc2026"



