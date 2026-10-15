# Lines, Polygons, and Shapefiles

<!-- BEGIN module:header — generated from module.yml; edit that, not this -->

![A wetland and lake with a dock near Loch Lomond in Scotland.](https://dyerlabteaching.github.io/Shapefiles/media/module_image.jpg)

<!-- END module:header -->

## Impetus

According to the artificial intelligence ChatGPT, a shapefile is defined in a recent Tweet on [#gischat](https://twitter.com/search?q=%23gischat&src=typed_query) as:

![A #gischat tweet quoting ChatGPT: "In conclusion, the shapefile is an awful data format because of its limited capabilities, fragmented data, poor data quality, inefficient data storage, and limited interoperability. These factors make it difficult to work with shapefiles and can result in lost or incomplete data."](https://dyerlabteaching.github.io/Shapefiles/media/shapefile_definition_chatGPT3.png)

That being said, one of the more popular corporate GIS software packages uses and abuses this data format and it is important to know how to work in this mixed environment.

## Module Learning Objectives

### Construct Lines and Polygons

> Learners will create `sf::LINESTRING` and `sf::POLYGON` objects directly from raw data and load map polygons using `map_data()`.  They will then build buffers, unions, convex hulls, and transect corridors around real sampling locations (dogwood trees in Richmond, Virginia) and measure their lengths and areas.

- **Bloom's Levels:** Apply
- **Reinforces:** Builds on the point-data handling from Spatial Points to cover the remaining vector geometry types (lines and polygons).
- **Notes:** Done as a group in Part 1 of the in-class activity, before shapefiles are introduced.

### Import Shapefiles

> Learners will download and unzip ESRI shapefile archives and load them into `R` as `sf` objects, checking and matching their projections.

- **Bloom's Levels:** Understand
- **Reinforces:** Connects to the GIS software many learners already use, showing what its output looks like in `R`.
- **Notes:** Presented as a demonstration.  Explicitly addresses the ESRI shapefile format because of its continued prevalence in corporate/agency GIS workflows, despite its known limitations.

### Apply Spatial Joins

> Learners will use spatial join techniques to combine attribute data with spatial geometries.

- **Bloom's Levels:** Apply
- **Reinforces:** Directly extends the tabular join concepts from Joins into a spatial context, closing the loop opened in that module.
- **Notes:** Reinforces that "join" is a general relational concept, not one limited to non-spatial tables.

### Characterize the Landscape Around Samples

> Learners will measure the land cover (NLCD) inside polygons they have built and summarize and compare it among groups using tables and bar charts.

- **Bloom's Levels:** Apply, Analyze
- **Reinforces:** Uses `dplyr` summaries and `ggplot2` graphics on the output of spatial operations.
- **Notes:** The raster extraction is a black box (`get_landcover()`) until Raster Data.  Done as a group in Part 2 of the in-class activity, then extended to the full data set in the homework.

## Content

<!-- BEGIN module:resources — generated from module.yml; edit that, not this -->

- The [slides](https://dyerlabteaching.github.io/Shapefiles/slides.html) for this topic.
- A longer [narrative](https://dyerlabteaching.github.io/Shapefiles/narrative.html) that goes into more depth.
- An [in-class](https://dyerlabteaching.github.io/Shapefiles/in-class.html) activity.
- A [Cheatsheet](https://github.com/rstudio/cheatsheets/blob/master/sf.pdf) for the `sf` library.

<!-- END module:resources -->

## Assessment

- A [homework](https://dyerlabteaching.github.io/Shapefiles/homework.html) assignment on the topic.

## Logistics

- A [Teaching Log](https://dyerlabteaching.github.io/Shapefiles/log.html) record of delivery and notes.

## Contact Information

If you need to contact me, I am available at:
- Email: [rjdyer@vcu.edu](mailto://rjdyer@vcu.edu)
- Web: [rodneydyer.com](https://rodneydyer.com)
