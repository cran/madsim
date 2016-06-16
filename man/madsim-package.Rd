\name{madsim-package}
\alias{madsim-package}
\docType{package}

\title{A Flexible Microarray Data Simulation Model}

\description{madsim allows to generate two conditions biological synthetic
                    microarray dataset whith known characteristics. These data
                    have similar behavior as those obtained with current
                    microarray platforms.}
\details{
\tabular{ll}{
             Package: \tab madsim\cr
             Type: \tab Package\cr
             Version: \tab 1.2\cr
             Date: \tab 2016-06-16\cr
             License: \tab GPL (>=2.0)\cr
             }

             This package has only one function
}

\author{Doulaye Dembele
    Maintainer: Doulaye Dembele <doulaye@igbmc.fr>}

\references{Dembele D. (2013), A Flexible Microarray Data Simulation Model, 
                    Microarrays, 2013, 2(2):115-130}

\keyword{ package }

\examples{
# set parameters settings
fparams = data.frame(m1 = 7, m2 = 7, shape2 = 4, lb = 4, ub = 14, pde = 0.02, sym = 0.5);
dparams = data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
sdn = 0.4; rseed = 50;

# generate synthetic data without using real microarray data as seed
mydata = madsim(mdata=NULL, n=10000, ratio=0, fparams, dparams, sdn, rseed);

# calculate MMplot variables using samples 1 and 12
A = 0.5*(mydata$xdata[,12]+mydata$xdata[,1]);
M = mydata$xdata[,12]-mydata$xdata[,1];

# draw MA plot using samples 1 and 12
plot(A,M)
}
