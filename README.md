# dome
`dome` is a processing sketch that controls the lights on the LEDome.

It runs in [Processing 2](https://processing.org/). 
The model of the dome is generated using [HE_Mesh](https://github.com/wblut/HE_Mesh2014) ([docs](http://hemesh.wblut.com/doxygen/annotated.html)).
The Lights are driven with Mark Slee's wonderful [LX](https://github.com/heronarts/LX) ([docs](http://heronarts.com/lx/api/index.html)) library.


# instructions
Read [this doc](https://docs.google.com/document/d/1HktYw6Iccn8L6Mi67g1NKrgROb4Vh66rQUfvT_-0xmQ/edit?usp=sharing) for more detailed examples and instructions.

# contributing
Contributions are hella encouraged.

To contribute your own light animations to this repo, you will need to:

* Install [Processing 2](https://processing.org/download) and make sure it runs.
* Fork this repo.
* Clone your version of the repo: 
  
  ```
  [dome]$~ git clone git@github.com:yourgithubname/dome.git .
  ```
* Open `dome.pde` in processing.
* Create a new tab and name the file after yourself. You can see `L8on.pde` in their already.
* Create your pattern classes in your personal file. See `TestPatterns` for a simple-ish example.
* Add your class to the list of patterns in `dome.pde`
* Select your pattern when the simulator runs.
* Rejoice!

# tools
* [HE_Mesh Docs](http://hemesh.wblut.com/doxygen/annotated.html) - Dome rendering library that enables traversal of edges/vertices/faces.
* [LX Docs](https://github.com/heronarts/LX) - Docs for the lighting engine. If you want the lights to do something cool, there's probably a tool in here to help you. 
* [PDE X](https://github.com/processing/processing-experimental) - More IDE like features for the default Processing IDE.
