var _inv   = obj_inventario;
var _total = array_length(_inv.itens);

if (_total == 0)
{
    if (keyboard_check_pressed(vk_escape))
        instance_destroy();
    exit;
}

if keyboard_check_pressed(vk_up)
    venda_opcao = (venda_opcao - 1 + _total) mod _total;
if keyboard_check_pressed(vk_down)
    venda_opcao = (venda_opcao + 1) mod _total;

if keyboard_check_pressed(ord("E"))
{
    var _item  = _inv.itens[venda_opcao];
    var _ganho = _item.valor * _item.qtd;
    global.ouro += _ganho;

    venda_msg       = "Vendido por " + string(_ganho) + "G!";
    venda_msg_timer = 90;

    // Remove o item do inventário
    array_delete(_inv.itens, venda_opcao, 1);

    // Ajusta o índice se necessário
    var _novo_total = array_length(_inv.itens);
    if (_novo_total == 0)
        venda_opcao = 0;
    else
        venda_opcao = clamp(venda_opcao, 0, _novo_total - 1);
}

if (venda_msg_timer > 0)
    venda_msg_timer--;

if keyboard_check_pressed(vk_escape)
    instance_destroy();