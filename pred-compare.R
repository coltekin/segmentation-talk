ps <- read.csv(gzfile("~/thesis/experiments/pred/pred-scores.csv.gz"))
require(tikzDevice)



par(mar=c(1,4,0,1)+0.1, oma=c(0,4,3,0))

ctx <- data.frame(x=c(1,2,3),y=c(1,1,1))

wb <- ps$wboundary

mnames <- c('tp', 'mi', 'sv', 'h')

# the columns in the data that we are intersted in
dcols <- c()
p <- data.frame(dummy=1:100)
r <- data.frame(dummy=1:100)
for(m in mnames) {
    for (i in 1:length(ctx$x)) {
        x <- ctx[i,]$x
        y <- ctx[i,]$y
        dcol <- paste (m, as.character(x),
                         as.character(y), sep="_")
        dcols <- c(dcols, dcol)
        p[[dcol]] <- NA
        r[[dcol]] <- NA
    }
}


tikz('tp-tikz.tex', width=5, height=3.5);
par(mfrow=c(2,1))
        m <- "tp"
        mi <- 1
        x <- 2
        y <- 1
        dcol <- paste (m, as.character(x),
                          as.character(y), sep="_")
        all <- ps[[dcol]]
        b <- all[wb]
        nb <- all[!wb]

        # plot the histogram pair

        brks=seq(min(all), max(all), by=(max(all)-min(all))/50)
        bh <- hist(b, breaks=brks, plot=F)
        nbh <- hist(nb, breaks=brks, plot=F)

        xmin = min(all)
        xmax = max(all)
        ymax = max(c(bh$density, nbh$density))

        par(mar=c(1,4,2,1))
        plot(bh, freq=F, xlim=c(xmin, xmax), ylim=c(0, ymax), 
             col='red', main="", xlab="", xaxt='n', ylab="boudary");

        par(mar=c(3,4,0,1))
        plot(nbh, freq=F, xlim=c(xmin, xmax), ylim=c(0, ymax), 
             col='blue', main="", xlab="", ylab="word internal");

dev.off()

tikz('mi-tikz.tex', width=5, height=3.5);
par(mfrow=c(2,1))
        m <- "mi"
        mi <- 1
        x <- 2
        y <- 1
        dcol <- paste (m, as.character(x),
                          as.character(y), sep="_")
        all <- ps[[dcol]]
        b <- all[wb]
        nb <- all[!wb]

        # plot the histogram pair

        brks=seq(min(all), max(all), by=(max(all)-min(all))/50)
        bh <- hist(b, breaks=brks, plot=F)
        nbh <- hist(nb, breaks=brks, plot=F)

        xmin = min(all)
        xmax = max(all)
        ymax = max(c(bh$density, nbh$density))

        par(mar=c(1,4,2,1))
        plot(bh, freq=F, xlim=c(xmin, xmax), ylim=c(0, ymax), 
             col='red', main="", xlab="", xaxt='n', ylab="boudary");

        par(mar=c(3,4,0,1))
        plot(nbh, freq=F, xlim=c(xmin, xmax), ylim=c(0, ymax), 
             col='blue', main="", xlab="", ylab="word internal");
dev.off()

tikz('sv-tikz.tex', width=5, height=3.5);
par(mfrow=c(2,1))
        m <- "sv"
        mi <- 1
        x <- 2
        y <- 1
        dcol <- paste (m, as.character(x),
                          as.character(y), sep="_")
        all <- ps[[dcol]]
        b <- all[wb]
        nb <- all[!wb]

        # plot the histogram pair

        brks=seq(min(all), max(all), by=(max(all)-min(all))/50)
        bh <- hist(b, breaks=brks, plot=F)
        nbh <- hist(nb, breaks=brks, plot=F)

        xmin = min(all)
        xmax = max(all)
        ymax = max(c(bh$density, nbh$density))

        par(mar=c(1,4,2,1))
        plot(bh, freq=F, xlim=c(xmin, xmax), ylim=c(0, ymax), 
             col='red', main="", xlab="", xaxt='n', ylab="boudary");

        par(mar=c(3,4,0,1))
        plot(nbh, freq=F, xlim=c(xmin, xmax), ylim=c(0, ymax), 
             col='blue', main="", xlab="", ylab="word internal");
dev.off()

tikz('h-tikz.tex', width=5, height=3.5);
par(mfrow=c(2,1))
        m <- "h"
        mi <- 1
        x <- 2
        y <- 1
        dcol <- paste (m, as.character(x),
                          as.character(y), sep="_")
        all <- ps[[dcol]]
        b <- all[wb]
        nb <- all[!wb]

        # plot the histogram pair

        brks=seq(min(all), max(all), by=(max(all)-min(all))/50)
        bh <- hist(b, breaks=brks, plot=F)
        nbh <- hist(nb, breaks=brks, plot=F)

        xmin = min(all)
        xmax = max(all)
        ymax = max(c(bh$density, nbh$density))

        par(mar=c(1,4,2,1))
        plot(bh, freq=F, xlim=c(xmin, xmax), ylim=c(0, ymax), 
             col='red', main="", xlab="", xaxt='n', ylab="boudary");

        par(mar=c(3,4,0,1))
        plot(nbh, freq=F, xlim=c(xmin, xmax), ylim=c(0, ymax), 
             col='blue', main="", xlab="", ylab="word internal");
dev.off()
