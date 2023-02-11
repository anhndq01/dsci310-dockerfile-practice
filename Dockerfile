FROM rocker/rstudio:4.1.3

ENV RENV_VERSION 0.15.2-2
RUN Rscript -e "install.packages('remotes')"
RUN Rscript -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

COPY --chown=rstudio:rstudio renv.lock renv.lock
COPY  --chown=rstudio:rstudio renv renv
COPY  --chown=rstudio:rstudio .Rprofile .Rprofile

USER rstudio
RUN Rscript -e "renv::restore()"
USER root

