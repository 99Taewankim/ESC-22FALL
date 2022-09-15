#### Gibbs sampler

# priors
mu0<-1.9  ; t20<-0.95^2
s20<-.01 ; nu0<-1

# data
y<-c(1.64,1.70,1.72,1.74,1.82,1.82,1.82,1.90,2.08)
n<-length(y) ; mean.y<-mean(y) ; var.y<-var(y)

## starting values
set.seed(1)
S<-1000
PHI<-matrix(nrow=S,ncol=2)
PHI[1,]<-phi<-c( mean.y, 1/var.y)

## Gibbs sampling algorithm
for(s in 2:S) {
  
  # generate a new theta value from its full conditional
  mun<-  ( mu0/t20 + n*mean.y*phi[2] ) / ( 1/t20 + n*phi[2] )
  t2n<- 1/( 1/t20 + n*phi[2] )
  phi[1]<-rnorm(1, mun, sqrt(t2n) )
  
  # generate a new sigma^2 value from its full conditional
  nun<- nu0+n
  s2n<- (nu0*s20 + (n-1)*var.y + n*(mean.y-phi[1])^2 ) /nun
  phi[2]<- rgamma(1, nun/2, nun*s2n/2)
  
  PHI[s,]<-phi         }

#### trajectory plot of gibbs sampler
pdf("trajectory_plot.pdf",family="Times",height=3.5,width=7)
par(mfrow=c(1,2))
par(mar=c(3,3,1,1),mgp=c(1.75,.75,0))
plot(PHI[,1],xlab="iteration",ylab=expression(theta))  
plot(1/PHI[,2],xlab="iteration",ylab=expression(sigma^2))  

dev.off()

#### lag-t autocorrelation function for mu(theta)
library(coda)
acf(PHI[,1],lag.max=5)

### EffectiveSize for mu(theta)
effectiveSize( PHI[,1] )

### EffectiveSize for var(sigma^2)
effectiveSize(1/PHI[,2] )