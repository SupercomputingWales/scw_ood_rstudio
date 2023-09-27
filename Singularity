Bootstrap:docker  
From:rocker/tidyverse:4.2.3

%labels
MAINTAINER Thomas Green

%environment

%runscript
exec /bin/bash /bin/echo "Not supported"

%post
apt-get update -qq
apt-get -y --no-install-recommends install \
    openssh-client

# Delete the configuration file specifying advistory locks has issues on NFS.
# (not default)
rm /etc/rstudio/file-locks

# For R package monocle3
apt-get install -y libudunits2-dev libgdal-dev libgeos-dev libproj-dev
apt-get install -y libglpk-dev
# For ggrastr
apt-get install -y libxt-dev
