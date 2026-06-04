help([[
This module activates a global singularity container with RStudio.
The image is based on rocker/tidyverse described in
https://rocker-project.org/images/versioned/rstudio.html and 
has already installed many R packages and their dependencies apt
packages. e.g.
 - the tidyverse package
 - the devtools package
 - the rmarkdown package
 - some R Database Interface packages
 - the data.table package
 - the fst package
 - the Apache Arrow R package

Additional apt dependecies installed by ARCCA allow the
user installation of the following R packages:
 - monocle3
 - ggrastr
 - DirichletMultinomial
 - htslib
 - ImageMagick
]])

-- Module Metadata
whatis("Name: Global Singularity Container with RStudio")
whatis("Version: 2026.04.0.526")
whatis("Category: languages")
whatis("Description: Activates a global singularity container with RStudio.")
whatis("URL: https://posit.co/download/rstudio-desktop/")

-- Resolve the user's home directory and set the app path
local user_home = os.getenv("HOME")
if not user_home then
    LmodError("Unable to determine the user's home directory. Ensure $HOME is set.")
end

local app         = "rstudio-server"
local appcategory = "languages"
local version     = "2026.04.0.526"
local base        = "/shared/apps/containers/apptainer"
local app_path    = pathJoin(base, appcategory, app, version, "bin")
--local base        = "/shared/home1/c.c1045890/ondemand/dev/scw_ood_rstudio"
--local app_path    = pathJoin(base, "bin")

-- Function to check if a file exists
local function file_exists(file)
    local f = io.open(file, "r")
    if f then
        f:close()
        return true
    else
        return false
    end
end


-- Message on load and unload
if (mode() == "load") then
    if not file_exists(app_path) then
        LmodMessage("The specified path does not exist.")
	os.exit(1)
    end
end

if (mode() == "unload") then
end

-- application specific settings
--setenv("RSTUDIO_IMAGE", pathJoin(base,"rstudio-2026.04.0.526-R-4.6.0.sif"))
setenv("RSTUDIO_IMAGE", pathJoin(base, appcategory, app, version,"rstudio-20256.04.0.526-R-4.6.0.sif"))
prepend_path("PATH",app_path)
