if (global.pausado) exit;
var _cx = display_get_gui_width() / 2;

// Cronômetro — só mostra se a wave já foi iniciada ao menos uma vez
if (wave_iniciada && (wave_ativa || (!wave_ativa && !wave_concluida)))
{
    var _segundos = max(0, ceil(wave_timer / room_speed));
    draw_set_color(make_color_rgb(30, 30, 30));
    draw_set_alpha(0.7);
    draw_roundrect(_cx - 80, 10, _cx + 80, 46, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_cx, 20, "Wave " + string(wave_atual));
    if (_segundos <= 10)
        draw_set_color(make_color_rgb(255, 80, 80));
    else
        draw_set_color(c_white);
    draw_text(_cx, 36, string(_segundos) + "s");
}

// Mensagem Wave Concluída
if (mostrar_mensagem)
{
    var _cy = display_get_gui_height() / 2;
    draw_set_color(make_color_rgb(20, 20, 20));
    draw_set_alpha(0.7);
    draw_roundrect(_cx - 120, _cy - 24, _cx + 120, _cy + 24, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(80, 220, 80));
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_cx, _cy, "Wave Concluída!");
}

// Mensagem Wave Perdida
if (instance_exists(obj_interacao) && obj_interacao.life <= 0)
{
    var _cy = display_get_gui_height() / 2;
    var _btn_w = 120;
    var _btn_h = 32;
    var _btn_gap = 20;
    var _btn_y = _cy + 50;
    var _btn_reiniciar_x = _cx - _btn_w - _btn_gap / 2;
    var _btn_sair_x = _cx + _btn_gap / 2;
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    draw_set_color(make_color_rgb(20, 20, 20));
    draw_set_alpha(0.7);
    draw_roundrect(_cx - 120, _cy - 24, _cx + 120, _cy + 24, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(220, 50, 50));
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_cx, _cy, "Wave Perdida!");
    // Botão Reiniciar
    if (_mx >= _btn_reiniciar_x && _mx <= _btn_reiniciar_x + _btn_w &&
        _my >= _btn_y && _my <= _btn_y + _btn_h)
        draw_set_color(make_color_rgb(80, 180, 80));
    else
        draw_set_color(make_color_rgb(50, 120, 50));
    draw_set_alpha(1);
    draw_rectangle(_btn_reiniciar_x, _btn_y, _btn_reiniciar_x + _btn_w, _btn_y + _btn_h, false);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_btn_reiniciar_x + _btn_w / 2, _btn_y + _btn_h / 2, "Reiniciar");
    // Botão Sair
    if (_mx >= _btn_sair_x && _mx <= _btn_sair_x + _btn_w &&
        _my >= _btn_y && _my <= _btn_y + _btn_h)
        draw_set_color(make_color_rgb(180, 60, 60));
    else
        draw_set_color(make_color_rgb(120, 40, 40));
    draw_rectangle(_btn_sair_x, _btn_y, _btn_sair_x + _btn_w, _btn_y + _btn_h, false);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_btn_sair_x + _btn_w / 2, _btn_y + _btn_h / 2, "Sair");
}

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);