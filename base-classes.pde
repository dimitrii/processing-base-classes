interface IBaseObject {
  void destroy();
}

class BaseObject implements IBaseObject {
  void destroy() {
  }
}

interface IInputObject {
  void mouseClicked();
  void keyPressed();
  void keyReleased();
}

class InputObject extends BaseObject implements IInputObject {
  InputObject() {
    super();
    processingEvents.addInputObject(this);
  }
  void mouseClicked() {}
  void keyPressed()   {}
  void keyReleased()  {}
  void destroy() {
    super.destroy();
    processingEvents.removeInputObject(this);
  }
}

interface IRenderedObject {
  void drawStart();
  void drawMiddle();
  void drawEnd();
}

class RenderedObject extends InputObject implements IRenderedObject{
  RenderedObject() {
    processingEvents.addRenderedObject(this);
  }
  void drawStart()  {}
  void drawMiddle() {}
  void drawEnd()    {}
  void destroy() {
    super.destroy();
    processingEvents.removeRenderedObject(this);
  }
}


public static class processingEvents {

  // ===== INPUT ======

 // Keyboard
 private static ArrayList<InputObject> keyPressed  = new ArrayList<InputObject>();
 private static ArrayList<InputObject> keyReleased = new ArrayList<InputObject>();

 public static void addInputObject(InputObject o) {
  addToKeyPressed(o);
  addToKeyReleased(o);
  addToMouseClicked(o);
 }

 public static void removeInputObject(InputObject o) {
  removeFromKeyPressed(o);
  removeFromKeyReleased(o);
  removeFromMouseClicked(o);
 }
 public static void addToKeyPressed(InputObject o ) {
   keyPressed.add(o);
 }
 public static void addToKeyReleased(InputObject o ) {
   keyReleased.add(o);
 }
 public static void removeFromKeyPressed(InputObject o ) {
   keyPressed.remove(o);
 }
 public static void removeFromKeyReleased(InputObject o ) {
   keyReleased.remove(o);
 }
 public static void triggerKeyPressed() {
   // List is copied becuause if during the keyPressed event a new listener is added to
   // the ArrayList keyPressed Java will throw an error because it is interating over
   // that list
   ArrayList<InputObject> newList = new ArrayList<InputObject>(keyPressed);

   for(InputObject o :newList) {
     o.keyPressed();
   }
 }

 public static void triggerKeyReleased() {

   ArrayList<InputObject> newList = new ArrayList<InputObject>(keyReleased);

   for(InputObject o :newList) {
     o.keyReleased();
   }
 }

 // Mouse
 private static ArrayList<InputObject> mouseClicked = new ArrayList<InputObject>();

 public static void addToMouseClicked(InputObject o ) {
   mouseClicked.add(o);
 }
 public static void removeFromMouseClicked(InputObject o ) {
   mouseClicked.remove(o);
 }
 public static void triggerMouseClicked() {

   ArrayList<InputObject> newList = new ArrayList<InputObject>(mouseClicked);

   for(InputObject o :newList) {
     o.mouseClicked();
   }
 }

 // ===== Renderer ======

 // Draw
 private static ArrayList<RenderedObject> drawStart  = new ArrayList<RenderedObject>();
 private static ArrayList<RenderedObject> drawMiddle = new ArrayList<RenderedObject>();
 private static ArrayList<RenderedObject> drawEnd    = new ArrayList<RenderedObject>();

 // Add
 public static void addRenderedObject(RenderedObject o) {
   addToDrawStart(o);
   addToDrawMiddle(o);
   addToDrawEnd(o);
 }
 public static void addToDrawStart(RenderedObject o ) {
   drawStart.add(o);
 }
 public static void addToDrawMiddle(RenderedObject o ) {
   drawMiddle.add(o);
 }
 public static void addToDrawEnd(RenderedObject o ) {
   drawEnd.add(o);
 }

 // Remove
 public static void removeRenderedObject(RenderedObject o) {
   removeFromDrawStart(o);
   removeFromDrawMiddle(o);
   removeFromDrawEnd(o);
 }
 public static void removeFromDrawStart(RenderedObject o ) {
   drawStart.remove(o);
 }
 public static void removeFromDrawMiddle(RenderedObject o ) {
   drawMiddle.remove(o);
 }
 public static void removeFromDrawEnd(RenderedObject o ) {
   drawEnd.remove(o);
 }

 // trigger
 public static void triggerDrawStart() {

   ArrayList<RenderedObject> newList = new ArrayList<RenderedObject>(drawStart);

   for(RenderedObject o :newList) {
     o.drawStart();
   }
 }
 public static void triggerDrawMiddle() {

   ArrayList<RenderedObject> newList = new ArrayList<RenderedObject>(drawMiddle);

   for(RenderedObject o :newList) {
     o.drawMiddle();
   }
 }
 public static void triggerDrawEnd() {

   ArrayList<RenderedObject> newList = new ArrayList<RenderedObject>(drawEnd);

   for(RenderedObject o :newList) {
     o.drawEnd();
   }
 }
}
