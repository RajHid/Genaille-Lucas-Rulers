// Basic Sizeparameters ------------------------------
magic_1=1;

// -- Dimensions relatet ----------

Length=500; // x-Axis
Width= Length/20; // y-Axis
Heigth=6; // z-Axis


// -- Math relatet ----------
NUMSYS=10; // Numeral System Dec, HEX, Octal
ANZ_NSy=NUMSYS-1; // Number of Fields of Body, Dec> 9=10-1

// -- text relatet ----------
Lttr_Siz=3; // Basic Height of all Text
Head_Text_HP=3; // Teterms the heigh of The Head of the Rulers
BASE=ANZ_NSy*2; // determines The length of the Field
FONT="Linux Libertine Mono O:style=Mono";

// Basic Sizeparameters ====================


// Head ------------------------------

Head_Length=Lttr_Siz*Head_Text_HP; // x-Axis, Heigh of the Head of the Ruler 
Head_Width=25;// y-Axis, Width of the Ruler 
Head_Heigth=Heigth;  // z-Axis, Thickness of the Ruler

// Head ====================

// Body ------------------------------

Body_Length=(ANZ_NSy*ANZ_NSy+ANZ_NSy)/2*Lttr_Siz;  // x-Axis
Body_Width_Num=Width/2; // y-Axis width for the Numbercount
Body_Width_Tri=Width/2; // y-Axis width for the Trianglepattern
Body_Heigth=Head_Heigth; // z-Axis
Body_Split_Ratio=4; // determines the Ratio in whitch the width gets split betweeen the number column and the column whit the Triangles


// Body ====================

// Foot ------------------------------

Foot_Length=Lttr_Siz*2;  // x-Axis
Foot_Width=1; // y-Axis
Foot_Heigth=Head_Heigth; // z-Axis

// Foot ====================

/*length=1000; //x Axis
width=20; //y Axis
heigth=8; //z Axis*/

// Grid ------------------------------
Whide=Lttr_Siz/3;

// Grid ====================

RULER ();
module RULER (){
    union(){
    HEAD();
        translate([Head_Length,Width/Body_Split_Ratio*3,0]){
        BODY_NUM();
        }
        translate([Head_Length,0,0]){
        BODY_TRIA();
        }
        translate([Head_Length+Body_Length,0,0]){
            FOOT();
        }
    }
}

module HEAD(){
    color("Blue", 1.0){
        difference(){
            cube([Head_Length,Width,10]);
        }
    }
}

module BODY_NUM(){
    color("Gold", 1.0){
        difference(){
            cube([Body_Length,Width/Body_Split_Ratio,10]);
            rotate([0,0,90]){
                TESTING();
            }
        }
    }
}

module BODY_TRIA(){
    color("Khaki", 1.0){
        difference(){
            cube([Body_Length,Width/Body_Split_Ratio*3,10]);
         
        }
    }
}

module FOOT(){
    color("Green", 1.0){
        difference(){
            cube([Foot_Length,Width,10]);
        }
    }
}    

// Stencils ------------------------------
Stenc_Heigth=Heigth/6;
// -- Head ------------------------------

module Stenc_Head(){
    color("Pink", 1.0){
        }
    }
// ---- Text ------------------------------

TESTING();
module TESTING(){
    //Len=1;
    Whd=Width/Body_Split_Ratio;
    //hilf=1;
    translate([0,0,10]){
        Stepp=Lttr_Siz*2;
        for(i=[1:9]){
            translate([0,-Stepp*(i-1),0]){
                echo("Stepp_0", Stepp);
                union(){
                    Stenc_Head_Text(i);
                    #Stenc_Body_Num(i,Whd);
                }
            }
            Stepp=Stepp*i/2;
                echo("Stepp_1", Stepp);
        }
    }
    } // Just for easy dirty Testing


module Stenc_Head_Text(END){
    valign =  "center"; // Vertical Alignment
    halign =  "center"; // Horizontal Alignment
    
    color("PaleVioletRed", 1.0){
        for(i=[1:END]){
            translate([Width/(Body_Split_Ratio*2),-i*Lttr_Siz*2+Lttr_Siz,0]){
            linear_extrude(height = 0.5, center = true, convexity = 10, twist = -fanrot, slices = 20, scale = 1.0) {
                text(str(i), 
                font =FONT, // Liberation Sans 
                size = Lttr_Siz ,
                halign="center",
                valign="center");
                }
            }
        }
    }
}
// == Head ====================

// -- Body ------------------------------

module Stenc_Body_Num(Len,Whd){
    DIM=Lttr_Siz*2;
    //Whd;
    for(i=[1:Len]){
        translate([0,-DIM*i,0]){
        cube([Width/Body_Split_Ratio,DIM,Stenc_Heigth]);
        }
    }
    }

// ---- Text ------------------------------

// == Body ====================

// -- Foot ------------------------------

// ---- Text ------------------------------

// == Foot ====================

/*



// Head old ------------------------------
Base_length=length/45;
Base_width=width/2;
Base_heigth=heigth/4;

length_head=Base_length*3; //x Axis
width_head=20; //y Axis
heigth_head=5; //z Axis
echo("Base_length",Base_length);


Ruler_Base();
module Ruler_Base(){
    difference(){
        cube([length,width,heigth],center=false);
        translate([0,0,heigth-heigth/4]){
            Stencil_Head();
            Stencil_Numb();
            }
        }
    }


// Stencils ------------------------------
module Stencil_Numb(){
    Transl_Stenc=0;
    for(i=[0:8]){
        echo("i from Stencil_Numb", i);        
        echo("Transl_Stenc",Transl_Stenc);
        translate([Transl_Stenc*i/2+Base_length*3,0,i*1]){
            #cube([Base_length*(i+1),width/2,heigth/4],center=false);
            translate([0,0,i*20]){
                #Text();
            }
        }
        Transl_Stenc=Base_length*i+Transl_Stenc*i+Base_length;
                echo("Transl_Stenc_K",Transl_Stenc);
    }
}

Stencil_Head();
module Stencil_Head(){
    cube([Base_length*3,width,heigth/4],center=false);
    Text();
    } 

module Stencil_Triangle(){
    
    }

// Text ------------------------------
//Text();
module Text(){
text = "Index";
 font = "Liberation Sans";
 
 valign = [
   //[  0, "top"],
   [ 0, "center"],
   //[ 75, "baseline"],
   //[110, "bottom"]
 ];

 halign = [
   //[10, "left"],
   [0, "center"],
   //[90, "right"]
 ];
    
 for (a = valign) {
   rotate([0,0,90]){
         translate([width/2,0 - a[0]-(Base_length*3)/2,-1 ]) {
         color("red") cube([135, 1, 0.1]);
         color("blue") cube([1, 20, 0.1]);
         linear_extrude(height = Base_heigth) {
            text(text = str(text), 
             font = font, 
             size = Base_length/4.7 ,
             halign=a[1], 
             valign =a[1] );
         }
       }
     }
    }
}

//Numbers

numbering(9);
module numbering(Size){
    End=Size;
    font = "Liberation Sans";
    valign = [
        //[  0, "top"],
        [ 0, "center"],
        //[ 75, "baseline"],
        //[110, "bottom"]
    ];
    for(a=[0:End]){
        translate([0,-a*Base_length/4.7,0]){
    text(text = str(a), 
             font = font, 
             size = Base_length/4.7 ,
             halign=a[1], 
             valign =a[1] );
        }
    }
}
// Text ====================

// Strencils ====================
  
 // Helpers  
/*

// Numbers ------------------------------

Number of rows for Numbers on ruler 45
--> 5 Rows for Head == 50 Rows
// Numbers ====================
 
// code snipets ------------------------------

cube([length,width,heigth]);    
length
width
heigth

// code snipets ====================



*/