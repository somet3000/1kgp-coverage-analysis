ARG BASE_CONTAINER=ucsdets/datahub-base-notebook:2022.3-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# install plink and matrix eqtl packages for quick analysis
USER root
RUN conda install --quiet --yes -c bioconda plink
RUN conda install --quiet --yes -c conda-forge r-matrixeqtl

# install susieR - an R package used for statistical fine-mapping from eQTL analyses
RUN conda install --quiet --yes -c conda-forge r-susier

# prevent running Jupyter notebook when
CMD ["/bin/bash"]