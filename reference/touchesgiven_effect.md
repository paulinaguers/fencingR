# Plot Touches Given Effect by Round Reached, Weapon, and Sex

Generates a horizontal point-and-line plot displaying the average
touches given during the pool stage grouped chronologically by the final
round reached in the tournament, faceted by weapon type and categorized
by sex.

## Usage

``` r
touchesgiven_effect(dataset)
```

## Arguments

- dataset:

  A data.frame or tibble containing fencing competition data with the
  required columns: `fencer`, `country`, `sex`, `weapon`,
  `round_reached`, and `touches_given`.

## Value

A `ggplot` object representing the average touches trend across
tournament rounds.

## Details

This function investigates the relationship between pool stage offensive
performance (`touches_given`) and final tournament progression
(`round_reached`).

**Analytical Rationale:** In competitive fencing, pool stage performance
directly dictates the initial seeding (ranking) for direct elimination
brackets. Fencers who dominate their pools with a higher volume of
touches given secure more favorable seeds, bypassing early encounters
with top competitors and displaying a consistent performance gradient
from early pool elimination up to podium finishes (*Bronze*, *Silver*,
*Gold*).

The visualization uses a horizontal orientation (`y = round_reached`,
`x = mean_touches`) with a minor vertical dodge adjustment
(`orientation = "y"`) to prevent overlapping points and lines between
sexes without distorting the exact horizontal touch values.

## Examples

``` r
if (FALSE) { # \dontrun{
touchesgiven_effect(fencing_wc2026)
} # }
```
