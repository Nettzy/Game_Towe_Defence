if (place_meeting(x, y, obj_player))
{
    var _inv = obj_inventario;
    var _encontrou = false;
    
    for (var _i = 0; _i < array_length(_inv.itens); _i++)
    {
        if (_inv.itens[_i].nome == nome_item)
        {
            _inv.itens[_i].qtd += qtd;
            _inv.itens[_i].valor_total = _inv.itens[_i].valor * _inv.itens[_i].qtd;
            _encontrou = true;
            show_debug_message("Acumulou: " + nome_item + " qtd=" + string(_inv.itens[_i].qtd) + " valor_total=" + string(_inv.itens[_i].valor_total));
            break;
        }
    }
    
    if (!_encontrou)
    {
        var _novo = {
            nome:        nome_item,
            raridade:    raridade,
            valor:       valor,
            valor_total: valor * qtd,
            qtd:         qtd,
            spr:         spr_item
        };
        array_push(_inv.itens, _novo);
        show_debug_message("Novo item: " + nome_item + " valor_total=" + string(valor * qtd));
    }
    
    instance_destroy();
}