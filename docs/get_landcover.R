# get_landcover.R
#
# Land cover inside a set of polygons, from the 2021 National Land Cover
# Database (NLCD) for the Richmond, Virginia dogwood study area.
#
# To use it, save this file into your project folder and then, in your
# own document:
#
#   source( "get_landcover.R" )
#   get_landcover( my_polygons )
#
# `polygons` is an sf object of POLYGONs (in any CRS) that falls within
# the study area.  The result is a data.frame with one row for each
# polygon in each of seven land cover categories (Water, Developed,
# Barren, Forest, Shrub/Grass, Agriculture, and Wetland).  It carries
# along all the columns of `polygons` (but not the geometry), plus the
# Proportion of each polygon's area in that category.
#
# Requires the sf, terra, dplyr, and tibble libraries to be installed.
# The NLCD data are a raster, which we cover in the Raster-Data topic.

get_landcover <- function( polygons ) {
  nlcd_url <- "https://dyerlabteaching.github.io/CourseData/Spatial/Richmond_NLCD_2021.tif"
  nlcd_file <- file.path( tempdir(), "Richmond_NLCD_2021.tif" )
  if( !file.exists( nlcd_file ) || file.size( nlcd_file ) == 0 ) {
    download.file( nlcd_url, nlcd_file, mode = "wb", quiet = TRUE )
  }
  nlcd <- terra::rast( nlcd_file )

  # Proportion of each polygon's area in each NLCD class
  areas <- terra::extract( nlcd,
                           terra::vect( sf::st_transform( polygons, terra::crs( nlcd ) ) ),
                           exact = TRUE )
  names( areas ) <- c("ID", "Code", "Fraction")

  # Group the 15 NLCD classes into 7 categories
  key <- tibble::tibble( Code = c(11, 21, 22, 23, 24, 31, 41, 42, 43, 52, 71, 81, 82, 90, 95),
                         Category = c("Water",
                                      "Developed", "Developed", "Developed", "Developed",
                                      "Barren",
                                      "Forest", "Forest", "Forest",
                                      "Shrub/Grass", "Shrub/Grass",
                                      "Agriculture", "Agriculture",
                                      "Wetland", "Wetland") )

  areas |>
    dplyr::inner_join( key, by = "Code" ) |>
    dplyr::mutate( Category = factor( Category, levels = unique( key$Category ) ) ) |>
    dplyr::group_by( ID, Category, .drop = FALSE ) |>
    dplyr::summarize( Cells = sum( Fraction ), .groups = "drop_last" ) |>
    dplyr::mutate( Proportion = Cells / sum( Cells ) ) |>
    dplyr::ungroup() |>
    dplyr::mutate( Category = as.character( Category ) ) |>
    dplyr::left_join( sf::st_drop_geometry( polygons ) |> dplyr::mutate( ID = dplyr::row_number() ),
                      by = "ID" ) |>
    dplyr::select( -ID, -Cells ) |>
    dplyr::relocate( Category, Proportion, .after = dplyr::last_col() )
}
