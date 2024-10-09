# load the ebvcube package
library(ebvcube)
library(stringr)

#Documentation----
# Remember to check the help-pages of the function using ?
?ebv_download

# 1. Download ----
# Check all available datasets
downloads <- ebv_download()
head(downloads)

# Download the 'Global trends in biodiversity (BES-SIM PREDICTS)' dataset
path <- ebv_download(id = '10.25829/bk5g87', #alternative value: downloads$id[18]
                     outputdir = '../data/') 

# 2. Explore available datacubes ----
# Get info about cubes including the hierarchy
cubes <- ebv_datacubepaths(filepath = path)
# This dataset has three scenarios, with four metrics
print(cubes)

# 3. Explore the metadata ----
prop <- ebv_properties(filepath = path)

# Include specific info for one metric and scenario, e.g. of the relative species change of scenario 1
prop_s <- ebv_properties(filepath = path,
                         metric = 2,
                         scenario = 1)

# How is the relative species change calculated (metric 2)?
prop_s@metric

# What timesteps (dates) does the dataset cover?
prop@temporal$dates

# What are the dimensions of the datacubes?
prop@spatial$dimensions

# What is the entity of the cube?
prop@general$entity_names

# 4. Read data ----
# Read the data of the species richness for all dates for the Regional Rivalry scenario
# The function returns a terra SpatRast by default. Change the type argument to change.
data <- ebv_read(filepath = path,
                 metric = 'Species richness, S', #alternative value: 1
                 scenario = 'SSP3xRCP6.0 LU', #alternative value: 2
                 timestep = 1:3,
                 entity = 'Alltaxa', #alternative value: 1
                 type = 'r' #change this value to 'a' to get an array
                 ) 

# Quickly check the data visually using the terra plot function
terra::plot(data[[2]])

# Clean up ----
file.remove(path)
file.remove(paste0(str_remove(path, '.nc'), '_metadata.json'))
