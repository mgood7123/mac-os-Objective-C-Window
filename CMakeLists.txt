# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.10.2)

# Declares and names the project.

project(macOS)

macro(copyExe EXE)
    if(CMAKE_RUNTIME_OUTPUT_DIRECTORY)
        set(copyExe_IN_FILE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${EXE})
    else()
        set(copyExe_IN_FILE ${EXE})
    endif()


    set(copyExe_OUT_FILE ${CMAKE_CURRENT_BINARY_DIR}/EXECUTABLES/${EXE})


    add_custom_command(
            TARGET ${EXE}
            POST_BUILD
            COMMAND cp -v ${copyExe_IN_FILE} ${copyExe_OUT_FILE}
    )
endmacro()

add_executable(OSX_WINDOW main.m)

target_link_libraries(OSX_WINDOW "-framework Cocoa")
copyExe(OSX_WINDOW)