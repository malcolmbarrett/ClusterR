% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clustering_functions.R
\name{Optimal_Clusters_GMM}
\alias{Optimal_Clusters_GMM}
\title{Optimal number of Clusters for the gaussian mixture models}
\usage{
Optimal_Clusters_GMM(data, max_clusters, criterion = "AIC",
  dist_mode = "eucl_dist", seed_mode = "random_subset", km_iter = 10,
  em_iter = 5, verbose = FALSE, var_floor = 1e-10,
  plot_data = TRUE, seed = 1)
}
\arguments{
\item{data}{matrix or data frame}

\item{max_clusters}{either a numeric value, a contiguous or non-continguous numeric vector specifying the cluster search space}

\item{criterion}{one of 'AIC' or 'BIC'}

\item{dist_mode}{the distance used during the seeding of initial means and k-means clustering. One of, \emph{eucl_dist}, \emph{maha_dist}.}

\item{seed_mode}{how the initial means are seeded prior to running k-means and/or EM algorithms. One of, \emph{static_subset},\emph{random_subset},\emph{static_spread},\emph{random_spread}.}

\item{km_iter}{the number of iterations of the k-means algorithm}

\item{em_iter}{the number of iterations of the EM algorithm}

\item{verbose}{either TRUE or FALSE; enable or disable printing of progress during the k-means and EM algorithms}

\item{var_floor}{the variance floor (smallest allowed value) for the diagonal covariances}

\item{plot_data}{either TRUE or FALSE indicating whether the results of the function should be plotted}

\item{seed}{integer value for random number generator (RNG)}
}
\value{
a vector with either the AIC or BIC for each iteration. In case of Error it returns the error message and the possible causes.
}
\description{
Optimal number of Clusters for the gaussian mixture models
}
\details{
\strong{AIC}  : the Akaike information criterion

\strong{BIC}  : the Bayesian information criterion

In case that the \emph{max_clusters} parameter is a contiguous or non-contiguous vector then plotting is disabled. Therefore, plotting is enabled only if the \emph{max_clusters} parameter is of length 1.
}
\examples{

data(dietary_survey_IBS)

dat = dietary_survey_IBS[, -ncol(dietary_survey_IBS)]

dat = center_scale(dat)

opt_gmm = Optimal_Clusters_GMM(dat, 10, criterion = "AIC", plot_data = FALSE)


#----------------------------
# non-contiguous search space
#----------------------------
 
search_space = c(2,5)

opt_gmm = Optimal_Clusters_GMM(dat, search_space, criterion = "AIC", plot_data = FALSE)

}
\author{
Lampros Mouselimis
}
