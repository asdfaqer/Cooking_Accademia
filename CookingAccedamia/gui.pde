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
int i = 0;
int step_num = 0;
 //_CODE_:time:476537:
public void recipe_complete(){
  background(0);
  task_recipe_completion.setText("recipe COMPLETED");
}
public void task_complete(){
  background(0);
  task_recipe_completion.setText("TASK COMPLETED");
  frame = 0;
}

synchronized public void recipe_Window(PApplet appc, GWinData data) { //_CODE_:recipe:431125:
  appc.background(230);
}
synchronized public void win_draw4(PApplet appc, GWinData data) { //_CODE_:window1:431125:
  fill(0);
  square(100,100,100);
  appc.background(230);
} //_CODE_:recipe:431125:

//_CODE_:Music:895587:
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
ArrayList <Integer> quantities_values = new ArrayList<Integer>();
ArrayList <String> grams = new ArrayList<String>(Arrays.asList("Salt","Pepper","Flour","Sugar"));
ArrayList <String> no_units = new ArrayList<String>(Arrays.asList("Sausages"));
ArrayList <String> mili_letres = new ArrayList<String>(Arrays.asList("Olive oil", "Vegetable oil"));
public void change_quantities(GCustomSlider source, GEvent event){
  int current_slider_location;
  Recipe.background(230);
  quantities_values.clear();
  for( int j = 0; j <= i; j++){
    if(grams.contains(ingredients_selected.get(j))){
      println("ok");
      current_slider_location = ingredient_quantities.get(j).getValueI();
      ingredient_quantities.get(j).setLimits(current_slider_location,10,500);
      quantities_values.add(ingredient_quantities.get(j).getValueI());
      quantities_label.get(j).setText(quantities_values.get(j) + " g");
    }
    else if(no_units.contains(ingredients_selected.get(j))){
      current_slider_location = ingredient_quantities.get(j).getValueI();
      ingredient_quantities.get(j).setLimits(current_slider_location,0,10);
      quantities_values.add(ingredient_quantities.get(j).getValueI());
      quantities_label.get(j).setText(str(quantities_values.get(j)));
    }
    else if(mili_letres.contains(ingredients_selected.get(j))){
      current_slider_location = ingredient_quantities.get(j).getValueI();
      ingredient_quantities.get(j).setLimits(current_slider_location,0,500);
      quantities_values.add(ingredient_quantities.get(j).getValueI());
      quantities_label.get(j).setText(quantities_values.get(j) + " mL");
    }
  }
  println(quantities_values);
}

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:254614:
  i++;
  Recipe.background(230);
  dropLists.add(new GDropList(Recipe, 29, 60+ 40*i, 90, 80, 3, 10));
  dropLists.get(i).setItems(loadStrings("list_374668"), 0);
  dropLists.get(i).addEventHandler(this, "dropList1_click1");
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  quantities_label.add(new GLabel(Recipe, 120, 40 + 40* i, 100, 50));
  quantities_label.get(i).setText("N/A");
  ingredient_quantities.add(new GCustomSlider(Recipe, 120, 60 + 40*i, 100, 40, "grey_blue"));
  ingredient_quantities.get(i).setLimits(0.0, 10.0, 500.0);
  ingredient_quantities.get(i).setNumberFormat(G4P.DECIMAL, 2);
  ingredient_quantities.get(i).setOpaque(false);
  ingredient_quantities.get(i).addEventHandler(this, "change_quantities");
} //_CODE_:button1:254614:
public void generating_recipes(GButton source, GEvent event){
  Recipe.background(230);
  boolean recipe_found = false;
  if(ingredients_selected.contains("Select Ingredients")){
    recipe_selected.setText("sorry, but you need to finish your selection");
    return;
  }
  int num_of_recipes = 1;
  for(int i = 0; i < num_of_recipes; i++){
    if(cooked_sausages.criteria_meet() && !recipe_found){
      recipe_selected.setText("Generated reciepe: sausages");
      String[] instruction_list = loadStrings("sausages.txt");
      for(int j = 0; j < instruction_list.length; j++){
        instructions.add(instruction_list[j]);
      }
      print(instructions);
      step_num = 1;
      used_ingredients.addAll(cooked_sausages.using_ingredients());
      recipe_found = true;
    }
  }
  if(!recipe_found){
    recipe_selected.setText("sorry, but there are no matchs found");
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
  
  //recipe generater window
  
  Recipe = GWindow.getWindow(this, "Recipe", 800, 200, 800, 400, JAVA2D);
  Recipe.noLoop();
  Recipe.setActionOnClose(G4P.KEEP_OPEN);
  Recipe.addDrawHandler(this, "Recipe_Window");
  dropLists.add(new GDropList(Recipe, 29, 60, 90, 80, 3, 10));
  dropLists.get(0).setItems(loadStrings("list_374668"), 0);
  dropLists.get(0).addEventHandler(this, "dropList1_click1");
  add_ingredient = new GButton(Recipe, 190, 300, 80, 30);
  add_ingredient.setText("add ingerdient");
  add_ingredient.addEventHandler(this, "button1_click1");
  generate_recipes = new GButton(Recipe, 500, 300, 80, 30);
  generate_recipes.setText("generate recipes");
  generate_recipes.addEventHandler(this, "generating_recipes");
  ingredient_quantities.add(new GCustomSlider(Recipe, 120, 60, 100, 40, "grey_blue"));
  ingredient_quantities.get(0).setLimits(0.0, 10.0, 500.0);
  ingredient_quantities.get(0).setNumberFormat(G4P.DECIMAL, 2);
  ingredient_quantities.get(0).setOpaque(false);
  ingredient_quantities.get(0).addEventHandler(this, "change_quantities");
  quantities_label.add(new GLabel(Recipe, 120, 40, 100, 50, "N/A"));
  recipe_selected = new GLabel(Recipe, 126, 222, 300, 100);
  recipe_selected.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  recipe_selected.setOpaque(false);
  
  //Music window
  
  Music = GWindow.getWindow(this, "Music", 0, 200, 300, 300, JAVA2D);
  Music.noLoop();
  Music.setActionOnClose(G4P.KEEP_OPEN);
  Music.addDrawHandler(this, "Music_Window");
  
  play_button_music = new GButton(Music, 50, 240, 80, 30);
  play_button_music.setText("play");
  play_button_music.addEventHandler(this, "play_music");
  pause_button_music = new GButton(Music, 175, 240, 80, 30);
  pause_button_music.setText("pause");
  pause_button_music.addEventHandler(this, "pause_music");
  volume = new GCustomSlider(Music, 110, 215, 80, 30);
  
  volume.setLimits(0.5, 0.0, 1.0);
  volume.setNumberFormat(G4P.DECIMAL, 2);
  volume.setOpaque(false);
  volume.addEventHandler(this,"change_volume");
  
  volume_label = new GLabel(Music, 128, 199, 60, 40);
  //volume_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  volume_label.setText("Volume");
  volume_label.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  volume_label.setOpaque(false);
  
  Recipe.loop();
  Music.loop();
}

// Variable declarations 
// autogenerated do not edit
GLabel recipe_selected;
GKnob Temp; 
GButton play_button_music;
GButton pause_button_music;
GCustomSlider volume;
GLabel ovenstemp; 
GKnob time; 
GLabel timelabel; 
GWindow Recipe;
ArrayList<GDropList> dropLists = new ArrayList<GDropList>();
ArrayList<GCustomSlider> ingredient_quantities = new ArrayList<GCustomSlider>();
ArrayList<GLabel> quantities_label = new ArrayList<GLabel>();
GCustomSlider oventemp; 
GLabel Ovenslabel; 
GWindow Music;
GButton add_ingredient;
GButton generate_recipes;
GLabel volume_label;
