draw_self();

// ← ADICIONA AQUI
if (mostrar_botao && !menu_ativo)
{
    var _texto = "[F] Interagir";
    var _sx = x + 18;
    var _sy = y - 20;
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_roundrect(_sx - 50, _sy - 14, _sx + 50, _sy + 14, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_sx, _sy, _texto);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// Só renderiza o menu quando ele estiver aberto
if (!menu_ativo) exit;
// ... resto do código do menu

// Só renderiza o menu quando ele estiver aberto
if (!menu_ativo) exit;

var _padding   = 16;          
var _lin_h     = 32;           
var _font      = Font1; 
var _cor_fundo = c_black;
var _cor_borda = c_white;
var _cor_texto = c_white;
var _cor_sel   = c_yellow;      
var _alpha_bg  = 0.80;

var _largura = 220;
var _rodape_h = 24;
var _altura  = (_padding * 2) + (menu_total * _lin_h) + _rodape_h;

var _bx = x + 16;
var _by = y - _altura - 12;

draw_set_alpha(_alpha_bg);
draw_set_color(_cor_fundo);
draw_rectangle(_bx, _by, _bx + _largura, _by + _altura, false);
draw_set_alpha(1);

draw_set_color(_cor_borda);
draw_rectangle(_bx, _by, _bx + _largura, _by + _altura, true);

if (_font != -1) draw_set_font(_font);

for (var _i = 0; _i < menu_total; _i++)
{
    var _tx = _bx + _padding;
    var _ty = _by + _padding + (_i * _lin_h);

    if (_i == menu_opcao)
    {
        // Destaque da opção selecionada
        draw_set_alpha(0.25);
        draw_set_color(_cor_sel);
        draw_rectangle(_bx + 2, _ty - 2, _bx + _largura - 2, _ty + _lin_h - 4, false);
        draw_set_alpha(1);

        // Seta indicadora
        draw_set_color(_cor_sel);
        draw_text(_tx, _ty + 4, "> " + menu_opcoes[_i]);
    }
    else
    {
        draw_set_color(_cor_texto);
        draw_text(_tx + 12, _ty + 4, menu_opcoes[_i]);
    }
}

draw_set_color(make_color_rgb(160, 160, 160));
draw_text(_bx + _padding, _by + _altura - _padding - 20, "[E] Confirmar  [Esc] Fechar");

draw_set_color(c_white);
draw_set_alpha(1);
if (_font != -1) draw_set_font(-1);