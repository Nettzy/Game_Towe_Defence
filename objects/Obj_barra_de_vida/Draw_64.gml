if (!instance_exists(obj_interacao)) exit;

// Pega a vida da base
var _life = obj_interacao.life;
var _life_max = obj_interacao.life_max;
var amount = (_life / _life_max) * lifebar_w;
var amount_fixed = lifebar_w;
var x1 = 10;
var y1 = 10;
var x2 = x1 + amount;
var x2_fixed = x1 + amount_fixed;
var y2 = y1 + lifebar_h;

if (_life > 0)
{
    // Fundo
    draw_set_color(color_2);
    draw_rectangle(x1, y1, x2_fixed, y2, false);
    
    // Barra de vida
    draw_set_color(color_1);
    draw_rectangle(x1, y1, x2, y2, false);
}