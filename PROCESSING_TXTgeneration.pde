/**
 * LAURE COHEN
 * HEAR.FR - Communication graphique
 */

/*
fichier test.json (simplifié) : 
 
 { "noms": [
 {"mot": "acné",
 "feminin": 1 },
 {"mot": "ail",
 "masculin": 1 } ],
 "adjectifs":[
 {"racine": "acide",
 "masculin": "" ,
 "feminin": "" },
 {"racine": "accentué",
 "feminin": "e" },
 {"racine": "éclairci",
 "feminin": "e" } ]
 }*/

PFont maFonte;
JSONObject vocabulaire;
int nbMots = 2;
String maPhrase;

void setup() {
  size(800, 600);
  background(255);

  loadData();

  maFonte = createFont("Apercu-Mono", 15);
  textFont(maFonte);
  textAlign(CORNER, CENTER);
}

void loadData() {
  vocabulaire      = loadJSONObject("test.json");

  JSONArray noms      = vocabulaire.getJSONArray("noms");
  JSONArray adjectifs = vocabulaire.getJSONArray("adjectifs");

  // affiche les noms
  // on parcours le tableau des noms
  for (int i=0; i<noms.size(); i++) {
    // pour chaque nom trouvé, on créé un objet JSON temporaire
    JSONObject nom = noms.getJSONObject(i);
    
    // on récupère le mot
    String txt = nom.getString("mot");
    
    fill(0);
    text(txt, 20, 20*i+20, 700, 400);
  }
  
  // affiche les adjectifs
  for (int i=0; i<adjectifs.size(); i++) {
    
    JSONObject adjectif = adjectifs.getJSONObject(i);
    
    // on récupere la racine
    String txt = adjectif.getString("racine");
    
    fill(0);
    text(txt, 100, 20*i+20, 700, 400);
  }
}

