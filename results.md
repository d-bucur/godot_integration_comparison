# Ballistic trajectory
| method                | tps[^1] | max_x  | min_y (%err)   | time (%err)  |
|-----------------------|-----|--------|----------------|--------------|
|            analytical |     |        | -1451.8        | 4105.49      |
|        engine_default |  60 |  932.5 | -1192.6 (17.9) |  3804 ( 7.3) |
|      symplectic_euler |  60 | 1114.0 | -1435.2 ( 1.1) |  4048 ( 1.4) |
| velocity_verlet_const |  60 | 1117.3 | -1451.8 ( 0.0) |  4067 ( 0.9) |
|       velocity_verlet |  60 | 1117.3 | -1451.8 ( 0.0) |  4067 ( 0.9) |
|                 euler |  60 | 1120.7 | -1468.5 ( 1.2) |  4084 ( 0.5) |

# Orbital mechanics
TODO use Kepler to measure errors

## Comments
- Euler: completely innacurate, error increases with each timestep
- Midpoint: orbital period increases like in Euler, just slower. This happens because the error accumulates when the slope of the function does not change sign, causing it to gain energy
- Symplectic Euler: serviceable, but gains energy when varying timestep
- Velocity Verlet: conserves energy, even at varying timesteps, but becauase of innacuracy the orbit rotates around the focal point. 
- Leapfrog: should be similar to symplectic euler, but the velocity and positions are staggered
- RK4: even more drift than VV, doesn't conserve energy, maybe something wrong with implementation or test

# Overall
- Euler: just don't. This is basically to highlight everything that can go wrong
- Symplectic Euler: Fastest and with decent accuracy. Is the standard implementation in most physics engines for games as performance is more important than accuracy. Just swapping the two lines of Euler for much better results and also very easy. Needs to be run at fixed timestep, otherwise error will pile up quickly
- Velocity Verlet: Best compromise considering accuracy and performance. Technically is same order of operations as Euler (one sample per function), but in practice requires around double the operations so not as performant. Maintains energy (the errors cancel each other out as long as Δt isn't huge) and can handle a varying timestep which is great for orbital simulations
- Leapfrog: very similar to Velocity Verlet as properties, but need a bit of guesstimation to kickstart due to needing to shift vel to t+Δt/2. Once started though, is as performant as Euler. Can be rewritten into VV. Should be more accurate than Symplectic Euler, but breaks down just as fast with varying timestep
- Midpoint: Worse than VV in every way. Same order of error but needs two accel evaluations as they are different points and can't be cached. Will also accumulate error as Euler, just slower.
- RK4: huge amount of operations and will still drift over long times. Only use if short burst accurate results are needed

[^1]: ticks per second (fixed timestep). Δt = 1s/tps
