if (mostrar_botao)
{
    var _sx = x + 35;
    var _sy = y;

    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_roundrect(_sx - 50, _sy - 14, _sx + 50, _sy + 14, false);
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    if (global.banker_liberado)
    {
        draw_set_color(c_white);
        draw_text(_sx, _sy, "[E] Entrar");
    }
    else
    {
        draw_set_color(make_color_rgb(255, 80, 80));
        draw_text(_sx, _sy, "Wave em curso!");
    }

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}