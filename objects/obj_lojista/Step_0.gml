if (menu_ativo)
{
    if (keyboard_check_pressed(vk_up))
        menu_opcao = (menu_opcao - 1 + menu_total) mod menu_total;

    if (keyboard_check_pressed(vk_down))
        menu_opcao = (menu_opcao + 1) mod menu_total;

    // Confirma com E
    if (keyboard_check_pressed(ord("E")))
    {
        menu_ativo = false;

        switch (menu_opcao)
        {
            case 0:   // Diálogo
                var _dialogo = instance_create_layer(obj_player.x, obj_player.y, "Dialogo", obj_dialogo);
                _dialogo.npc_nome = nome;
            break;

            case 1:   // Loja
                instance_create_layer(obj_player.x, obj_player.y, "Dialogo", obj_loja);
            break;

            case 2:   // Vender itens
               
                show_message("Venda de itens em breve!");
            break;
        }
    }

    if (keyboard_check_pressed(vk_escape))
        menu_ativo = false;
}
