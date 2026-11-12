# Get medallists: Extract medallists by weapon and sex

Filters the fencing dataset to retain only the athletes who reached the
podium (Gold, Silver, and Bronze medals), selecting key identification
and performance variables.

## Usage

``` r
get_medallists(dataset)
```

## Arguments

- dataset:

  A data.frame or tibble containing fencing competition data, which must
  include the columns `round_reached`, `fencer`, `country`, `sex`, and
  `weapon`.

## Value

A tibble containing the filtered and selected data of the medallists.

## Examples

``` r
if (FALSE) { # \dontrun{
medallists <- get_medallists(fencing_data)
} # }
```
