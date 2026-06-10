// barra gui

var amount = (life / life_max) * lifebar_w;
var amount_fixed = (life_max / life_max) * lifebar_w;
var x1 = 10; 
var y1 = 10; 
var x2 =  x1 + amount;
var x2_fixed =  x1 + amount_fixed;
var y2 =  y1 + lifebar_h;


if(life > 0){
    
	//background
    draw_set_color(color_2);
    draw_rectangle(x1,y1,x2_fixed,y2,false);
   
   // barra desenho
    draw_set_color(color_1);
    draw_rectangle(x1,y1,x2,y2,false);
}