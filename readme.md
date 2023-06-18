## Description
Testing different numerical integration methods for acceleration/velocity of 2D bodies in Godot.

| method          | symplectic[^1] | error order | implemented | variable timestep[^3] | samples per step[^2] |
|-----------------|------------|-------------|-------------|---------------------|------------------|
| [Basic Euler](https://en.wikipedia.org/wiki/Euler_method)                    | ❌          | O(Δt)       | ✔️           | ❌                   | 1                |
| [Symplectic Euler](https://en.wikipedia.org/wiki/Semi-implicit_Euler_method) | ✔️          | O(Δt)       | ✔️           | ❌                   | 1                |
| Godot Rigidbody2D (symplectic Euler)                                         | ✔️          | O(Δt)       | ✔️           | ❌                   | 1                |
| Velocity Verlet                                                              | ✔️          | O(Δt^2)     | ✔️           | ✔️                   | 1                |
| Midpoint                                                                     | ❌          | O(Δt^2)     | ❌           | ?                   | 2                |
| RK4                                                                          | ❌          | O(Δt^4)     | ❌           | ?                   | 4                |

[^1]: The system conserves energy if the underlying system does (ie. planets orbit does not change total energy)

[^2]: Actual number is doubled if integrating both acceleration and velocity

[^3]: Does the error change significantly by varying the timestep? While an easy fix is to have a fixed timestep, it is still preferrable to work with a variable one to permit changing the speed of the simulation

Testing scenarios:
- Ballistic trajectory
- Orbital mechanics

## TODO
- implement midpoint and RK4
- normalize acceleration sampling in all tests
- engine test starts behind all others on first frame? or maybe just trail bug

[Results (preliminary)](results.md) - comparison and errors from analytical solutions

[References](references.md)