# n-body simulation
Erlang n-body simulation

## Documentation

This is a simulation of the [n-body problem](https://en.wikipedia.org/wiki/N-body_problem) using erlang.
The program spawns a thread for each 'body' and simulates the effect of gravity in ticks. This is the standard brute-force approach.

It automatically generates bodies across a bi-dimensional space bounded by user input. The output is, for each round, the mass and position of each body.

**body.erl** implements the body functionality of updating position according to the gravity influence of nearby bodies

**gravity.erl** calculates the force vector between two bodies using the formula F = G\*(mass1 \* mass2) / (distance^2)

**sum\_forces.erl** gives the resulting force vector for a given body

**simulation.erl** implements the main simulation function.

simulation:simulation accepts four arguments: body\_count, ticks, max\_mass and max\_dimension\_size.
The first parameter, body\_count, is the number of bodies to be initialized. Ticks is the number of rounds the simulation will run for. Max\_mass is the maximum mass for any of the generated bodies. Max\_dimension\_size is the boundary of the 2D space each body is inserted into.

## Instructions

Compile each module with c(modulename).

Run the simulation module, for example as simulation:simulation(3, 80, 800, 800).
