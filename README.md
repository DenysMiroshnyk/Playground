# 🧩 Playground

A sandbox for chaotic C++ experiments.

Each folder in `/experiments` is a self-contained mini-project exploring
a different concept

Built with:
- C++20
- CMake + Conan

## 🚀 Getting Started (Dev Container)

1. Clone this repo.
2. Open it in **VS Code**.
3. When prompted, *"Reopen in Container"* — it will use the `.devcontainer` setup.
---
### 000_env_check:
   This is not exactly an experiment, just something to check if devenvironment works.  
   Simple setup that requires conan and cmake that container should have installed:   
   get catch2 conan packeage and run goofy test at the end.  

### 001_glfw_window_in_container:
   This experiment is an attempt to call a gui application from docker container.  
   For this I've used [VcXsrv](https://sourceforge.net/projects/vcxsrv/). To try it out, this should display two googly eyes:  
   ```bash 
   sudo apt update && sudo apt install -y x11-apps 
   xeyes
   ```
   Open window application that is compiled form [001_glfw_window_in_container](experiments/001_glfw_window_in_container) should display generic window for you.  