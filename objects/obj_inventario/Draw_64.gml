if (!aberto) exit;

// Fundo escuro
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// Painel principal
draw_set_color(make_color_rgb(50, 50, 50));
draw_roundrect(painel_x, painel_y, painel_x + painel_w, painel_y + painel_h, false);

// Título
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(painel_x + 20, painel_y + 30, "Inventário");

// Slots da grade
var _start_x = painel_x + 20;
var _start_y = painel_y + 60;

for (var _l = 0; _l < linhas; _l++)
{
    for (var _c = 0; _c < colunas; _c++)
    {
        var _sx = _start_x + _c * (slot_size + slot_gap);
        var _sy = _start_y + _l * (slot_size + slot_gap);

        // Fundo do slot
        draw_set_color(make_color_rgb(35, 35, 35));
        draw_rectangle(_sx, _sy, _sx + slot_size, _sy + slot_size, false);

        // Borda do slot
        draw_set_color(make_color_rgb(70, 70, 70));
        draw_rectangle(_sx, _sy, _sx + slot_size, _sy + slot_size, true);

        var _index = _l * colunas + _c;
        if (_index < array_length(itens))
        {
            var _item = itens[_index];

            // Sprite centralizado
            if (_item.spr != -1)
            {
                var _escala_x = (slot_size - 8) / sprite_get_width(_item.spr);
                var _escala_y = (slot_size - 8) / sprite_get_height(_item.spr);
                var _escala   = min(_escala_x, _escala_y);

                draw_sprite_ext(
                    _item.spr, 0,
                    _sx + slot_size / 14,
                    _sy + slot_size / 14,
                    _escala, _escala,
                    0, c_white, 1
                );
            }

            // Quantidade embaixo
            draw_set_color(c_white);
            draw_set_halign(fa_center);
            draw_set_valign(fa_bottom);
            draw_text(_sx + slot_size / 1.2, _sy + slot_size + 1.2, "x" + string(_item.qtd));
        }
    }
}

// ---- Dropdown desenhado POR CIMA dos slots ----
var _btn_x = painel_x + painel_w - 180;
var _btn_y = painel_y + 16;
var _btn_w = 160;
var _btn_h = 28;

draw_set_color(make_color_rgb(70, 70, 70));
draw_rectangle(_btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h, false);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var _label = (ordem_atual == "") ? "Ordenar por ▼" : "Ordenar: " + ordem_atual + " ▼";
draw_text(_btn_x + 8, _btn_y + _btn_h / 2, _label);

if (dropdown_aberto)
{
    var _opcoes = ["Peso", "Raridade", "Valor"];
    for (var _i = 0; _i < 3; _i++)
    {
        var _oy = _btn_y + _btn_h + _i * _btn_h;
        var _mx = device_mouse_x_to_gui(0);
        var _my = device_mouse_y_to_gui(0);

        if (_mx >= _btn_x && _mx <= _btn_x + _btn_w &&
            _my >= _oy    && _my <= _oy + _btn_h)
            draw_set_color(make_color_rgb(100, 180, 255));
        else
            draw_set_color(make_color_rgb(55, 55, 55));

        draw_rectangle(_btn_x, _oy, _btn_x + _btn_w, _oy + _btn_h, false);
        draw_set_color(make_color_rgb(80, 80, 80));
        draw_rectangle(_btn_x, _oy, _btn_x + _btn_w, _oy + _btn_h, true);

        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_text(_btn_x + 8, _oy + _btn_h / 2, _opcoes[_i]);
    }
}

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);