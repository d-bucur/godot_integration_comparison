## Description
Comparison of different numerical integration methods for acceleration/velocity of 2D bodies in Godot.

| method                         | symplectic[^1] | error order | variable Δt[^3] | samples per step[^2] |
|--------------------------------|----------------|-------------|-----------------|----------------------|
| Basic Euler                    | ❌             | O(Δt)       | ❌             | 1                    |
| Symplectic Euler / Rigidbody2D | ✔️             | O(Δt)       | ❌             | 1                    |
| Velocity Verlet                | ✔️             | O(Δt^2)     | ✔️             | 1[^4]                |
| Leapfrog                       | ✔️             | O(Δt^2)     | ❌             | 1[^4]                |
| Midpoint                       | ❌             | O(Δt^2)     | ❌             | 2                    |
| RK4                            | ❌             | O(Δt^4)     | ❔             | 4                    |
| Forest Ruth                    | ✔️             | O(Δt^4)     | ✔️             | 3                    |
| PEFRL                          | ✔️             | O(Δt^4)[^5] | ✔️             | 4                    |


[^1]: The system conserves energy if the underlying system does (ie. planets orbit does not change total energy on average)

[^2]: Actual number is doubled when integrating both acceleration and velocity. Note that this is not an accurate indicator of performance, but a ballpark estimate

[^3]: Is the error constant with a variable timestep? While a workaround is to have a fixed timestep, this is still a preferred property that enables changing the speed of the simulation at runtime and integrating at higher timesteps to predict the future. This might just be a consequence of the first two properties, so take it with a grain of salt.

[^4]: Theoretically it's 2, but one sample can be cached from one frame to the next as it is the same value

[^5]: order is the same, but in practice PEFRL is 26 times (!!!) more accurate than FR (Forest Ruth)

Testing scenarios:
- Ballistic trajectory - constant acceleration
- Orbital mechanics - acceleration depends on position
- Harmonic oscillator - acceleration depends on position

[Analysis (in progress)](results.md) - A more detailed comparison based on this project research

[References](references.md) with more accurate mathematical descriptions of the techniques

## Possible improvements
- Error analysis compared to analytical solution for orbital scene
- Yoshida integrator
- Adaptive timestep techniques