\name{madsim}
\alias{madsim}

\title{Main function of the package "madsim"}

\description{function madsim() allows to generate two biological conditions
             synthetic microarray dataset with known characteristics. These data
             have similar behavior as those obtained with current microarray
             platforms. Hence, they can be used for performance evaluation of data
             meta-analysis methods.}

\usage{madsim(mdata = NULL, n = 10000, ratio = 0,
              fparams = data.frame(m1=7,m2=7,shape2=4,lb=4,ub=14,pde=0.02,sym=0.5),
              dparams = data.frame(lambda1=0.13, lambda2=2, muminde=1, sdde=0.5),
              sdn = 0.4, rseed = 50)}

\arguments{
  \item{mdata}{ a data frame with numerical values to be used as seed,
                 its length should be greater than 100. When set to
                 NULL (default) data generated are fully synthetic:
                 \code{mdata = NULL}}
  \item{n}{ an integer specifying the number of genes in the data generated:
                 \code{n = 10000}}
  \item{ratio}{ a flag (0,1) allowing to have log2 intensitie or log2 ratio:
                 \code{ratio = 0}}
  \item{fparams}{ a data frame containing 7 components defining the data
                   lower (lb) and upper bound (ub), the beta distribution
                   shape (shape2) parameter, the percentage of differentially
                   expressed (pde) number of genes and the partition of the
                   number of down and up regulated (sym) genes:\cr
      \code{fparams=data.frame(m1=7,m2=7,shape2=2,lb=4,ub=14,pde=0.02,sym=0.5)}}
  \item{dparams}{ a data frame containing 4 components defining how low and
                   high expressed genes are distributed (lambda1), and
                   how changes are for DE genes (lambda2, muminde, sdde):\cr
      \code{dparams = data.frame(lambda1=0.13,lambda2=2,muminde=1,sdde=0.5)}}
  \item{sdn}{ a positive scalar used as standard deviation for the
               additive gaussian noise: \code{sdn = 0.4}}
  \item{rseed}{ an integer used as seed for generating random number
                  by the computer in use: \code{rseed = 50}}
}

\details{User provides a subset of parameters. A detailed description of
              these parameters is available in the reference given below.
              Default parameters settings (in arguments above) can be 
              modified.}

\value{Returned is a data frame containing 3 components
  \item{xdata}{ a dataset with sizes, the number of rows and columns, specified
                 by input parameters n and m1+m2, respectively}
  \item{xid}{ a vector of indexes with values are from the set (0, -1, 1).
               These values are used for non differentially expressed, down-
               and up-regulated genes}
  \item{xsd}{ a scalar containing the standard deviation of first
               column of the dataset generated}
}

\references{Dembele D. (2013), A Flexible Microarray Data Simulation Model.
     Microarrays, 2013, 2(2):115-130}

\author{Doulaye Dembele}

\examples{
    # load a sample of real microarray data
    data(madsim_test)

    # set parameters settings
    mdata = madsim_test$V1;
    fparams = data.frame(m1 = 7, m2 = 7, shape2 = 4, lb = 4, ub = 14,pde=0.02,sym=0.5);
    dparams = data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
    sdn = 0.4; rseed = 50;

    # generate fully synthetic data
    mydata1 = madsim(mdata = NULL, n = 10000, ratio = 0, fparams, dparams, sdn, rseed);

    # use true affymetrix data to generate synthetic data
    mydata2 = madsim(mdata = madsim_test, n=10000, ratio=0,fparams,dparams,sdn,rseed);

    % calculate MAplot variables using samples 1 and 12
    A1 = 0.5*(mydata1$xdata[,12] + mydata1$xdata[,1]);
    M1 = mydata1$xdata[,12] - mydata1$xdata[,1];

    A2 = 0.5*(mydata2$xdata[,12] + mydata2$xdata[,1]);
    M2 = mydata2$xdata[,12] - mydata2$xdata[,1];

    # draw MA plot using samples 1 and 12
    op = par(mfrow = c())
       plot(A1,M1)
       plot(A2,M2)
    par(op)
}
