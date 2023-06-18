## Ballistic trajectory
| method                | tps[^1] | max_x  | min_y (%err)   | time (%err)  |
|-----------------------|-----|--------|----------------|--------------|
|            analytical |     |        | -1451.8        | 4105.49      |
|        engine_default |  60 |  932.5 | -1192.6 (17.9) |  3804 ( 7.3) |
|      symplectic_euler |  60 | 1114.0 | -1435.2 ( 1.1) |  4048 ( 1.4) |
| velocity_verlet_const |  60 | 1117.3 | -1451.8 ( 0.0) |  4067 ( 0.9) |
|       velocity_verlet |  60 | 1117.3 | -1451.8 ( 0.0) |  4067 ( 0.9) |
|                 euler |  60 | 1120.7 | -1468.5 ( 1.2) |  4084 ( 0.5) |

## Orbital mechanics
TODO use Kepler to measure errors

[^1]: ticks per second (fixed timestep). Δt = 1s/tps
