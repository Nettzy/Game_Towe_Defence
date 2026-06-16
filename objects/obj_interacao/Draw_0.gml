// NÃO chama draw_self() — esconde o retângulo vermelho

if (mostrar_botao)
{
    var _texto = "[E] Entrar";
    var _sx = x + 35;          // centralizado no obj_interacao
    var _sy = y;     // acima do objeto

    // Fundo do botão
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_roundrect(_sx - 50, _sy -14, _sx + 50, _sy + 14, false);

    // Texto
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_sx, _sy, _texto);

    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}