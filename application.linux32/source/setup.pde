/**
 *     DOUBLE BLACK DIAMOND        DOUBLE BLACK DIAMOND
 *
 *         //\\   //\\                 //\\   //\\  
 *        ///\\\ ///\\\               ///\\\ ///\\\
 *        \\\/// \\\///               \\\/// \\\///
 *         \\//   \\//                 \\//   \\//
 *
 *        EXPERTS ONLY!!              EXPERTS ONLY!!
 *
 * This implements the standard `setup` and `draw` methods of a 
 * Processing sketch. It instantiates LEDome model and the sets
 * up the DDP output to the NDB. This file should only be changed 
 * by people who know what their doing.
 */
 
import java.awt.Dimension;
import java.awt.Toolkit;
 
Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
final int VIEWPORT_WIDTH = (int)screenSize.getWidth();;
final int VIEWPORT_HEIGHT = (int)screenSize.getHeight();


LEDome model;
P2LX lx;
WB_Render render;
LEDomeOutputManager output_manager;

/*
 * Setup methods. Sets stuff up.
 */
void setup() {
  size(VIEWPORT_WIDTH, VIEWPORT_HEIGHT, OPENGL);
  frame.setResizable(true);
  noSmooth();
  textSize(6);
  
  // Create LEDome instance
  model = new LEDome();  
  // Create the P2LX engine
  lx = new P2LX(this, model);    
  // Create the NDB output manager
  output_manager = new LEDomeOutputManager(lx);
  
  setupPatterns();  
  setupEffects();
  setupUI();  
  
  render = new WB_Render(this);  
}

void setupPatterns() {
  lx.setPatterns(patterns(lx));
}

void setupEffects() {
  lx.addEffects(effects(lx));  
}

void setupUI() {
  lx.ui.addLayer(
    // A camera layer makes an OpenGL layer that we can easily 
    // pivot around with the mouse
    new UI3dContext(lx.ui) {
      protected void beforeDraw(UI ui, PGraphics pg) {
        // Let's add lighting and depth-testing to our 3-D simulation
        pointLight(0, 0, 40, model.cx, model.cy, -20*FEET);
        pointLight(0, 0, 50, model.cx, model.yMax + 10*FEET, model.cz);
        pointLight(0, 0, 20, model.cx, model.yMin - 10*FEET, model.cz);
        hint(ENABLE_DEPTH_TEST);
      }
      protected void afterDraw(UI ui, PGraphics pg) {
        // Turn off the lights and kill depth testing before the 2D layers
        noLights();
        hint(DISABLE_DEPTH_TEST);
      } 
    }
  
    // Let's look at the center of our model
    .setCenter(model.cx, model.cy, model.cz)
  
    // Let's position our eye some distance away
    .setRadius(22*FEET)
    
    // And look at it from a bit of an angle
    .setTheta(PI/24)
    .setPhi(PI/24)
    
    .setRotationVelocity(12*PI)
    .setRotationAcceleration(3*PI)
    
    // Let's add a point cloud of our animation points
    .addComponent(new UIPointCloud(lx, model).setPointSize(3))
    
    .addComponent(new UIDome())
  );
  
  // A basic built-in 2-D control for a channel
  lx.ui.addLayer(new UIChannelControl(lx.ui, lx.engine.getDefaultChannel(), 4, 4));  
  lx.ui.addLayer(new LEDomeNDBOutputControl(lx.ui, 4, 326));
  lx.ui.addLayer(new UIEffectsControl(lx.ui, lx, width-144, 4));
}

void draw() {
  background(#292929);  
}

void mousePressed() {
  println("mouseX:" + mouseX + ", mouseY: " + mouseY);  
}
