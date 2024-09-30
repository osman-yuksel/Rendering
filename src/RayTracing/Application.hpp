#pragma once

#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"
#include <stdio.h>
#include <iostream>
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <iostream>

namespace RayTracing {
class Application {
   public:
    Application();
    ~Application();

    void run();
    void render();
    void update();
    void initialize();

   private:
    GLFWwindow *window;
    ImGuiIO *io;
    ImGuiContext *context;
    ImVec4 clear_color;

    // Add new member variables
    GLuint shaderProgram;
    GLuint VAO, VBO;
    GLint rotationLoc;

    // Add new member functions
    GLuint createShader(GLenum type, const char *source);
    void setupTriangle();
};

}  // namespace RayTracing