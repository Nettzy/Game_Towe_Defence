var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

draw_set_font(Font1);

var _padding  = 32;
var _lin_h    = 80;   // ← mais espaço entre itens
var _titulo_h = 48;   // ← título um pouco maior
var _rodape_h = 36;
var _largura  = _gw - 128;
var _altura   = _titulo_h + (loja_total * _lin_h) + _rodape_h + (_padding * 2);
var _bx       = 36;
var _by       = _gh - _altura - 75;

draw_rectangle_colour(_bx, _by, _bx + _largura, _by + _altura,
                      c_black, c_black, c_black, c_black, false);

draw_set_color(c_white);
draw_rectangle(_bx, _by, _bx + _largura, _by + _altura, true);

//  Título 
draw_set_color(c_yellow);
draw_text(_bx + _padding, _by + _padding, "Loja da Lojista");

draw_set_color(make_color_rgb(80, 80, 80));
draw_line(_bx + 4, _by + _padding + _titulo_h,
          _bx + _largura - 4, _by + _padding + _titulo_h);

// Ouro do player 
draw_set_color(c_yellow);
draw_text(_bx + _largura - _padding - 120, _by + _padding,
          "Ouro: " + string(global.ouro));

//  Itens
for (var _i = 0; _i < loja_total; _i++)
{
    var _ty = _by + _padding + _titulo_h + 8 + (_i * _lin_h);
    var _tx = _bx + _padding;

    var _nome  = loja_itens[_i][0];
    var _desc  = loja_itens[_i][1];
    var _custo = loja_itens[_i][2];

    if _i == loja_opcao
    {
      draw_set_alpha(0.22);
        draw_set_color(c_yellow);
        draw_rectangle(_bx + 2, _ty, _bx + _largura - 2, _ty + _lin_h - 1, false);
        draw_set_alpha(1);

        draw_set_color(c_yellow);
        draw_text(_tx, _ty + 8, "> " + _nome);
    }
    else
    {
        draw_set_color(c_white);
        draw_text(_tx + 16, _ty, _nome);
    }

    // Descrição em cinza
    draw_set_color(make_color_rgb(180, 180, 180));
    draw_text_ext(_tx + 16, _ty + 20, _desc, -1, _largura - _padding * 2 - 120);

    // Custo alinhado à direita
    var _pode = (global.ouro >= _custo);
    draw_set_color(_pode ? c_yellow : c_red);
    draw_text(_bx + _largura - _padding - 60, _ty + 10,
              string(_custo) + "G");
}

if variable_instance_exists(id, "loja_msg_timer") && loja_msg_timer > 0
{
    var _alpha = loja_msg_timer / 90;
    draw_set_alpha(_alpha);
    draw_set_color(loja_msg == "Comprado!" ? c_lime : c_red);
    draw_text_transformed(
        _bx + _largura / 2,
        _by - 32,
        loja_msg, 1, 1, 0
    );
    draw_set_alpha(1);
}

var _rodape_y = _by + _altura - _rodape_h - 8;
draw_set_color(make_color_rgb(80, 80, 80));
draw_line(_bx + 4, _rodape_y, _bx + _largura - 4, _rodape_y);
draw_set_color(make_color_rgb(160, 160, 160));
draw_text(_bx + _padding, _rodape_y + 8, "[E] Comprar   [Esc] Fechar");

draw_set_color(c_white);
draw_set_alpha(1);
