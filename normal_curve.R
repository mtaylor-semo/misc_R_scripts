x <- rnorm(100000,mean=66.5,sd=4.43)

x <- rnorm(10000,mean=66.5,sd=4.43)




hist(x, xlab="Adult Height (inches)", ylab='Number Individuals', freq=TRUE, breaks=20, xlim=c(50,80), las=1)
lines(density(x), col='gray25') 
abline(v=66.5, lty=2)

h100 <- rnorm(100, mean=66.5, sd=4.43)
h250 <- rnorm(500, mean=66.5, sd=4.43)
h1000 <- rnorm(1000, mean=66.5, sd=4.43)
bigN <- rnorm(9000, mean=66.5, sd=4.43)


op <- par(family='serif')

hist(h100, xlab="Adult Height (inches)", ylab='Number Individuals', main='Height from a random sample\nof 100 U.S. Adults', freq=TRUE, breaks=20, xlim=c(50,80), las=1)
lines(density(bigN), col='gray25', family='serif') 
abline(v=66.5, lty=2)

par(op)

h100 <- rnorm(100, mean=66.5, sd=4.43)
h250 <- rnorm(500, mean=66.5, sd=4.43)
h1000 <- rnorm(1000, mean=66.5, sd=4.43)
bigN <- rnorm(9000, mean=66.5, sd=4.43)


op <- par(family='serif')

hist(h100, xlab="Adult Height (inches)", ylab='Number Individuals', main='Height from a random sample\nof 100 U.S. Adults', freq=TRUE, breaks=20, xlim=c(50,80), las=1)
lines(density(bigN, adjust=2), col='gray25', family='serif') 
abline(v=66.5, lty=2)

par(op)


h <- hist(bigN, plot=FALSE, breaks=25)

plot(h, xlab="Adult Height (inches)", ylab='Sample Probability', main='Height from a random sample\nof 9000 U.S. Adults', freq=FALSE, xlim=c(50,80), las=1, border="white")
lines(density(bigN, adjust=2), col='gray25') 
abline(v=66.5, lty=2)

curve(dnorm(x,66.5,4.43),50,80, xlab="Adult Height", ylab="Probability of sampling", las=1, bty='l')
abline(v=66.5,lty=2)

