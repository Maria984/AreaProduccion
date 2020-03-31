import controlP5.*;
PImage mapImage;

ControlP5 cp5;

Table table;

int valSlider;

int rowCount;

String[] tiempo;

//total
int[] ingresos;


int maxDato;
//tamaño de la barra
float[] ingresos_total;

int [] produccion;
int [] caldas;
int [] huila;
int [] narino;


int maxDatoPro;
int maxDatoCaldas;
int maxDatoHuila;
int maxDatoNarino;

float[] barra_produccion;
float[] barra_caldas;
float[] barra_huila;
float[] barra_narino;




//-------------------------------------------------------------------//



void setup(){

size(680,768);
mapImage = loadImage("mapa.png");
Table table = loadTable("datosInternetCompleto1.csv", "header");

rowCount= table.getRowCount();

println(rowCount + " filas en la tabla");

cp5= new ControlP5(this);

gui();

tiempo = new String [rowCount];

ingresos = new int [rowCount];

ingresos_total = new float [rowCount];

produccion = new int[rowCount];

barra_produccion = new float [rowCount];

caldas = new int[rowCount];

barra_caldas = new float [rowCount];

huila = new int[rowCount];

barra_huila = new float [rowCount];

narino = new int[rowCount];

barra_narino = new float [rowCount];

//produccion = new float [rowCount];

for (int i =0; i<rowCount; i++)
{
  TableRow row = table.getRow(i);
  
  tiempo[i] = row.getString("tiempo");
  
  ingresos[i] = row.getInt("ganancias");
  
 
  produccion[i] = row.getInt("produccion");
  
  caldas[i] = row.getInt("caldas");
  
  huila[i] = row.getInt("huila");
  
  narino[i] = row.getInt("narino");
 // produccion[i] = row.getFloat("produccion");
 
    if(ingresos[i] > maxDato) 
    {
      maxDato =  ingresos[i];
     
    }
    
    if(produccion[i] > maxDatoPro) 
    {
      maxDatoPro =  produccion[i];
     
    }
    if(caldas[i] > maxDatoCaldas) 
    {
      maxDatoCaldas =  caldas[i];
     
    }
    if(huila[i] > maxDatoHuila) 
    {
      maxDatoHuila =  huila[i];
     
    }
    if(narino[i] > maxDatoNarino) 
    {
      maxDatoNarino =  narino[i];
     
    }
}

}

//-------------------------------------------------------------------//

void draw()
{

  background (0);
  image(mapImage, 110, 15,345, 469);
  drawPorcentaje();
  

}

//------------------------------------------------------------------//

void gui(){

//slider
    //"valSlider" es el nombre del controlador 
    cp5.addSlider("valSlider")
     .setPosition(31,500)
     .setWidth(550)
     //se asigna en una variable las divisiones 0-13 dependiendo el numero de filas
     .setRange(0,rowCount-1)
     //Donde empieza el controlador 10= empieza en la division 10
     .setValue(0)
     //se asigna el numero de las divisiones que va a tener el slider de 0 -13 segun el rowCount
     .setNumberOfTickMarks(rowCount)
     //flexible y fix son formas de visualisar
     .setSliderMode(Slider.FLEXIBLE)
     ;
     // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
}

//-------------------------------------------------------------------------------//


void drawPorcentaje()
{

  textSize(10);
  fill(255);
  
  for (int i =0; i< rowCount; i++)
  {
  
    float x = map(i, 0, rowCount-1, 31, 581);
    
    pushMatrix();
    translate(x,520);
    rotate(PI/2);
    text(tiempo[i], 0, 0);
    popMatrix();
    
  
  }
  
   //tercero
   textSize(16);    
    fill(#c62d33);
    text(ingresos[valSlider]+" Área de cultivo Antioquia",31,580);
    
        //cuarto
    fill(#6aa842);
    text(produccion[valSlider]+" Área de cultivo Boyacá",31,610);
    
    fill(#815d9f);
    text(caldas[valSlider]+" Área de cultivo Caldas",31,640);
    
    fill(#009de0);
    text(huila[valSlider]+" Área de cultivo Huila",31,670);
    
    fill(#dc911b);
    text(narino[valSlider]+" Área de cultivo Nariño",31,700);
    
    
        //tercero    
    
    for(int i = 0; i < rowCount; i++)
    {
      ingresos_total[i] = map(ingresos[i], 0, maxDato, 0, 40);
      
      //cuarto      
      barra_produccion[i] = map(produccion[i], 0, maxDatoPro, 0, 40);
      
      barra_caldas[i] = map(caldas[i], 0, maxDatoCaldas, 0, 40);
      
      barra_huila[i] = map(huila[i], 0, maxDatoHuila, 0, 40);
      
      barra_narino[i] = map(narino[i], 0, maxDatoNarino, 0, 40);
      
 
    }
    
    
    //tercero
    //Color de la barra ingresoss
    fill(#c62d33);
    ellipse(213,172,ingresos_total[valSlider],ingresos_total[valSlider]);
    fill(#6aa842);
    ellipse(282,203,barra_produccion[valSlider],barra_produccion[valSlider]);
    fill(#815d9f);
    ellipse(218,208,barra_caldas[valSlider],barra_caldas[valSlider]);
    fill(#009de0);
    ellipse(213,280,barra_huila[valSlider],barra_huila[valSlider]);
    fill(#dc911b);
    ellipse(142,316,barra_narino[valSlider],barra_narino[valSlider]);
    //rect(10,395,ingresos_total[valSlider],30);
    //fill(255);
    //text(barraTotal[valSlider]+" total suscriptores",420,250);
    
      //cuarto
      //color barra produccion
    //fill(203,6,178);
    //rect(10, 440, barra_produccion[valSlider], 30);  
    //fill(255);
    //text(barraFijo[valSlider]+" fijo",420,280);

}
