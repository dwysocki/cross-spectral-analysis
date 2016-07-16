#' Compute the amplitude spectrum of a timeseries.
#'
#' @param t Sampling times of timeseries.
#' @param x Value of timeseries at each sample time.
#' @param omega Angular frequencies to evaluate periodogram at.
#' @param demeaned Whether timeseries has already been de-meaned.
#' @param standardized Whether timeseries has already been standardized.
#'
#' @return Values of amplitude spectrum at angular frequencies specified.
#'
#' @examples
#' amplitude.spectrum(1:10, sin(1:10), 2*pi/1:10, FALSE, FALSE)
#'
#' @export
amplitude.spectrum <- function(t, x, omega,
                               demeaned = FALSE, standardized = FALSE) {

    ## De-mean and standardize, if not already done. ##
    if (!demeaned) {
        x <- x - mean(x)
    }
    if (!standardized) {
        x <- x / sd(x)
    }

    tau <- tau(t, omega)

    a <- periodogram.component(t, x, omega, tau, "cos")
    b <- periodogram.component(t, x, omega, tau, "sin")

    0.5 * (a^2 + b^2)

}
