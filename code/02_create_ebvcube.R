# Script to create EBVCubes from tif files
# EBVCube Workshop 2024 - EBVCube: Enhancing Biodiversity Data Sharing
# with Interoperable Geospatial Standards
# Session 2: Hands-on training  on the `ebvcube` R package
# Author: Lina M. Estupinan-Suarez
# Institution: German Centre for Integrative Biodiversity Research


# Activate to clean your envirionment
rm(list=ls())
gc()

# Load packages
library(ebvcube)
library(terra)
library(jsonlite)

# Check if working directory point to this code-folder
getwd()
# If not, run the following line of code
# This only runs if you are using RStudio, else use setwd("your/path/to/ebv-workshop2024-main/code")
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# 1. Define paths ----
# Path to EBV metadata as JSON
json <- "../data/input/json/test.json" #if error: add one dot and try again
json_data <- fromJSON(txt=json) # in case you want to read the jsonfile

# Path to Tiffs
pathin <- "../data/input/tif/" #if error: add one dot and try again

# Path to the EBVCube output
nc <- "../data/output/ebvcube_test.nc" #if error: add one dot and try again

# 2. Plot data ----
tifs <- c('entity_1.tif', 'entity_2.tif', 'entity_3.tif')
tif_paths <- file.path("../data/input/tif", tifs) #if error: add one dot and try again
rin <- rast(tif_paths[1])
plot(rin)

# 3. Create EBVCube netCDF ----
# Defining the fillvalue - optional
fv <- -3.4e+38

# Define geographical extent and coordinate system
extent <- c(-19, 55, -36, 40)
epsg <- 4326

#Define entity-names
entities <- c('entity_1', 'entity_2', 'entity_3')

# Create the netCDF structure (no data yet)
ebv_create(jsonpath = json,
        outputpath = nc,
        entities = entities, #alternative: csv (see help-page)
        epsg = epsg,
        extent = extent,
        resolution = c(1, 1),
        fillvalue = fv,
        overwrite = TRUE,
        verbose = FALSE #set to TRUE to see additional messages
        )

# Check out the (still empty) datacubes that are available
dc_new <- ebv_datacubepaths(nc, verbose=FALSE)
print(dc_new)

# Check metadata
prop <- ebv_properties(nc, metric=3, verbose=FALSE)
print(prop@spatial)

# 4. Add data to the netCDF ----
# Get entity names
entity_names <- prop@general$entity_names
print(entity_names)

# Add the data to metric 1
# Note: to fill all cubes, loop though all metrics (left out here)
entity <- 1
for (tif in tif_paths){ #in this example each metric is one tif
  ebv_add_data(filepath_nc = nc,
               metric = 1,
               entity = entity,
               timestep = 1:3,
               data = tif, #alternative value: give data as an array directly
               band = 1:3 #refers to the bands in the Tiff -> add all 3 timesteps at once
               )
  entity <- entity + 1
}

# 5. Check your recently created EVBCube
# Load the new cube
new_cubepaths <- ebv_datacubepaths(filepath = nc)

mycube <- ebv_read(filepath = nc,
                  datacubepath = new_cubepaths[1,1],
                  entity = 1,
                  timestep = c(1,2),
                  type='r',
                   )
terra::plot(mycube)

# 5. Do by yourselves: ----
# Use the tif files provide in the 'exercise' folder. This is subset of the dataset ID 82.
# Use as a template the metadata file (JSON) in the EBV Data Portal
# Create a new script for this data set. Be aware of the taxonomic dimension.
# For help looked at https://github.com/EBVcube/B-Cubed_data_mobilisation, https://zenodo.org/records/13798783

