# Script to create EBVCubes from tif files
# EBVCube Workshop 2024 - EBVCube: Enhancing Biodiversity Data Sharing
# with Interoperable Geospatial Standards
# Session 2: Hands-on training  on the `ebvcube` R package
# Author: Lina M. Estupinan-Suarez
# Institution: German Centre for Integrative Biodiversity Research

# Load libraries
library(ebvcube)
library(terra)

# Path to EBV metadata as JSON 
json <- "./metadata/json/test.json" 
# json_data <- fromJSON(file=json) # in case you want to read the jsonfile

# Path to Tiffs
pathin <- "./data/input/tif/"

# Path to the EBVCube output
nc <- "./data/output/datacubes/nc/ebvcube_test.nc"

# Plot data
tifs <- c('entity_1.tif', 'entity_2.tif', 'entity_3.tif')
tif_paths <- file.path("./data/input/tif", tifs)
rin <- rast(tif_paths[1])
plot(rin)

# Defining the fillvalue - optional
fv <- -3.4e+38

# Define geographical extent and coordinate system
extent <- c(-19, 55, -36, 40)
epsg <- 4326

# Create the netCDF structure (no data yet)
ebv_create(jsonpath = json,
        outputpath = nc,
        entities = entities,
        epsg = epsg, 
        extent = extent, 
        resolution = c(1, 1),
        fillvalue = fv,
        overwrite = TRUE,
        verbose = FALSE)


# Check paths to data cubes
ebv_datacubepaths(nc)

# Check metadata
ebv_properties(nc, metric=3)

# Add data
# Get entity names
entity_names <- ebv_properties(nc, verbose=F)@general$entity_names

# Check out the (still empty) datacubes that are available
dc.new <- ebv_datacubepaths(nc, verbose=FALSE)
print(dc.new)

# Add the data
entity <- 1
for (tif in tif_paths){
  ebv_add_data(filepath_nc = nc, 
               datacubepath = dc.new[entity,1],
               entity = entity,
               timestep = 1:3,
               data = tif,
               band = 1:3)
               entity <- entity + 1
}
