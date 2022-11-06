# https://stephens999.github.io/fiveMinuteStats/MH-examples1.html
# Example 2: Estimating an allele frequency

#########################################
# 대립유전자 A, a
# p: A 유전자 비율
# AA : Aa (aA) : aa = p^2 : 2p(1-p) : (1-p)^2
#########################################

# ===================================================================== #
### p(p) prior ###
# p에 대해 가진 정보가 없기 때문에 0<p<1에서 동일한 확률을 갖도록 uniform(0,1) 을 prior로 설정

log_prior = function(p){
  if((p<0) || (p>1)){  # || here means "or"
    return(-Inf)}
  else{
    return(0)}
}

# --------------------------------------------------------------------- #
### p(nAA, nAa, naa | p) likelihood ###
# n개의 샘플을 뽑아 AA, Aa, aa를 각각 nAA, nAa, naa개라고 함.

log_likelihood = function(p, nAA, nAa, naa){
  return((2*nAA)*log(p)  + nAa * log (2*p*(1-p)) + (2*naa)*log(1-p))
}

# --------------------------------------------------------------------- #
### Metropolis algorithm => p(p | nAA, nAa, naa) posterior 근사! ###
# proposal distribution: normal(currentp, pproposalsd^2)

psampler = function(nAA, nAa, naa, niter, pstartval, pproposalsd){
  p = rep(0, niter)
  p[1] = pstartval
  for(i in 2:niter){ 
    #현재 p
    currentp = p[i-1]
    
    #다음 p 후보값
    newp = rnorm(1,currentp,pproposalsd) 
    # 현재값 + proposal distribution에서 랜덤샘플링으로 얻은 값
    # dpqr 함수 활용!
    
    #acceptance ratio (컴퓨터 상 계산 안전성 위해 exp(log) 형태)
    r = exp(log_likelihood(newp,nAA,nAa,naa) - 
              log_likelihood(currentp,nAA,nAa,naa) +
              log_prior(newp) -
              log_prior(currentp))  
    
    if(runif(1) < r){
      p[i] = newp         # accept move with probability min(1,r)
    } else {
      p[i] = currentp     # otherwise "reject" move, and stay where we are
    }
  }
  return(p)
}

# ===================================================================== #
# Running this sample for nAA=50, nAa=21, naa=29
p_sample = psampler(50, 21, 29, niter=10000, pstartval=0.5, pproposalsd=0.01)

# Compare the sample from the posterior with the theoretical posterior
x = seq(0, 1, length=1000)
hist(p_sample, prob=T)
lines(x, dbeta(x, 121+1, 79+1))  # overlays beta density on histogram

# discard the first 5000 p’s as “burnin”
hist(p_sample[5001:10000])
