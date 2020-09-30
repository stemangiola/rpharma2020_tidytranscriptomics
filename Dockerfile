FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "install.packages('remotes')"

RUN Rscript -e "BiocManager::install(c('stemangiola/tidybulk@v1.1.8', 'stemangiola/tidygate@v0.2.8', 'stemangiola/tidyseurat@v0.1.8', 'stemangiola/tidyHeatmap@v1.1.5'))"

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE, repos = BiocManager::repositories())"

