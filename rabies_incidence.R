par(mfrow=c(1,1), mar=c(4,4,2,4)+0.1, pin=c(4,3), mgp=c(2.5,1,0), cex=0.9)
colours=c("green", "seagreen", "black", "orange", "blue", "turquoise","purple", "red", "sienna2")
plot(years, data[,2], type="l", xlab="", ylab="Confirmed rabies cases", ylim=range(1:900), col=colours[1], lwd=2)
for (i in 3:8) {lines(years, data[,i], type="l", col=colours[i-1], lty=1, lwd=2)}
lines(years, data[,10], type="l", col=colours[9], lty=1, lwd=2)
points(years, data[,10], pch=20, col=colours[9])

legend(1970.5, 900, bty="n", legend=XYs$country, col=colours,  
pt.cex =c(0,0,0,0,0,0,0,1, 1), pch=c(1,1,1,1,1,1, 1, 20,20), lty=rep(1,8), lwd=rep(2,8), cex=0.8)

par(new=T)
plot(years, data[,9], axes=F, xlab="", ylab="", type="l", lty=1, col=colours[8], lwd=2, ylim=range(1:6000))
points(years, data[,9], pch=20, col=colours[8])

axis(side=4, cex=0.8); mtext(side=4, line=2.5, "Human exposures", cex=0.8)

