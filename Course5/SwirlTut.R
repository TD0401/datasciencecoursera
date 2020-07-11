integrate(mypdf, 0, 1.6)
sd(apply(matrix(rnorm(10000),1000),1,mean))
matrix(rnorm(10000),1000)
sd(apply(matrix(sample(0:1,10000,TRUE),1000),1,mean))
(choose(5,3) * (.8) ^3 * (.2) ^2) + (choose(5,4) * (.8) ^ 4* (.2) ^ 1) + (choose(5,5) * (.8) ^5 * (.2) ^0)
pbinom(2,5,.8, lower.tail = FALSE)
qnorm(10)
qnorm(0.975, mean = 3, sd = 2)
pnorm(1200, 1020, 50, lower.tail = FALSE)
qnorm(0.75, mean = 1020, sd = 50 , lower.tail = FALSE)
qnorm(0.75, mean = 1020, sd = 50 , lower.tail = TRUE)
ppois(3, (2.5*4) )
pbinom(5, 1000, .01)
binom.test(60, 100)$conf
0.6 + c(-1,1) * qnorm(.975) * sqrt(.6 *.4 /100)
lamb + c(-1,1) * qnorm(.975) * sqrt(lamb / 94.32)
poisson.test(5, 94.32)$conf
qt(.975,2)
mn + c(-1,1) * qt(.975 , 9) * s / sqrt(10)
t.test(difference)
t.test(difference)$conf.int
127.44 - 132.86 + c(-1,1) * qt(.975, ns) * sp / sqrt(1/8 + 1/21)
md + c(-1,1) * qt(.975 , 18) * sp * sqrt(2/10)
t.test(g2,g1 , paired = FALSE, var.equal = TRUE)$conf
t.test(g2,g1 , paired = TRUE)$conf
t.test(fs$sheight , fs$fheight , paired = TRUE)
pbinom(6,8,.5,lower.tail = FALSE)
pnorm( 30 +z, 30, lower.tail = FALSE)
power.t.test(n = 16, delta = 2/4, sd = 1, type = "one.sample" , alt = "one.sided")$power
power.t.test(n = 16, delta = 2/4, sd = 1, type = "one.sample" , alt = "one.sided")$power
power.t.test(n = 16, delta = 2, sd = 1, type = "one.sample" , alt = "one.sided")$power
power.t.test(n = 16, delta = 2, sd = 4, type = "one.sample" , alt = "one.sided")$power
power.t.test(n = 16, delta = 100, sd = 200, type = "one.sample" , alt = "one.sided")$power
power.t.test(power=0.8, delta = 2/4, sd = 1, type = "one.sample" , alt = "one.sided")$n
power.t.test(power=0.8, delta = 2, sd = 4, type = "one.sample" , alt = "one.sided")$n
power.t.test(power=0.8, delta = 100, sd = 200, type = "one.sample" , alt = "one.sided")$n
power.t.test(power=0.8, n = 26, sd = 1, type = "one.sample" , alt = "one.sided")$delta
power.t.test(power=0.8, n = 27, sd = 1, type = "one.sample" , alt = "one.sided")$delta
sum(pValues < 0.05)
sum(p.adjust(pValues , p.adjust.methods="bonferroni") < 0.05)
sum(p.adjust(pValues , method="bonferroni") < 0.05)
sum(p.adjust(pValues , method="BH") < 0.05)
table(pValues2 < 0.05, trueStatus)
table(p.adjust(pValues2 , method="bonferroni") < 0.05, trueStatus)
table(p.adjust(pValues2 , method="BH") < 0.05, trueStatus)
sam <- sample(fb, nh*B , replace=TRUE)
sam <- sample(fh, nh*B , replace=TRUE)
resam <- matrix(sam, B, nh)
meds <- apply(resam , 1, median)
median(fh)
median(meds) - median(fh)
sd(meds)
sd(resampledMedians)
resampledMedians + c(.025 , .975)
quantile(resampledMedians , c(.025 , .975))
quantile(meds , c(.025 , .975))
perms <- sapply(1:10000, function(i) testStat(BCcounts, sample(group)))
mean(perms > obs)
perms <- sapply(1:10000, function(i) testStat(DEcounts, sample(group)))
