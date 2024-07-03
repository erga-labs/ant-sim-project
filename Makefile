
CXXFLAGS = -O1
EMFLAGS = -s USE_GLFW=3 --preload-file assets
INCLUDES = -I . -I external/
LDFLAGS  = -L external/raylib -lraylib


SOURCES = $(wildcard src/*.cpp)
OBJECTS = $(SOURCES:.cpp=.o)


emscripten-build: main.cpp $(OBJECTS)
	em++ -o emscripten-build.html $^ $(CXXFLAGS) $(EMFLAGS) $(INCLUDES) $(LDFLAGS)


%.o: %.cpp
	em++ -o $@ -c $< $(CXXFLAGS) $(INCLUDES)


clean:
	rm -f $(wildcard src/*.o)
	rm -f emscripten-build.html
	rm -f emscripten-build.js
	rm -f emscripten-build.wasm
	rm -f emscripten-build.data
