FCS Simulator

This project is a tank Fire Control System simulator developed in C++ and Qt 6. The system leverages the Apple ecosystem to simulate operational tank environments and local network connectivity.

The MacBook serves as the central management cabinet running the Multi-Function Display Unit GUI, processing object tracking, and rendering a tactical map. The iPhone functions as the turret and observation pod, utilizing its cameras for day, night, and thermal vision simulations, LiDAR for distance measurement, motion sensors for line of sight stabilization, and haptics for firing feedback. The iPad acts as a commander display for touch-based target designation. The Apple Watch provides haptic alerts, monitors operator heart rate, and uses gesture recognition for lasing. AirPods simulate an intercom system and provide spatial audio for directional threats. All devices are synchronized via Apple local network connectivity.
