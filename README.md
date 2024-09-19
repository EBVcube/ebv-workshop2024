# ebv-workshop2024
Hands-on training on the EBVCube format for B-Cubed and Natura Connect partners

## Workshop structure
- 16.10. erliest 10 o'clock
- come 30min earlier for installation problems
- 1.5 h, 20min modules x3 + 30 min questions
- interactive R-markdown?
1. exploring and visualization of a dataset -> Emma slides pptx
	- EBV Data Portal -> show different hierarchies, show map, download (id 7?) (DOI, metadata)
	- QGIS Plugin -> viusalize (access to GIS tools)
	- show in metadata upload
2. two datasets: one dataset from lina, one dataset from Henrique (BES-SIM) -> give them a describing text, make them map -> individual exercise (5min) -> Luise slides pptx + R-code
	- someone wants to share? else we show (one by one)
		* hierarchy? -> graph
		* dimensions?
		* how many cubes?
	- go to RStudio
		1. download one of the two datasets ebv_download
		2. how is the hierarchy shown in ebv_datacubepaths?
		3. what is the units of metric 1? what is ...? use ebv_properties
		4. ebv_map
3. Create an EBVCube netCDF ebv_create and ebv_add_data -> Lina slides pptx + R-code
	- creation of species occurence cubes -> link to repository
	- give them a json and some Tiffs -> creation
	- show in Panoply?
	
xx. what tools are there - one slide per tool
	* EBV Data Portal
	* Panoply - very flexible, everything
	* QGIS Plugin
	* Galaxy
	* ebvcube
- google slides -> lina shares
- Installation Bioconductor, dev-version ebvcube -> Luise send to Emma
- install renv, create an renvironment+share it -> Emma (slide?/code)
- Clone QGIS Plugin -> Emma slide
- create GitHub repo + slide for cloning it -> Lina slide
