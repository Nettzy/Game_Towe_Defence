
// ADICIONA ESSA VERIFICAÇÃO NO INÍCIO
if (!instance_exists(obj_inventario))
{
    instance_destroy();
    exit;
}

var _inv   = obj_inventario;
// ... resto do código continua igual

// Abre/fecha inventário
if (keyboard_check_pressed(vk_tab))
{
    aberto = !aberto;
    global.pausado = aberto;
    dropdown_aberto = false;
}

if (!aberto) exit;

// Posição do botão dropdown
var _btn_x = painel_x + painel_w - 180;
var _btn_y = painel_y + 16;
var _btn_w = 160;
var _btn_h = 28;

if (mouse_check_button_pressed(mb_left))
{
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    // Clique no botão principal
    if (_mx >= _btn_x && _mx <= _btn_x + _btn_w &&
        _my >= _btn_y && _my <= _btn_y + _btn_h)
    {
        dropdown_aberto = !dropdown_aberto;
    }
    // Clique numa opção
    else if (dropdown_aberto)
    {
        var _opcoes_ord = ["qtd", "raridade", "valor"];
        var _labels_ord = ["Peso", "Raridade", "Valor"];
        var _clicou = false;

        for (var _i = 0; _i < 3; _i++)
        {
            var _oy = _btn_y + _btn_h + _i * _btn_h;

            if (_mx >= _btn_x && _mx <= _btn_x + _btn_w &&
                _my >= _oy    && _my <= _oy + _btn_h)
            {
                ordem_atual = _labels_ord[_i];
                ordenar_itens(_opcoes_ord[_i]);
                _clicou = true;
            }
        }

        dropdown_aberto = false;
    }
}