CXX := g++
CXXFLAGS := -std=c++11 -Wall -g  -DUSE_COLOR_TABLE

all: image_command

image_command: image_command.o JuliaSet.o MandelbrotSet.o PPM.o ColorTable.o ComplexFractal.o
	$(CXX) $(CXXFLAGS) -o $@ $^

image_command.o: image_command.cpp JuliaSet.h PPM.h ColorTable.h MandelbrotSet.h ComplexFractal.h
	$(CXX) $(CXXFLAGS) -c $<

PPM.o: PPM.cpp PPM.h
	$(CXX) $(CXXFLAGS) -c $<

JuliaSet.o: JuliaSet.cpp JuliaSet.h PPM.h ColorTable.h ComplexFractal.h
	$(CXX) $(CXXFLAGS) -c $<

MandelbrotSet.o: MandelbrotSet.cpp MandelbrotSet.h PPM.h ColorTable.h ComplexFractal.h
	$(CXX) $(CXXFLAGS) -c $<

ComplexFractal.o: ComplexFractal.cpp PPM.h ColorTable.h ComplexFractal.h
	$(CXX) $(CXXFLAGS) -c $<

ColorTable.o: ColorTable.cpp ColorTable.h
	$(CXX) $(CXXFLAGS) -c $<

clean:
	-rm -f image_command
	-rm -f *.o
	-rm -f *~
