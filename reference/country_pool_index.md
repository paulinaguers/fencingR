# Calculate Average Pool Win Rate by Country

Computes the average win rate in the pool stage for each country,
filtering out delegations with fewer competitors than the specified
minimum threshold to ensure robust statistical representation.

## Usage

``` r
country_pool_index(dataset, min_fencers = 12)
```

## Arguments

- dataset:

  A data.frame or tibble containing fencing competition data with the
  required columns: `country` and `pool_win_rate`.

- min_fencers:

  Numeric. The minimum number of entries required for a country to be
  included in the ranking. Default is `12`, ensuring multi-entry
  representation across weapon types and sexes.

## Value

A tibble containing the country code and its corresponding average pool
win rate, arranged in descending order.

## Details

This function aggregates individual fencer pool performance
(`pool_win_rate`) at the national federation level.

**Analytical Rationale & Sample Size Criterion:** Evaluating pool
performance by country highlights structural dominance and the depth of
talent across national teams. By enforcing a minimum threshold
(`min_fencers`, defaulting to 12), the function guarantees that a
national federation has sufficient representation across categories
(e.g., accounting for multiple entries across sexes and weapon types),
preventing statistical distortion caused by delegations with very few
competitors or isolated individual entries.

## Examples

``` r
if (FALSE) { # \dontrun{
country_pool_index(fencing_data, min_fencers = 12)
} # }
```
