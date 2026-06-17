if keyboard_check_pressed(vk_up)
    loja_opcao = (loja_opcao - 1 + loja_total) mod loja_total;

if keyboard_check_pressed(vk_down)
    loja_opcao = (loja_opcao + 1) mod loja_total;

// Confirma compra com E
if keyboard_check_pressed(ord("E"))
{
    var _custo = loja_itens[loja_opcao][2];
    var _tipo  = loja_itens[loja_opcao][3];

    if global.ouro >= _custo
    {
        global.ouro -= _custo;

        var _arma = obj_player.arma;

        if _arma != noone
        {
            if _tipo == "velocidade"
            {
                // Reduz a espera entre tiros em 1 (mínimo 1 frame)
                _arma.espera_tiro = max(1, _arma.espera_tiro - 1);
            }
            else if _tipo == "dano"
            {
                // Garante que a variável dano existe antes de somar
                if !variable_instance_exists(_arma, "dano") _arma.dano = 0;
                _arma.dano += 2;
            }
        }

        loja_msg        = "Comprado!";
        loja_msg_timer  = 90; // frames que a mensagem fica visível
    }
    else
    {
        loja_msg        = "Ouro insuficiente!";
        loja_msg_timer  = 90;
    }
}

if variable_instance_exists(id, "loja_msg_timer") && loja_msg_timer > 0
    loja_msg_timer--;

if keyboard_check_pressed(vk_escape)
    instance_destroy();
