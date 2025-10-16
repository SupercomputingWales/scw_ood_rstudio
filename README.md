# Batch Connect - OSC RStudio Server

![GitHub Release](https://img.shields.io/github/release/osc/bc_osc_rstudio_server.svg)
[![GitHub License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

An interactive app designed for ARCCA OnDemand that launches an RStudio Server
within a Falcon SLURM job.

## Prerequisites

This Batch Connect app requires has been tested with following softwareinstalled on
the **compute nodes** that the batch job is intended to run on (**NOT** the
OnDemand node):

- [Lmod] 8.7.59 2025-03-06 or some other `module restore` and `module load <modules>` based
  CLI used to load appropriate environments within the batch job before
  launching the RStudio Server.
- [Apptainer] 1.4.2-1.el9+
- A Docker image similar to [rocker/tidyverse]

## Install

Use git to clone this app and checkout the desired branch/version you want to
use:

```sh
git clone <repo>
cd <dir>
git checkout <tag/branch>
```

When updating RStudio version, modify the following files:

 - `rstudio-<version>.def`, also edit if additional packages are needed (update file name accordingly).
 - `form.yml`, add new version under `rs_version` field.
 - Create a new modulefile in `modulefile/ood-rstudio-server/` and copy it (as root) to `/trinity/shared/modulefiles/`. 

Build the image (this works on Falcon as a user in the admin group).
```sh
apptainer build rstudio-<version>.sif rstudio-<version>.def
```

Create a new directory (as root) in `/shared/apps/containers/apptainer/languages/rstudio-server/<version>` and copy the
new image and the `bin/` directory (which contains a set of wrappers for R, RScript and RStudio Server).

Test your changes following [OnDemand App Development] procedures.

## License

* Documentation, website content, and logo is licensed under
  [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/)
* Code is licensed under MIT (see LICENSE.txt)o
* RStudio, Shiny and the RStudio logo are all registered trademarks of RStudio.

[R]: https://www.r-project.org/
[RStudio Server]: https://posit.co/download/rstudio-server/
[PRoot]: https://proot-me.github.io/
[Apptainer]: https://apptainer.org/documentation/
[Lmod]: https://lmod.readthedocs.io/en/latest/
[rocker/tidyverse]: https://hub.docker.com/r/rocker/tidyverse/
[OnDemand App Development]: https://osc.github.io/ood-documentation/latest/how-tos/app-development.html
