\name{madsim}
\alias{madsim}

\title{Main function of the package "madsim"}

\description{function madsim() allows to generate two conditions biological 
             synthetic microarray dataset whith known characterics. These data
             have similar behavior as those obtained with current microaray 
             platforms. Hence, they can be used for evaluation of data 
             meta-analysis methods.}

\usage{madsim(mdata = NULL, n = 10000, ratio = 0,
              fparams = data.frame(m1 = 7, m2 = 7, shape2 = 4, 
                      lb = 4, ub = 14, pde = 0.02, sym = 0.5),
              dparams = data.frame(lambda1 = 0.13, lambda2 = 2, 
                      muminde = 1, sdde = 0.5),
              sdn = 0.4, rseed = 50)}

\arguments{
  \item{mdata}{a data frame with numerical values to be used as seed,
                 its length should be greater than 100. When set to
                 NULL (default) data generated are fully synthetic
                 \code{mdata=NULL}}
  \item{n}{an integer specifying the number of genes in the data generated
                 \code{n = 10000}}
  \item{ratio}{a flag (0,1) allowing to have log2 intensitie or log2 ratio
                 \code{ratio = 0}}
  \item{fparams}{a data frame containing 7 components defining the data
                   lower (lb) and upper bound (ub), the beta distribution
                   shape (shape2) parameter, the percentage of diffentially
                   expressed (pde) number of genes and the partition of the
                   number of down and up regulated (sym) genes.
                   \code{fparams = data.frame(m1 = 7, m2 = 7,
                                          shape2 = 2,
                                              lb = 4, ub = 14,
                                             pde = 0.02, sym = 0.5)}}
  \item{dparams}{a data frame containing 4 components defining how low and
                   high expressed genes are distributed (lambda1), and
                   how changes are for DE genes (lambda2, muminde, sdde)
                   \code{dparams = data.frame(lambda1 = 0.13,
                                              lambda2 = 2,
                                              muminde = 1,
                                                 sdde = 0.5)}}
  \item{sdn}{a positive scalar used as standard deviation for the
               additive gaussian noise
               \code{sdn=0.4}}
  \item{rseed}{an integer used as seed for generating random number
                  by the computer in use
                  \code{rseed=50}}
}

\details{User provides a subset of parameters. A detailed description of
              these parameters is available in the reference given below.
              Default parameters settings (in arguments above) can be 
              modified.}

\value{Returned is a data frame containing 3 components
  \item{xdata}{a dataset with a number of rows and columns given
                 by input parameters n and m1+m2, respectively}
  \item{xid}{a vector indexes with values from the set (0, -1, 1).
               These values are used for non DE, down and up
               regulated genes}
  \item{xsd}{a scalar containing the standard deviation of first
               column of dataset generated}
}

\references{Dembele D. (2013), A Flexible Microarray Data Simulation Model.
     Submitted to Microarray}

\author{Doulaye Dembele}

\examples{
# set parameters settings
fparams = data.frame(m1 = 7, m2 = 7, shape2 = 4, lb = 4, ub = 14, pde = 0.02, sym = 0.5);
dparams = data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
sdn = 0.4; rseed = 50;

# generate fully synthetic data
mydata = madsim(mdata=NULL,n=10000,ratio=0,fparams,dparams,sdn,rseed);

% calculate MMplot variables using samples 1 and 12
A = 0.5*(mydata$xdata[,12]+mydata$xdata[,1]);
M = mydata$xdata[,12]-mydata$xdata[,1];

# draw MA plot using samples 1 and 12
plot(A,M)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ microarray }
%\keyword{ synthetic }
%\keyword{ simulation }
%\keyword{ model }
