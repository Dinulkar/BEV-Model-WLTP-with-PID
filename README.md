# ⚡ BEV Powertrain Model with PID Controller

**Author:** Dinesh Kumar Rajakumaran  
**Date:** October 10, 2025  

---

## 🔍 Description
This project models a **Battery Electric Vehicle (BEV)** in **Simulink**, focusing on the powertrain dynamics and implementing a **PID controller** to follow the **WLTP driving cycle**.  
The model includes simplified analytical equations representing the **motor**, **transmission**, and **load** dynamics.

---

## ⚙️ Key Model Features
- **Reduced Analytical Model:**  
  - Equation (1): Motor Dynamics  
  - Equation (2): Transmission Dynamics  
  - Equation (3): Load Dynamics  

- **Simulink Implementation:**  
  - WLTP driving cycle as reference input (`WLTP_sim`)  
  - Error computed between reference and BEV actual speed  
  - BEV Powertrain subsystem includes torque load, traction force, and lookup tables  
  - PID controller adjusts motor torque to minimize speed error  

- **Powertrain Details:**  
  - Calculates **traction force (Fz)** and **torque load (TL)** using analytical relationships  
  - **Wheel speed** obtained from the load model derivative (`phi_dot × r_dyn`)  
  - Includes aerodynamic and rolling resistance effects  

---

## 📈 Results
- The tuned PID controller enables the BEV to **closely track the WLTP speed profile**.  
- Achieved **maximum speed (Vmax)** of **96.63 km/h**.  
- Output graphs show good correlation between **reference** and **actual** speeds.  

---

## 📂 Files
| File | Description |
|------|-------------|
| `BEV_PID_Simulation.slx` | Simulink model of the BEV powertrain with PID |
| `WLTP_Data.mat` | WLTP driving cycle input data |
| `README.md` | Project documentation |

---

**Thank you!**  
*— Dinesh Kumar Rajakumaran*
