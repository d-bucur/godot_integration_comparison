# Overall
- **Euler**: just don't. This is basically to highlight everything that can go wrong
- **Symplectic (semi implicit) Euler**: Fastest and with decent accuracy. Is the standard implementation in most game physics engines as performance is more important than accuracy. For simple trajectories like short ballistic jumps it's basically indistinguishable from the rest. Just swapping the two lines of Euler for much better results and also very easy. Needs to be run at fixed timestep, otherwise error will pile up quickly. Just don't assume (like I did) that this is the only or best way to solve the problem.
- **Velocity Verlet**: Best compromise considering accuracy and performance. Technically is same order of operations as Euler (one sample per function), but in practice requires around double the operations so not as performant. Maintains energy (the errors cancel each other out as long as Δt isn't huge) and can handle a varying timestep which is great for orbital simulations
- **(Position) Verlet**: Not covered in the code here, but it's the classical way to write Verlet. It's a bit more inconvenient as you describe it using 2 positions and compute velocity from those. But it is useful to make a very simple physics engine as the collision response is moderatly accurate and is easy to write.
- **Leapfrog**: very similar to Velocity Verlet as properties, but need a bit of guesstimation to kickstart due to needing to shift vel to t+Δt/2. Once started though, is as performant as Euler. Can be rewritten into VV. Theoretically should be more accurate than Symplectic Euler, but breaks down just as fast with varying timestep
- **Midpoint**: Worse than VV in every way. Same order of error but needs two accel evaluations as they are different points and can't be cached. Will also accumulate error as Euler since it is not symplectic, just slower.
- **RK4 (Runge Kutta)**: huge amount of operations and will still drift over long times. Only use if short burst accurate results are needed. Or if operating on galactic scales where distances are huge and orbits take very long times, like in astrophysics simulations. Pretty bad for real time simulations though.
- **Forest Ruth**: Great integrator with huge accuracy and decent performance. Stays very stable with little error over long periods and has the best performance of the order 4 integrators since it has way less operations. Honestly I have no idea why RK4 is so popular since this one seems better in every way
- **PEFRL (Position Extended Forest-Ruth)**: Clear winner in terms of accuracy. Nothing I threw at this managed to bugde planets off the correct orbit. Not even wildly varying timesteps. It is theoretically the same order as FR, but in practice it is 26 (!!!) times more accurate with just a few more operations. If you have a not huge amount of objects and care about accuracy this is the safest bet.

I also tried to do a proper benchmark of performance, but unfortunately GDScript has wildly varying performance and the results made no sense. In retrospect, this project should have been implemented in a proper language, but it started out as a small test from a Godot project I was working on.

# Ballistic trajectory
| method                | tps[^1] | max_x  | min_y (%err)   | time (%err)  |
|-----------------------|-----|--------|----------------|--------------|
|            analytical |     |        | -1451.8        | 4105.49      |
|              leapfrog |  30 | 1107.3 | -1385.7 ( 4.6) |  3990 ( 2.8) |
|              leapfrog |  60 | 1110.7 | -1418.6 ( 2.3) |  4005 ( 2.4) |
|             engine_rb |  30 | 1114.0 | -1418.6 ( 2.3) |  4056 ( 1.2) |
|             engine_rb |  60 | 1114.0 | -1435.2 ( 1.1) |  4049 ( 1.4) |
|                   sie |  30 | 1114.0 | -1418.6 ( 2.3) |  4056 ( 1.2) |
|                   sie |  60 | 1114.0 | -1435.2 ( 1.1) |  4049 ( 1.4) |
|              midpoint |  30 | 1120.7 | -1451.8 ( 0.0) |  4056 ( 1.2) |
|              midpoint |  60 | 1117.3 | -1451.8 ( 0.0) |  4050 ( 1.4) |
|                   rk4 |  30 | 1120.7 | -1451.8 ( 0.0) |  4055 ( 1.2) |
|                   rk4 |  60 | 1117.3 | -1451.8 ( 0.0) |  4050 ( 1.4) |
|                    fr |  30 | 1120.7 | -1451.8 ( 0.0) |  4055 ( 1.2) |
|                    fr |  60 | 1117.3 | -1451.8 ( 0.0) |  4050 ( 1.4) |
|                 pefrl |  30 | 1120.7 | -1451.8 ( 0.0) |  4055 ( 1.2) |
|                 pefrl |  60 | 1117.3 | -1451.8 ( 0.0) |  4050 ( 1.4) |
|                verlet |  30 | 1127.3 | -1485.2 ( 2.3) |  4090 ( 0.4) |
|                verlet |  60 | 1120.7 | -1468.5 ( 1.2) |  4056 ( 1.2) |
|                 euler |  30 | 1127.3 | -1485.2 ( 2.3) |  4123 ( 0.4) |
|                 euler |  60 | 1120.7 | -1468.5 ( 1.2) |  4077 ( 0.7) |

A short ballistic trajectory like what you would use in a game is pretty simple and all the integrators perform virtually the same within a reasonable measurement error from the analytical solution (1-2%)

# Orbital mechanics
TODO use Kepler to measure errors. Or check total energy (kinetic + potential) that should stay the same as the initial value

## Comments
Mostly covered in [overall](#overall) section
- Euler: completely innacurate, error increases with each timestep
- Midpoint: orbital period increases like in Euler, just slower. This happens because the error accumulates when the slope of the function does not change sign, causing it to gain energy
- Symplectic Euler: serviceable, but gains energy when varying timestep
- Velocity Verlet: conserves energy, even at varying timesteps, but becauase of innacuracy the orbit rotates around the focal point [^2]
- Leapfrog: should be similar to symplectic euler, but the velocity and positions are staggered
- RK4: even more drift than VV, doesn't conserve energy, maybe something wrong with implementation or test

# Harmonic oscillator
Pretty similar to test above since acceleration depends only on position. Maybe should replace with something that depends on time?

# Battle Royale
Since math isn't my strong suit, I'm using the very scientific method of pitting all the integrators against each other in a battle royale! The acceleration conditions change dynamically and the last one left in the arena wins!

[^1]: ticks per second (fixed timestep). Δt = 1s/tps

[^2]: This is a real life effect called apsidal precession, but probably shouldn't happen in a [two body problem](https://en.wikipedia.org/wiki/Two-body_problem_in_general_relativity#Apsidal_precession). It is explained by [relativity](https://en.wikipedia.org/wiki/Apsidal_precession#General_relativity) but relativity is not simulated here so this is probably due to inaccuracy. The effect is noticeable on all integrators over long periods of time.
