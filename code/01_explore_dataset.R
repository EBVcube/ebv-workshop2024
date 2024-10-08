# Notebook to create EBVCubes from tif files

# Load the ebvcube library
library(ebvcube)

# Path to EBV metadata as JSON 
json <- "./metadata/json/test.json" 
# json_data <- fromJSON(file=json)

# Path to Tiffs
pathin <- "./data/input/tif/"

# Path to output
pathout <- "./data/output/datacubes/nc/ebvcube_test.nc"

# Define entities names
entities <- c('forest bird species','non-forest bird species','all bird species')

# Defining the fillvalue - optional
fv <- -3.4e+38
extent <- c(-19, 55, -36, 40)

# Create the netCDF structure (no data yet)
ebv_create(jsonpath = json,
        outputpath = pathout,
        entities = entities,
        epsg = 4326, 
        extent = extent, 
        resolution = c(1, 1),
        fillvalue = fv,
        overwrite = TRUE,
        verbose = FALSE)

