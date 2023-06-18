## Description
Testing different numerical integration methods for acceleration/velocity of 2D bodies in Godot.

| method                               | symplectic[^1] | error order | variable Δt[^3] | samples per step[^2] |
|--------------------------------------|----------------|-------------|-----------------|----------------------|
| Basic Euler                          | ❌             | O(Δt)       | ❌              | 1                    |
| Symplectic Euler                     | ✔️             | O(Δt)       | ❌              | 1                    |
| Godot Rigidbody2D (symplectic Euler) | ✔️             | O(Δt)       | ❌              | 1                    |
| Velocity Verlet                      | ✔️             | O(Δt^2)     | ✔️              | 1                    |
| Leapfrog                             | ✔️             | O(Δt^2)     | ✔️              | 1                    |
| Midpoint                             | ❔             | O(Δt^2)     | ✔️              | 1                    |
| RK4                                  | ❌             | O(Δt^4)     | ❔              | 4                    |


[^1]: The system conserves energy if the underlying system does (ie. planets orbit does not change total energy)

[^2]: Actual number is doubled if integrating both acceleration and velocity

[^3]: Is the error constant with a variable timestep? While a workaround is to have a fixed timestep, this is still a preferred property that enables changing the speed of the simulation at runtime

Testing scenarios:
- Ballistic trajectory
- Orbital mechanics

## TODO
- implement RK4
- normalize acceleration sampling in all tests
- update tests and results

[Results (preliminary)](results.md) - comparison and errors from analytical solutions

[References](references.md)