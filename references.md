## possible methods
- simple euler
- midpoint / improved euler
  [1](https://www.physics.udel.edu/~bnikolic/teaching/phys660/numerical_ode/node3.html)
  [wiki](https://en.wikipedia.org/wiki/Midpoint_method)
- [symplectic euler](https://en.wikipedia.org/wiki/Semi-implicit_Euler_method)
- verlet / velocity verlet variation 
  [1](https://gamedev.stackexchange.com/questions/15708/how-can-i-implement-gravity/41917#41917)
  [2](http://lolengine.net/blog/2011/12/14/understanding-motion-in-games)
  [wiki](https://en.wikipedia.org/wiki/Verlet_integration#Velocity_Verlet)
  [4](https://www.physics.udel.edu/~bnikolic/teaching/phys660/numerical_ode/node5.html)
  [5](https://www.algorithm-archive.org/contents/verlet_integration/verlet_integration.html)
- RK4
  [wiki](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods)
  [principia](https://github.com/mockingbirdnest/Principia/blob/ca2948a74840c8c0416af83efce8f7ebebc6d430/documentation/ODEs%20and%20Runge-Kutta%20integrators.pdf)

## other engines
box2d: [symplectic](https://gamedev.stackexchange.com/questions/79938/unitys-default-integration-method)

source: can choose different methods even per single object, but can't find source (pun indended)

PhysX: better than symplectic