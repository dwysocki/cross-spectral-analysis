# Cross Spectral Analysis

Provides functions for performing cross-spectral analysis on unevenly sampled timeseries. Based on the programs `SLOMBS.FOR` and `CSLOMBS.FOR` described in the paper ["Spectral and cross-spectral analysis of uneven time series with the smoothed Lomb–Scargle periodogram and Monte Carlo evaluation of statistical significance" by Eulogio Pardo-Igúzquizaa & Francisco J. Rodríguez-Tovarb](http://www.sciencedirect.com/science/article/pii/S0098300412002130).

Note: Currently only single-timeseries methods are complete (`SLOMBS.FOR`).


# Installation

Simply compile with the `Makefile` (may require root privileges)

```bash
$ make
```


# Usage

Install using:

```bash
# May need root. Replace <PATH> with the path to this package.
$ R CMD INSTALL <PATH>
```

Then start an R session and run:

```R
# Load package.
library(cross.spectral.analysis)

# Generate sampling times for timeseries.
delta.t <- 0.01
t.min   <- 0
t.max   <- 4*pi
t <- seq(t.min, t.max, delta.t)

# Generate sampling frequencies for spectra.
delta.f <- 0.01
f.min   <- delta.f
f.max   <- 1 / (2*delta.t)
f       <- seq(f.min, f.max, delta.f)
omega   <- 2*pi*f

# Generate timeseries.
x <- sin(2*t) + sin(3*t)

# Compute amplitude and phase spectra.
A   <- amplitude.spectrum(t, x, omega)
phi <- phase.spectrum(t, x, omega)

# Plot results
pdf("csa-demo.pdf")

plot(t, x,   type = "l", axes = FALSE)
axis(side = 1,
     at = c(0, pi, 2*pi, 3*pi, 4*pi),
     labels = expression(0, pi, 2*pi, 3*pi, 4*pi))
axis(side = 2)

plot(f, A,   type = "l")

plot(f, phi, type = "l", ylab = expression(phi), axes = FALSE)
axis(side = 1)
axis(side = 2,
     at = c(0, pi/2, pi, 3*pi/2, 2*pi),
     labels = expression(0, pi/2, pi, 3*pi/2, 2*pi))

dev.off()
```

View the file `csa-demo.pdf` that you've now created, to see the results.


# Credit

Daniel Wysocki © 2016

Protected under the MIT License.
