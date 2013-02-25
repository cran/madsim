\name{madsim_test}
\alias{madsim_test}
\docType{data}
\title{a microarray data sample, one colomn numerical values}
\description{a text file containing an example of real microarray
               which can be used as seed. These data are from
               a Affymetrix GeneChip array (Human Gene 1.0 ST)}
\usage{data(madsim_test)}
\format{
  A data frame with 33297 observations on the following variable.
  \describe{
    \item{\code{V1}}{a numeric vector}
  }
}

\examples{
# load a sample of real microarray data
data(madsim_test)

# set parameter settings
mdata=madsim_test$V1;
fparams = data.frame(m1 = 7, m2 = 7, shape2 = 4, lb = 4, ub = 14, pde = 0.02, sym = 0.5);
dparams = data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
sdn = 0.4; rseed = 50;

# generate data using microarray as seed
mydata = madsim(mdata,n=10000,ratio=0,fparams,dparams,sdn,rseed);

# calculate MMplot variables using samples 1 and 12
A = 0.5*(mydata$xdata[,12]+mydata$xdata[,1]);
M = mydata$xdata[,12]-mydata$xdata[,1];

# draw MAplot representation using samples 1 and 12
plot(A,M)

}
\keyword{datasets}
