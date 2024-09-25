# ebv-workshop2024
Hands-on training on the EBVCube format for B-Cubed and Natura Connect partners

## Workshop structure
- 14.10. at 11 o'clock
- come 30min earlier for installation problems
- 1 h, 20min modules x 2 + 20 min questions
- interactive R-markdown?
- The first module will be taught on 07.14 after Henrique's talk
- Miguel will be de moderator of the second session.
1. exploring and visualization of a dataset -> Lina slides pptx (Lina presents the EBV Portal and metadata)
	- Poll investigating technical needs and skill for the second session
 	- EBV Data Portal -> show different hierarchies, show map, download (id 7? id 24? has time series) (DOI, metadata)
 	- show metadata upload process in the portal
 	- show in Panoply? (By any of us)
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
	- QGIS Plugin -> viusalize (access to GIS tools) (By Emmanuel)
	
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
