# install_packages.R

# Welcome! This script installs all the required packages for this session.

# Install latest development version of ebvcube from GitHub (recommended)
install.packages("devtools")
devtools::install_github("https://github.com/LuiseQuoss/ebvcube/tree/dev")

# In case you get an error for libraries: rhdf5, HDF5Array, or DelayedArray
# Install Bioconductor packages (required for ebvcube)
# Uncomment the following lines and run them if needed:
# if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
# BiocManager::install(c("rhdf5", "HDF5Array", "DelayedArray"))

# Install additional CRAN packages
install.packages(c("readr", "terra", "ggplot2", "tidyverse", "stringr"))

# Installation complete message
message("All required packages have been installed successfully.")

# Test if the libraries are loaded correctly
library(ebvcube)
library(readr)
library(terra)
library(ggplot2)
library(tidyverse)
library(stringr)


