#' Compute one component of the periodogram.
#'
#' @param t Sampling times.
#' @param x Value of timeseries at each sample time, after demeaning and standardizing.
#' @param omega Angular frequency to evaluate periodogram at.
#' @param tau Time-shift parameter tau.
#' @param sincos Either "sin" or "cos": whichever component is desired.
#'
#' @return Periodogram component value.
#'
#' @examples
#' periodogram.component(1:10, sin(1:10), 1, tau(1:10, 1), "sin")
#'
#' @export
periodogram.component <- function(t, x, omega, tau, sincos) {

    ## Input Validation ##

    # Parse the strings "sin" and "cos" into their respective functions,
    # and raise an error if neither provided.
    sincos.fn <- switch(sincos, sin = sin, cos = cos)
    if (is.null(sincos.fn)) {
        stop("Invalid value '", sincos, "' provided for 'sincos'. ",
             "Must be either 'sin' or 'cos'.")
    }

    t.minus.tau <- outer(tau, t, FUN = `-`)
    sincos.vec <- sincos.fn(t.minus.tau * omega)

    (sincos.vec %*% x) / sqrt(rowSums(sincos.vec^2))

}
