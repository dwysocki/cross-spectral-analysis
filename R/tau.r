#' Compute the time-shift parameter tau.
#'
#' @param t Sampling times.
#' @param omega Angular frequency.
#'
#' @return Time-shift parameter tau.
#'
#' @examples
#' tau(1:10, 2*pi)
#'
#' @export
tau <- function(t, omega) {
    # two.omega[j] = 2 * omega[j]
    two.omega <- 2 * omega
    # two.omega.t[j,i] = 2 * omega[j] * t[i]
    two.omega.t <- two.omega %o% t

    # sin.sum[j] = Sum from i=1..N of sin(two.omega.t[j,i])
    sin.sum = rowSums(sin(two.omega.t))
    # cos.sum[j] = Sum from i=1..N of cos(two.omega.t[j,i])
    cos.sum = rowSums(cos(two.omega.t))

    # Consistent with the Fortran code
    # two.omega.tau[j] = atan(sin.sum[j] / cos.sum[j])
    two.omega.tau <- atan(sin.sum / cos.sum)
#    # Consistent with the paper.
#    # two.omega.tau[j] = atan2(sin.sum[j], cos.sum[j])
#    two.omega.tau <- atan2(sin.sum, cos.sum)


    # Consistent with the Fortran code
    # two.omega.tau[j] / (2*pi)
    two.omega.tau / (2*pi)
#    # Consistent with the paper.
#    # two.omega.tau[j] / (2*omega[j])
#    two.omega.tau / two.omega

}
