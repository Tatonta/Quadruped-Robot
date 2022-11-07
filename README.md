# Quadruped-Robot
## Structure Description

In this work is implemented a bio-inspired Algorithm, named Central Pattern Generator (CPG) for the locomotion generation and control of a Quadruped Robot.
The CPG is a small-sized neural network located in the Central Nervous System (CNS) whose purpose is to produce rhythmic patterns (walking, swimming, breathing) of motor activity even in the absence of sensory feedback or signals from the CNS.
The structure of the robot is inspired by a quadrupedal animal. Each leg consists of two MX-28 servomotors, which can be set to work in SERVO mode or in WHEEL mode.
<p align="center">
<img src="https://user-images.githubusercontent.com/117543360/200411145-64ca8807-64f7-4a94-9918-771af23ff02f.png" width="200" height="250"/>
</p>
The bottom part of the leg is made up by three disjointed claw-shaped pieces, made with 3D printer, and whose curved shape allows the robot to climb. They were covered with pieces of a tube of a bicycle wheel in order to give more friction to the paw and reduce slipping.

<p align="center">
<img src="https://user-images.githubusercontent.com/117543360/200412908-6d6a1c44-22c8-4843-a1d0-3f3a322514a5.png" width="500"/>
</p>
The motors are powered directly from the power supply (12V, 30A). We improved the cables in order to sustain high amounts of current. Remember that is strictly necessary to connect the ground of the supply with Arduino microcontroller (otherwise the circuit is not closed and no current flows).
<p align="center">
<img src="https://user-images.githubusercontent.com/117543360/200414165-5133e296-a82b-4c87-8cd2-c755f6f9f20b.png" width="500"/>
</p>
The ground of the supply is fixed to the pinout in the plywood structure: you can easily connect with Arduino UNO. This type of wiring allows to reach an higher torque of the motors (maximum torque: 2.5 N*m/1.5A) which allows to rise the robot from the ground. In general, it is recommended that the “getting-up phase” is begun with bent
limbs (to avoid damaging current peak). We also added a magnetic platform to make signal acquisition for future optimization and modelling.
The whole structure is presented in the figure below:
<p align="center">
<img src="https://user-images.githubusercontent.com/117543360/200412528-17ad7bf9-a247-498b-a1dd-aa79b1a1b95a.JPG" width="500"/>
</p>
## Quadruped Locomotion and Steering on CPG based Architecture
Locomotion is carried out by a series of rhythmic mechanical sequences: stance phase, to hold the weight, and swing to propel the weight forward, and through a proper rhythmic pattern we allow movement. The signals which generate this pattern are from a neural complex located in the Central Nervous System, the Central Pattern Generator (CPG).
We can recreate this rhythmic pattern of the CPG by using Cellular Neural Networks (CNN). The phenomenon is described by nonlinear partial differential equations, called Reaction-Diffusion equation. 
The i-th cell is described by this second order system:

$$ \dot x_{i,1} = -x_{i,1} + (1+\mu) y_{i,1} - s_1 y_{i,2}+i1 $$

$$ \dot x_{i,2}= -x_{i,2}+ (1+\mu) y_{i,2} - s_2 y_{i,1}+i2$$

Where $y_i= \frac{1}{2} (|x_i+1|-|x_i-1|)$.
Each leg is modelled by a neuron, as shown in the figure below
<p align="center">
<img src="https://user-images.githubusercontent.com/117543360/200421595-07de8560-98ba-4da4-8b68-79ae661ccd7d.png"/>
</p>
The $\Phi$ symbols are a tunable parameter which represent the phase shift between the signals. Different phase shifts lead to different laplacian which lead to a different gait.
In this work is also implemented a bio-inspired steering, by increasing the nonlinearity saturation.
To see the robot in action, click on the youtube video below
<div align="center">
  <a href="https://www.youtube.com/watch?v=Wvfgmt3EIlQ"><img src="https://img.youtube.com/vi/Wvfgmt3EIlQ/hqdefault.jpg" width=250></a>
</div>
