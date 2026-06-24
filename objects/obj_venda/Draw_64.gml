var _gw    = display_get_gui_width();
var _gh    = display_get_gui_height();
var _inv   = obj_inventario;
var _total = array_length(_inv.itens);

draw_set_font(Font1);

var _padding  = 32;
var _lin_h    = 56;
var _titulo_h = 40;
var _rodape_h = 36;
var _largura  = _gw - 128;
var _altura   = _titulo_h + (max(_total, 1) * _lin_h) + _rodape_h + (_padding * 2);
var _bx       = 64;
var _by       = _gh - _altura - 32;

// Fundo
draw_rectangle_colour(_bx, _by, _bx + _largura, _by + _altura,
                      c_black, c_black, c_black, c_black, false);
draw_set_color(c_white);
draw_rectangle(_bx, _by, _bx + _largura, _by + _altura, true);

// Título
draw_set_color(c_yellow);
draw_text(_bx + _padding, _by + _padding, "Vender Itens");

// Ouro atual
draw_text(_bx + _largura - _padding - 120, _by + _padding,
          "Ouro: " + string(global.ouro));

// Linha separadora
draw_set_color(make_color_rgb(80, 80, 80));
draw_line(_bx + 4, _by + _padding + _titulo_h,
          _bx + _largura - 4, _by + _padding + _titulo_h);

// Sem itens
if (_total == 0)
{
    draw_set_color(make_color_rgb(180, 180, 180));
    draw_set_halign(fa_center);
    draw_text(_bx + _largura / 2, _by + _padding + _titulo_h + 20,
              "Nenhum item para vender.");
    draw_set_halign(fa_left);
}
else
{
    for (var _i = 0; _i < _total; _i++)
    {
        var _item  = _inv.itens[_i];
        var _ty    = _by + _padding + _titulo_h + 8 + (_i * _lin_h);
        var _tx    = _bx + _padding;
        var _ganho = _item.valor * _item.qtd;

        if (_i == venda_opcao)
        {
            draw_set_alpha(0.22);
            draw_set_color(c_yellow);
            draw_rectangle(_bx + 2, _ty, _bx + _largura - 2, _ty + _lin_h - 1, false);
            draw_set_alpha(1);
            draw_set_color(c_yellow);
            draw_text(_tx, _ty + 8, "> " + _item.nome);
        }
        else
        {
            draw_set_color(c_white);
            draw_text(_tx + 16, _ty + 8, _item.nome);
        }

        // Descrição
        draw_set_color(make_color_rgb(180, 180, 180));
        draw_text(_tx + 16, _ty + 28,
                  "Qtd: " + string(_item.qtd) +
                  "   Valor unit: " + string(_item.valor) + "G");

        // Total alinhado à direita
        draw_set_color(c_yellow);
        draw_text(_bx + _largura - _padding - 80, _ty + 16,
                  string(_ganho) + "G");
    }
}

// Mensagem de feedback
if (venda_msg_timer > 0)
{
    draw_set_alpha(venda_msg_timer / 90);
    draw_set_color(c_lime);
    draw_set_halign(fa_center);
    draw_text(_bx + _largura / 2, _by - 32, venda_msg);
    draw_set_halign(fa_left);
    draw_set_alpha(1);
}

// Rodapé
var _rodape_y = _by + _altura - _rodape_h - 8;
draw_set_color(make_color_rgb(80, 80, 80));
draw_line(_bx + 4, _rodape_y, _bx + _largura - 4, _rodape_y);
draw_set_color(make_color_rgb(160, 160, 160));
draw_text(_bx + _padding, _rodape_y + 8, "[E] Vender tudo   [Esc] Fechar");

draw_set_color(c_white);
draw_set_alpha(1);