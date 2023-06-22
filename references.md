## integration methods
- euler [yt series](https://www.youtube.com/watch?v=BIz-wEu0QwE&list=PLW3Zl3wyJwWPhARNV8SH1Jev5sgdH28ka&index=14)
- symplectic euler 
  [wiki](https://en.wikipedia.org/wiki/Semi-implicit_Euler_method) 
  [2](https://gafferongames.com/post/integration_basics/)
- verlet and variations 
  [1](https://gamedev.stackexchange.com/questions/15708/how-can-i-implement-gravity/41917#41917)
  [2](http://lolengine.net/blog/2011/12/14/understanding-motion-in-games)
  [wiki](https://en.wikipedia.org/wiki/Verlet_integration#Velocity_Verlet)
  [4](https://www.physics.udel.edu/~bnikolic/teaching/phys660/numerical_ode/node5.html)
  [5](https://www.algorithm-archive.org/contents/verlet_integration/verlet_integration.html)
- leapfrog
  [yt](https://www.youtube.com/watch?v=pVudb6-_FaM)
  [2](https://young.physics.ucsc.edu/115/leapfrog.pdf)
- midpoint
  [1](https://stackoverflow.com/questions/60355029/how-to-use-midpoint-method-to-integrate-a-particle)
  [wiki](https://en.wikipedia.org/wiki/Midpoint_method)
- RK4
  [yt](https://www.youtube.com/watch?v=hGCP6I2WisM&list=PLW3Zl3wyJwWPhARNV8SH1Jev5sgdH28ka&index=17)
  [wiki](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods)
  [principia](https://github.com/mockingbirdnest/Principia/blob/ca2948a74840c8c0416af83efce8f7ebebc6d430/documentation/ODEs%20and%20Runge-Kutta%20integrators.pdf)
  [4](https://www.physicsforums.com/threads/using-runge-kutta-method-for-position-calc.553663/)
  [adaptive step](https://www.youtube.com/watch?v=JcRsGD2pKlA)
- FR/PEFRL [1, last pages](https://young.physics.ucsc.edu/115/leapfrog.pdf)
- yoshida 
  [1](https://fse.studenttheses.ub.rug.nl/20185/1/bMATH_2019_PimJC.pdf)
  [wiki](https://en.wikipedia.org/wiki/Leapfrog_integration#4th_order_Yoshida_integrator): like leapfrog but higher order

## other engines
Box2d: [symplectic euler](https://gamedev.stackexchange.com/questions/79938/unitys-default-integration-method)

PhysX: [symplectic euler](https://github.com/NVIDIAGameWorks/PhysX-3.4/issues/57) or maybe [better?](http://www.adrianboeing.com/pal/papers/p281-boeing.pdf)

Bullet: [symplectic euler](https://pybullet.org/Bullet/phpBB3/viewtopic.php?t=9006)

Source: can choose different methods even per single object, but can't find source (pun indended)