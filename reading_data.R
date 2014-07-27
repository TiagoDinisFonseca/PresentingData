# This will take some time, please be patient.

## You can change the path if you want
path <- "~/exdata_data_NEI_data-1/"

## Checking if the variables already exist
if (exists("NEI") && exists("SCC")) {
 message("You found NEI and SCC variables, no need to reload them.") 
} else {

## Checking if the files are all into the right place
	if (file.exists(paste0(path, "summarySCC_PM25.rds")) &&
		file.exists(paste0(path, "Source_Classification_Code.rds"))){
		NEI <- readRDS(paste0(path, "summarySCC_PM25.rds"))
		SCC <- readRDS(paste0(path, "Source_Classification_Code.rds"))
		message("You have loaded all the data into the variables NEI and SCC.")
	} else {
		message("Files not founded!")
	}
}
