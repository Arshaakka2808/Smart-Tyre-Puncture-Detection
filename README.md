🛞 Smart Tyre Condition & Puncture Detection System
*An AI–IoT Integrated Solution for Intelligent Vehicle Safety*

 “Every journey’s safety begins where the tyre meets the road — let intelligence make it smarter.”

 Overview

The **Smart Tyre Condition and Puncture Detection System** is an adaptive AI-driven project that simulates tyre health monitoring through sensor data, mathematical modeling, and machine learning.
It automatically detects tyre **puncture**, **cracks**, **pressure drops**, and **flat conditions** to enhance real-time vehicle safety and predictive maintenance.

 Key Features

* 🧠 **AI Classification:** Detects tyre state — *Healthy, Punctured, Flat, or Cracked*.
* 🌡️ **Sensor Simulation:** Uses MEMS Pressure Sensor, DHT11/DHT22 Temperature Sensor, and Piezo Vibration Sensor.
* 🧮 **Mathematical Modeling:**

  * Pressure Decay → `P(t) = P₀ * e^(−k·t)`
  * Ideal Gas Law → `PV = nRT`
  * Environmental Correction → `P_eff = P_tyre − P_atm`
* 📊 **Real-Time Visualization:** Dynamic line charts of pressure and temperature trends.
* 🖥️ **Interactive Dashboard:** Displays sensor values, condition status, and alert indicators.
* 💾 **Automatic Dataset Generation:** CSV dataset with realistic sensor values and labelled conditions.

 🧩 System Workflow


Sensor Simulation → Dataset Generation → ML Training → Real-Time Visualization


 📚 Dataset Columns

| Column           | Description                         |
| ---------------- | ----------------------------------- |
| Time (s)         | Sampling time                       |
| Pressure (psi)   | Tyre pressure data                  |
| Temperature (°C) | Temperature data                    |
| Vibration        | Piezo sensor output                 |
| LeakRate         | Simulated leakage rate              |
| Condition        | {Healthy, Punctured, Flat, Cracked} |


 🧠 Machine Learning Model

* Algorithms: **Decision Tree / Random Forest / SVM**
* Framework: **MATLAB Classification Learner / Python scikit-learn**
* Output: Real-time tyre condition classification

 🌍 Environmental Adaptation

Incorporates environmental factors such as **altitude**, **ambient pressure**, and **temperature**, adjusting tyre pressure dynamically through physics-based models.

 💻 Application Interface

* Real-time graphs of Pressure and Temperature
* Tyre condition indicator:
  🟢 Healthy 🟡 Crack Detected 🔴 Flat/Punctured
* Live data simulation and adaptive alerts

 
 🧾 Summary
This project combines **AI**, **IoT**, and **mathematical modeling** to create a smart system for tyre condition detection.
It ensures **driver safety**, improves **maintenance prediction**, and supports **sustainable vehicle monitoring** through data-driven insights.

 🏁 Future Scope

* Integration with real IoT hardware (ESP32/Arduino)
* Cloud-based monitoring dashboard
* Integration with vehicle telematics systems



 **File name:** `README.md`
**Where to place:** In your project root folder — e.g.
`C:\Users\pushp\Downloads\Smart_Tyre_AI_Project\README.md`

Thank you.
