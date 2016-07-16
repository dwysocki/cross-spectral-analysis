#' Compute the cross-amplitude spectrum of two timeseries.
#'
#' @param t1 Sampling times of timeseries 1.
#' @param x1 Value of timeseries 1 at each sample time.
#' @param t2 Sampling times of timeseries 2.
#' @param x2 Value of timeseries 2 at each sample time.
#' @param omega Angular frequencies to evaluate periodogram at.
#' @param demeaned Whether timeseries has already been de-meaned.
#'
#' @return Values of cross-amplitude spectrum at angular frequencies specified.
#'
#' @examples
#' #cross.amplitude.spectrum(1:10, sin(1:10), 1:10, cos(1:10), 2*pi/1:10, FALSE)
cross.amplitude.spectrum <- function(t1, x1, t2, x2, omega,
                                     demeaned = FALSE) {

    ## De-mean, if not already done. ##
    if (!demeaned) {
        x1 <- x1 - mean(x1)
        x2 <- x2 - mean(x2)
    }

    tau1 <- tau(t1, omega)
    tau2 <- tau(t2, omega)

    a1 <- periodogram.component(t1, x1, omega, tau1, "cos")
    a2 <- periodogram.component(t2, x2, omega, tau2, "cos")
    b1 <- periodogram.component(t1, x1, omega, tau1, "sin")
    b2 <- periodogram.component(t2, x2, omega, tau2, "sin")

    co.spectrum   <- a1*a2 + b1*b2
    quad.spectrum <- a1*b2 - a2*b1

    co.spectrum^2 + quad.spectrum^2

}
