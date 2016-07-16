#' Compute the phase spectrum of a timeseries.
#'
#' @param t Sampling times of the timeseries.
#' @param x Value of the timeseries at each sample time.
#' @param omega Angular frequencies to evaluate periodogram at.
#' @param demeaned Whether timeseries has already been de-meaned.
#'
#' @return Values of phase spectrum at angular frequencies specified.
#'
#' @examples
#' phase.spectrum(1:10, sin(1:10), 2*pi/1:10, FALSE)
#'
#' @export
phase.spectrum <- function(t, x, omega,
                           demeaned = FALSE) {

    ## De-mean, if not already done. ##
    if (!demeaned) {
        x <- x - mean(x)
    }

    tau <- tau(t, omega)

    f1 <- periodogram.phase.component(t, x, omega, tau, "sin")
    f2 <- periodogram.phase.component(t, x, omega, tau, "cos")

    atan2(-f1, f2) %% (2*pi)

}
