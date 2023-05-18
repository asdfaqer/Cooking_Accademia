/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */
<<<<<<< Updated upstream
int i = 0;
int step_num = 0;
 //_CODE_:time:476537:
void receipe_complete(){
  background(0);
  task_receipe_completion.setText("RECEIPE COMPLETED");
}
void task_complete(){
  background(0);
  task_receipe_completion.setText("TASK COMPLETED");
}
synchronized public void Receipe_Window(PApplet appc, GWinData data) { //_CODE_:Receipe:431125:
=======

synchronized public void win_draw4(PApplet appc, GWinData data) { //_CODE_:window1:431125:
  fill(0);
  square(100,100,100);
>>>>>>> Stashed changes
  appc.background(230);
} //_CODE_:Receipe:431125:

<<<<<<< Updated upstream
synchronized public void Music_Window(PApplet appc, GWinData data) { //_CODE_:Music:895587:
=======
public void slider1_change1(GSlider source, GEvent event) { //_CODE_:slider1:301836:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider1:301836:

public void slider1_change2(GSlider source, GEvent event) { //_CODE_:slider1:230742:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider1:230742:

public void slider2_change1(GSlider source, GEvent event) { //_CODE_:slider2:662791:
  println("slider2 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:slider2:662791:

synchronized public void win_draw5(PApplet appc, GWinData data) { //_CODE_:window2:895587:
>>>>>>> Stashed changes
  appc.background(230);
  appc.image(songImage, 250, 0);
} //_CODE_:Music:895587:

ArrayList<String> ingredients_selected = new ArrayList<String>();
public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:dropList1:693695:
  if (ingredients_selected.contains(source.getSelectedText())){
    println("ingredient already selected");
  }
  ingredients_selected.clear();
  for( int j = 0; j <= i; j++){
    ingredients_selected.add(dropLists.get(j).getSelectedText());
  }
  println(ingredients_selected);
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());

} //_CODE_:dropList1:693695:
ArrayList<Float> quantities_values = new ArrayList<Float>();

public void change_quantities(GCustomSlider source, GEvent event){
  quantities_values.clear();
  for( int j = 0; j <= i; j++){
    quantities_values.add(ingredient_quantities.get(j).getValueF());
  }
  println(quantities_values);
}

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:254614:
  i++;
  dropLists.add(new GDropList(Receipe, 29, 60+ 40*i, 90, 80, 3, 10));
  dropLists.get(i).setItems(loadStrings("list_374668"), 0);
  dropLists.get(i).addEventHandler(this, "dropList1_click1");
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  
  ingredient_quantities.add(new GCustomSlider(Receipe, 120, 60 + 40*i, 100, 40, "grey_blue"));
  ingredient_quantities.get(i).setLimits(0.0, 10.0, 100.0);
  ingredient_quantities.get(i).setNumberFormat(G4P.DECIMAL, 2);
  ingredient_quantities.get(i).setOpaque(false);
  ingredient_quantities.get(i).addEventHandler(this, "change_quantities");
} //_CODE_:button1:254614:

public void generating_receipes(GButton source, GEvent event){
  if(ingredients_selected.contains("Select Ingredients")){
    receipe_selected.setText("sorry, but you need to finish your selection");
    return;
  }
  if(cooked_sausages.criteria_meet()){
    receipe_selected.setText("Generated reciepe: sausages");
    String[] instruction_list = loadStrings("Receipe.txt");
    for(int i = 0; i < instruction_list.length; i++){
    instructions.add(instruction_list[i]);
    }
    step_num = 1;
  }
  else{
    receipe_selected.setText("sorry, but there are no matchs found");
    return;
  }
}

// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Main window");
<<<<<<< Updated upstream
  
  //recipe generater window
  
  Receipe = GWindow.getWindow(this, "Receipe", 800, 200, 800, 400, JAVA2D);
  Receipe.noLoop();
  Receipe.setActionOnClose(G4P.KEEP_OPEN);
  Receipe.addDrawHandler(this, "Receipe_Window");
  dropLists.add(new GDropList(Receipe, 29, 60, 90, 80, 3, 10));
  dropLists.get(0).setItems(loadStrings("list_374668"), 0);
  dropLists.get(0).addEventHandler(this, "dropList1_click1");
  add_ingredient = new GButton(Receipe, 190, 300, 80, 30);
  add_ingredient.setText("add ingerdient");
  add_ingredient.addEventHandler(this, "button1_click1");
  generate_receipes = new GButton(Receipe, 500, 300, 80, 30);
  generate_receipes.setText("generate receipes");
  generate_receipes.addEventHandler(this, "generating_receipes");
  ingredient_quantities.add(new GCustomSlider(Receipe, 120, 60, 100, 40, "grey_blue"));
  ingredient_quantities.get(0).setLimits(0.0, 10.0, 100.0);
  ingredient_quantities.get(0).setNumberFormat(G4P.DECIMAL, 2);
  ingredient_quantities.get(0).setOpaque(false);
  ingredient_quantities.get(0).addEventHandler(this, "change_quantities");
  receipe_selected = new GLabel(Receipe, 126, 222, 300, 100);
  receipe_selected.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  receipe_selected.setOpaque(false);
  
  //Music window
  
  Music = GWindow.getWindow(this, "Music", 0, 200, 800, 400, JAVA2D);
  Music.noLoop();
  Music.setActionOnClose(G4P.KEEP_OPEN);
  Music.addDrawHandler(this, "Music_Window");
  
  play_button_music = new GButton(Music, 0, 0, 80, 30);
  play_button_music.setText("play");
  play_button_music.addEventHandler(this, "play_music");
  pause_button_music = new GButton(Music, 100, 0, 80, 30);
  pause_button_music.setText("pause");
  pause_button_music.addEventHandler(this, "pause_music");
  volume = new GCustomSlider(Music, 0, 60, 80, 30);
  
  volume.setLimits(0.5, 0.0, 1.0);
  volume.setNumberFormat(G4P.DECIMAL, 2);
  volume.setOpaque(false);
  volume.addEventHandler(this,"change_volume");
  
  Receipe.loop();
  Music.loop();
=======
  window1 = GWindow.getWindow(this, "Recipe Generator", 500, 500, 1000, 250, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw4");
  slider1 = new GSlider(window1, 9, 46, 100, 40, 10.0);
  slider1.setLimits(0.5, 0.0, 1.0);
  slider1.setNumberFormat(G4P.DECIMAL, 2);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change1");
  slider1 = new GSlider(window1, 128, 44, 100, 40, 10.0);
  slider1.setLimits(0.5, 0.0, 1.0);
  slider1.setNumberFormat(G4P.DECIMAL, 2);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change2");
  label1 = new GLabel(window1, 8, 17, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("My label");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 128, 17, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("My label");
  label2.setOpaque(false);
  label3 = new GLabel(window1, 248, 13, 80, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("My label");
  label3.setOpaque(false);
  slider2 = new GSlider(window1, 249, 40, 100, 40, 10.0);
  slider2.setLimits(0.5, 0.0, 1.0);
  slider2.setNumberFormat(G4P.DECIMAL, 2);
  slider2.setOpaque(false);
  slider2.addEventHandler(this, "slider2_change1");
  window2 = GWindow.getWindow(this, "Window title", 500, 500, 240, 120, JAVA2D);
  window2.noLoop();
  window2.setActionOnClose(G4P.KEEP_OPEN);
  window2.addDrawHandler(this, "win_draw5");
  window1.loop();
  window2.loop();
>>>>>>> Stashed changes
}

// Variable declarations 
// autogenerated do not edit
<<<<<<< Updated upstream
GLabel receipe_selected;
GKnob Temp; 
GButton play_button_music;
GButton pause_button_music;
GCustomSlider volume;
GLabel ovenstemp; 
GKnob time; 
GLabel timelabel; 
GWindow Receipe;
ArrayList<GDropList> dropLists = new ArrayList<GDropList>();
ArrayList<GCustomSlider> ingredient_quantities = new ArrayList<GCustomSlider>();
GCustomSlider oventemp; 
GLabel Ovenslabel; 
GWindow Music;
GButton add_ingredient;
GButton generate_receipes;
=======
GWindow window1;
GSlider slider1; 
GSlider slider1; 
GLabel label1; 
GLabel label2; 
GLabel label3; 
GSlider slider2; 
GWindow window2;
>>>>>>> Stashed changes
